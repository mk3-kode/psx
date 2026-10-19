#include <libspu.h>
#include "wessarc.h"
#include "psxcd.h"
#include "psxspu.h"
#include "wessapi.h"
#include "lcdload.h"

typedef enum {false, true} boolean;

extern void CdFlush(void);

extern void psxcd_disable_callbacks(void);
extern void psxcd_enable_callbacks(void);

extern int lcd_open;
extern char *lcd_ppat_data_patches;
extern char *lcd_ppat_data_patchmaps;
extern char *lcd_ppat_data_patchinfo;
extern char *lcd_ppat_data_track;
extern patch_group_data *lcd_ppat_info;
extern unsigned long lcd_sample_pos;
extern int lcd_sectorbuf_pos;
extern int lcd_totaltogo;

extern unsigned short lcd_sectorbuf_code ;
extern char *lcd_sectorbuf;

extern int lcd_cd_status;

extern int  lcd_sync_intr;
extern char lcd_sync_result[8];

extern Wess_Data_IO_Struct lcd_data_fileref;

#define CHUNKSIZE 2048
extern char chunk1[CHUNKSIZE];
extern char chunk2[CHUNKSIZE];

int wess_dig_lcd_loader_init(void *input_pm_stat)
{
    pmasterstat *pm_stat;
	int k, types, loaded;

	pm_stat = input_pm_stat;

	lcd_open = 0;
	loaded = 0;
	if (!pm_stat)
		return 0;

	types = pm_stat->pmod_info->mod_hdr.patch_types_infile;
	for (k = 0; k < types; k++)
	{
		if ((pm_stat->ppat_info + k)->pat_grp_hdr.patch_id == SNDHW_TAG_DRIVER_ID)
		{
			lcd_ppat_info = (pm_stat->ppat_info + k);
			break;
		}
	}

	if (lcd_ppat_info)
	{
		loaded = 1;
			lcd_open = 1;
			lcd_ppat_data_patches = lcd_ppat_info->ppat_data;
			lcd_ppat_data_patchmaps = lcd_ppat_data_patches + (lcd_ppat_info->pat_grp_hdr.patches * sizeof(patches_header));
			lcd_ppat_data_patchinfo = lcd_ppat_data_patchmaps + (lcd_ppat_info->pat_grp_hdr.patchmaps * sizeof(patchmaps_header));
			lcd_ppat_data_track = lcd_ppat_data_patchinfo + (lcd_ppat_info->pat_grp_hdr.patchinfo * sizeof(patchinfo_header));
	}
	return loaded;
}

void wess_dig_set_sample_position(int samplenum, char *samplepos)
{
    patchinfo_header *patchinfo;

	if (lcd_ppat_data_patchinfo)
	{
		patchinfo = (patchinfo_header *) (lcd_ppat_data_patchinfo + (samplenum * sizeof(patchinfo_header)));
		patchinfo->sample_pos = (unsigned long)samplepos;
	}
}

Wess_Data_IO_Struct *wess_dig_lcd_data_open(char *filename)
{
    Wess_File_IO_Struct *fp;

	fp = psxcd_open(filename);

	lcd_data_fileref = *fp;

	return(&lcd_data_fileref);
}

#define LCD_SAMPLENUM (((unsigned short *)lcd_sectorbuf)[lcd_sectorbuf_pos])
#define LCD_PATCHINFO ((patchinfo_header *)(lcd_ppat_data_patchinfo + (LCD_SAMPLENUM * sizeof(patchinfo_header))))

int wess_dig_lcd_data_read(unsigned char *buffer,void *destptr, SampleBlock *sampblk, int override)
{
	int totaltogo, readbytes;
	unsigned long spuptr;

	spuptr = 0;
	readbytes = 0;
	totaltogo = CHUNKSIZE;

	do
	{
		if (lcd_totaltogo == 0)
		{
			if (lcd_sectorbuf_pos > 0)
			{
				if (!(LCD_PATCHINFO->sample_pos) || override)
				{
					LCD_PATCHINFO->sample_pos = lcd_sample_pos;
					if (sampblk)
					{
						sampblk->sampindx[sampblk->numsamps] = LCD_SAMPLENUM;
						sampblk->samppos[sampblk->numsamps] = LCD_PATCHINFO->sample_pos >> 3;
						sampblk->numsamps++;
					}
				}
			}

			if (lcd_sectorbuf_pos >= lcd_sectorbuf_code)
				return readbytes;

			lcd_sectorbuf_pos++;
			lcd_totaltogo = LCD_PATCHINFO->sample_size;
			lcd_sample_pos = (unsigned long)destptr + spuptr;

			if (((end_of_sram - (unsigned long)destptr) + spuptr) < lcd_totaltogo)
			{
				lcd_sectorbuf_pos--;
				lcd_totaltogo = 0;
				return readbytes;
			}

			if (totaltogo == 0)
				return readbytes;
		}

		if (totaltogo <= lcd_totaltogo)
		{
			if (!(LCD_PATCHINFO->sample_pos) || override)
			{
				SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
				SpuSetTransferStartAddr((unsigned long)destptr + spuptr);
				SpuWrite(buffer + spuptr, totaltogo);
				readbytes += totaltogo;
			}
			spuptr += totaltogo;
			lcd_totaltogo -= totaltogo;
			totaltogo = 0;
		}
		else
		{
			if (!(LCD_PATCHINFO->sample_pos) || override)
			{
				SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
				SpuSetTransferStartAddr((unsigned long)destptr + spuptr);
				SpuWrite(buffer + spuptr, lcd_totaltogo);
				readbytes += lcd_totaltogo;
			}
			spuptr += lcd_totaltogo;
			totaltogo -= lcd_totaltogo;
			lcd_totaltogo = 0;
		}
	} while (totaltogo || !lcd_totaltogo);

	return readbytes;
}

int wess_dig_lcd_psxcd_sync(void)
{
    unsigned long block;

	block = millicount;
	block += 8000;

	while (millicount < block)
	{
		lcd_sync_intr = CdSync(1, (u_char *)&lcd_sync_result);

		if (lcd_sync_intr == CdlDiskError)
		{
			CdFlush();
			return 1;
		}

		if (lcd_sync_intr == CdlComplete) return 0;
	}

	return 1;
}

int wess_dig_lcd_load(char *lcdfilename, void *memptr, SampleBlock *sampblk, int override)
{
	Wess_File_IO_Struct *fileptr;
	char *destptr;
	int countbytes, bytestocopy, readbytes;
	boolean read1, read2;

	psxcd_disable_callbacks();

ReadAgain:
	for (;;)
	{
	lcd_sectorbuf_pos = 0;
	lcd_totaltogo = 0;
	readbytes = 0;

	psxcd_init_pos();
	psxcd_set_data_mode();

	fileptr = wess_dig_lcd_data_open(lcdfilename);
	destptr = memptr;

	if (*(int *)&fileptr->file.pos == 0)
		return 0;

	bytestocopy = fileptr->file.size;

	CdIntToPos(CdPosToInt(&fileptr->file.pos), &fileptr->new_io_loc);
	CdControl(CdlSetloc, (u_char *)&fileptr->new_io_loc, 0);
	CdControl(CdlReadN, (u_char *)&fileptr->new_io_loc, 0);
	do
	{
		lcd_cd_status = CdReady(1, 0);
		if (lcd_cd_status == CdlDataReady) goto DataReady1;
	} while (lcd_cd_status != CdlDiskError);
	CdFlush();
DataReady1:
	if (lcd_cd_status == CdlDiskError) continue;

	CdGetSector((u_long *)&sectorbuf, CHUNKSIZE / 4);
	lcd_sectorbuf_code = *(unsigned short *)sectorbuf;
	lcd_sectorbuf = (char *)&sectorbuf;
	if (SAMPLE_RECORD_SIZE < lcd_sectorbuf_code) continue;

	if (bytestocopy < CHUNKSIZE)
		bytestocopy = 0;
	else
		bytestocopy += -CHUNKSIZE;

	read1 = true;
	read2 = true;
	while (bytestocopy != 0)
	{
		if (read1)
		{
			do
			{
				lcd_cd_status = CdReady(1, 0);
				if (lcd_cd_status == CdlDataReady) goto DataReady2;
			} while (lcd_cd_status != CdlDiskError);
			CdFlush();
		DataReady2:
			if (lcd_cd_status == CdlDiskError) goto ReadAgain;

			CdGetSector((u_long *)&chunk1, CHUNKSIZE / 4);

			if (bytestocopy < CHUNKSIZE)
				bytestocopy = 0;
			else
				bytestocopy += -CHUNKSIZE;

			countbytes = wess_dig_lcd_data_read(chunk1, destptr, sampblk, override);
			readbytes += countbytes;
			destptr += countbytes;
			read2 = true;
			read1 = false;
		}
		else
		{
			if (read2)
			{
				do
				{
					lcd_cd_status = CdReady(1, 0);
					if (lcd_cd_status == CdlDataReady) goto DataReady3;
				} while (lcd_cd_status != CdlDiskError);
				CdFlush();
			DataReady3:
				if (lcd_cd_status == CdlDiskError) goto ReadAgain;

				CdGetSector((u_long *)&chunk2, CHUNKSIZE / 4);

				if (bytestocopy < CHUNKSIZE)
					bytestocopy = 0;
				else
					bytestocopy += -CHUNKSIZE;

				SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
				countbytes = wess_dig_lcd_data_read(chunk2, destptr, sampblk, override);
				readbytes += countbytes;
				destptr += countbytes;
				read2 = false;
			}
			else
			{
				do
				{
					lcd_cd_status = CdReady(1, 0);
					if (lcd_cd_status == CdlDataReady) goto DataReady4;
				} while (lcd_cd_status != CdlDiskError);
				CdFlush();
			DataReady4:
				if (lcd_cd_status == CdlDiskError) goto ReadAgain;

				CdGetSector((u_long *)&chunk1, CHUNKSIZE / 4);

				if (bytestocopy < CHUNKSIZE)
					bytestocopy = 0;
				else
					bytestocopy += -CHUNKSIZE;

				SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
				countbytes = wess_dig_lcd_data_read(chunk1, destptr, sampblk, override);
				readbytes += countbytes;
				destptr += countbytes;
				read2 = true;
			}
		}
	}

	if (lcd_cd_status != CdlDiskError)
	{
		CdControl(CdlPause, 0, 0);
		if (wess_dig_lcd_psxcd_sync() == 0)
		{
			SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
			psxcd_enable_callbacks();
			return (readbytes);
		}
	}
	}
}
