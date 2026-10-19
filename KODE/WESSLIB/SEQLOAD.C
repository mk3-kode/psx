#include <libspu.h>
#include "wessarc.h"
#include "wessapi.h"
#include "seqload.h"
#define _ALIGN4_ 1

#include <stdio.h>

extern pmasterstat *pm_stat;

extern int seq_loader_enable;
extern char *loaderfile;
extern pmasterstat *ref_pm_stat;
extern int ref_max_seq_num;
extern char Driver_Init;
extern char Reset_Gates;
extern int	opencount;
extern int(*Seq_Error_func)(int, int);
extern int Seq_Error_module;
extern Wess_File_IO_Struct *fp_seq_file;

extern track_header scratch_trk_hdr;
extern track_header seq_track_header;
extern track_header base_track_header;

static void wess_seq_err(int code)
{
    if (Seq_Error_func) {
		Seq_Error_func(Seq_Error_module, code);
	}
}

void wess_seq_loader_install_error_handler(int (*error_func)(int, int), int module)
{
    Seq_Error_func = error_func;
	Seq_Error_module = module;
}

int Is_Seq_Seq_Num_Valid(int seqnum)
{
    if((seqnum<0)||(seqnum>=ref_max_seq_num))
    {
        return(0);
    }
    return(1);
}

int open_sequence_data(void)
{
    if (opencount == 0)
    {
        fp_seq_file = (Wess_File_IO_Struct *)module_open(loaderfile);
        if(fp_seq_file == 0)
        {
            wess_seq_err(SEQLOAD_FOPEN);
            return 0;
        }
    }

    opencount += 1;
    return 1;
}

void close_sequence_data(void)
{
    if (opencount == 1)
	{
		module_close(fp_seq_file);
	}
	if (opencount > 0)
	{
		opencount -= 1;
	}
}

int wess_seq_load_sub(int seqnum, void *memptr)
{
	sequence_data *psq_info;
	int numtracks, k, loadit, tracknum, readbytes;
	unsigned long trkstoload, seekpos;
	char *pmem;
	char *pstart;

	pmem = memptr;
	pstart = pmem;

	if (seq_loader_enable)
	{
		if (!Is_Seq_Seq_Num_Valid(seqnum))
			return 0;

		if (!open_sequence_data())
		{
			wess_seq_err(SEQLOAD_FOPEN);
			return 0;
		}

		psq_info = (ref_pm_stat->pmod_info->pseq_info+seqnum);
		trkstoload = psq_info->trkstoload;
		seekpos = psq_info->fileposition;
		psq_info->ptrk_info = (track_data *)pmem;

		if (trkstoload)
			pmem += (trkstoload * sizeof(track_data));
		else
			pmem += sizeof(track_data);

		if (module_seek(fp_seq_file, seekpos, PSXCD_SEEK_SET))
		{
			wess_seq_err(SEQLOAD_FSEEK);
			return 0;
		}

		readbytes = sizeof(seq_header);
		if (module_read(&(ref_pm_stat->pmod_info->pseq_info+seqnum)->seq_hdr, readbytes, fp_seq_file) != readbytes)
		{
			wess_seq_err(SEQLOAD_FREAD);
			return 0;
		}

		numtracks = (ref_pm_stat->pmod_info->pseq_info+seqnum)->seq_hdr.tracks;

		tracknum = 0;
		while (numtracks--)
		{
			readbytes = sizeof(track_header);
			if (module_read(&seq_track_header, readbytes, fp_seq_file) != readbytes)
			{
				wess_seq_err(SEQLOAD_FREAD);
				return 0;
			}

			loadit = 0;

			if ((seq_track_header.voices_type == NoSound_ID) ||
				(seq_track_header.voices_type == GENERIC_ID))
			{
				loadit = 1;
			}
			else
			{
				k = ref_pm_stat->patch_types_loaded;
				while (k--)
				{
					if ((seq_track_header.voices_type == (ref_pm_stat->ppat_info + k)->hw_tl_list.hardware_ID) &&
						(((seq_track_header.voices_class == SNDFX_CLASS) && (ref_pm_stat->ppat_info + k)->hw_tl_list.sfxload) ||
						 ((seq_track_header.voices_class == SFXDRUMS_CLASS) && (ref_pm_stat->ppat_info + k)->hw_tl_list.sfxload) ||
						 ((seq_track_header.voices_class == MUSIC_CLASS) && (ref_pm_stat->ppat_info + k)->hw_tl_list.musload) ||
						 ((seq_track_header.voices_class == DRUMS_CLASS) && (ref_pm_stat->ppat_info + k)->hw_tl_list.drmload)))
					{
						loadit = 1;
						break;
					}
				}
			}

			if (loadit)
			{
				((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr = seq_track_header;

				if (seq_track_header.voices_type == GENERIC_ID)
				{
					((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.voices_type = NoSound_ID;

					if (seq_track_header.voices_class == SNDFX_CLASS || seq_track_header.voices_class == SFXDRUMS_CLASS)
					{
						for (k = 0; k < ref_pm_stat->patch_types_loaded; k++)
						{
							if ((ref_pm_stat->ppat_info + k)->hw_tl_list.sfxload)
							{
								((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.voices_type = (ref_pm_stat->ppat_info + k)->hw_tl_list.hardware_ID;
								break;
							}
						}
					}
					else if (seq_track_header.voices_class == MUSIC_CLASS)
					{
						for (k = 0; k < ref_pm_stat->patch_types_loaded; k++)
						{
							if ((ref_pm_stat->ppat_info + k)->hw_tl_list.musload)
							{
								((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.voices_type = (ref_pm_stat->ppat_info + k)->hw_tl_list.hardware_ID;
								break;
							}
						}
					}
					else if (seq_track_header.voices_class == DRUMS_CLASS)
					{
						for (k = 0; k < ref_pm_stat->patch_types_loaded; k++)
						{
							if ((ref_pm_stat->ppat_info + k)->hw_tl_list.drmload)
							{
								((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.voices_type = (ref_pm_stat->ppat_info + k)->hw_tl_list.hardware_ID;
								break;
							}
						}
					}
				}

				((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->plabellist = (unsigned long *)pmem;
				pmem += (((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.labellist_count * sizeof(long));
				readbytes = (((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.labellist_count * sizeof(long));
				if (readbytes != module_read(((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->plabellist, readbytes, fp_seq_file))
				{
					wess_seq_err(SEQLOAD_FREAD);
					return 0;
				}

				((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->ptrk_data = (char *)pmem;
				pmem += (((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.data_size);
				pmem += (unsigned int)pmem & 1;
				pmem += (unsigned int)pmem & 2;
				readbytes = (((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->trk_hdr.data_size);
				if (readbytes != module_read(((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info+tracknum)->ptrk_data, readbytes, fp_seq_file))
				{
					wess_seq_err(SEQLOAD_FREAD);
					return 0;
				}
				tracknum++;
			}
			else
			{
				if (module_seek(fp_seq_file, (seq_track_header.labellist_count * sizeof(long)) + seq_track_header.data_size, PSXCD_SEEK_CUR))
				{
					wess_seq_err(SEQLOAD_FSEEK);
					return 0;
				}
			}
		}

		if (trkstoload)
		{
			(ref_pm_stat->pmod_info->pseq_info+seqnum)->seq_hdr.tracks = trkstoload;
		}
		else
		{
			(ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info->trk_hdr = base_track_header;
			(ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info->plabellist = (unsigned long *)pmem;
			(ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info->ptrk_data = (char *)pmem;
			pmem += (ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info->trk_hdr.data_size;
			*(ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info->ptrk_data = Driver_Init;
			*((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info->ptrk_data + 1) = Reset_Gates;
			pmem += (unsigned int)pmem & 1;
			pmem += (unsigned int)pmem & 2;
			(ref_pm_stat->pmod_info->pseq_info+seqnum)->seq_hdr.tracks = 1;
		}

		close_sequence_data();
	}

	return ((unsigned)pmem - (unsigned)pstart);
}

int wess_seq_loader_init(void *input_pm_stat, char *seqfile, enum OpenSeqHandleFlag flag)
{
	int seqload;

	seqload = 0;
	seq_loader_enable = 0;
	loaderfile = seqfile;
	ref_pm_stat = (pmasterstat *)input_pm_stat;

	if (ref_pm_stat)
	{
		seqload = 1;
		seq_loader_enable = 1;
		ref_max_seq_num = ref_pm_stat->pmod_info->mod_hdr.sequences;

		base_track_header.priority = 0x80;
		base_track_header.initvolume_cntrl = 0x7f;
		base_track_header.initpan_cntrl = 0x40;
		base_track_header.initppq = 120;
		base_track_header.initqpm = 120;
		base_track_header.voices_type = 0;
		base_track_header.voices_max = 0;
		base_track_header.reverb = 0;
		base_track_header.voices_class = 0;
		base_track_header.initpatchnum = 0;
		base_track_header.initpitch_cntrl = 0;
		base_track_header.substack_count = 0;
		base_track_header.mutebits = 0;
		base_track_header.labellist_count = 0;
		base_track_header.data_size = 2;

		if (flag == YesOpenSeqHandle)
		{
			if (!open_sequence_data())
			{
				wess_seq_err(SEQLOAD_FOPEN);
				return 0;
			}
		}
	}

	return seqload;
}

void wess_seq_loader_exit(void)
{
    close_sequence_data();
    seq_loader_enable = 0;
}

int wess_seq_sizeof(int seqnum)
{
	int seqsize;

	seqsize = 0;
	if (seq_loader_enable)
	{
		if (!Is_Seq_Seq_Num_Valid(seqnum))
			return 0;

		if ((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info == NULL)
			seqsize = (ref_pm_stat->pmod_info->pseq_info+seqnum)->trkinfolength;
	}
	return seqsize;
}

int wess_seq_load(int seqnum, void *memptr)
{
	int seqsize;

	seqsize = 0;
	if (seq_loader_enable)
	{
		if (!Is_Seq_Seq_Num_Valid(seqnum))
			return 0;

		if ((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info == NULL)
			seqsize = wess_seq_load_sub(seqnum, memptr);
	}
	return seqsize;
}

int wess_seq_free(int seqnum)
{
	int seqfree;

	seqfree = 0;
	if (seq_loader_enable)
	{
		if (!Is_Seq_Seq_Num_Valid(seqnum))
			return 0;

		if ((ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info != NULL)
		{
			(ref_pm_stat->pmod_info->pseq_info+seqnum)->ptrk_info = NULL;
			seqfree = 1;
		}
	}
	return seqfree;
}
