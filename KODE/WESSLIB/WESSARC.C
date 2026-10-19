    /*------------------------------------------------------------------*/
    /*
                     The Williams Entertainment Sound System
                     Sony Architecture Specific Routines
                            by Scott Patterson
    */
    /*------------------------------------------------------------------*/

#include <kernel.h>
#include <libspu.h>

extern void EnterCriticalSection(void);
extern void ExitCriticalSection(void);
extern long EnableEvent(unsigned long event);
extern long DisableEvent(unsigned long event);
extern long OpenEvent(unsigned long desc,long spec,long mode,long (*func)(void));
extern long CloseEvent(unsigned long event);
extern long SetRCnt(unsigned long spec,unsigned long target,long mode);
extern long StartRCnt(unsigned long spec);

#include "wessarc.h"
#include "wessapi.h"
#include "wessseq.h"
#include "psxspu.h"
#include "psxcd.h"

void (**CmdFuncArr[10])(track_status *) = {
    DrvFunctions,
    drv_cmds,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions
    };

short         GetIntsPerSec(void);
unsigned long CalcPartsPerInt(short ips,short ppq,short qpm);
static long WessInterruptHandler(void);
extern void SeqEngine(void);

int SeqOn = 0;
int WessTimerActive = 0;
int T2counter = 0;
volatile unsigned long millicount = 0;
unsigned long millisum = 0;
static unsigned long    EV2 = 0;

Wess_File_IO_Struct module_fileref;

// data loader stuff
//static unsigned long addr;
//static unsigned long size;

//#define MALLOC_MAX 1
//char spu_malloc_rec [SPU_MALLOC_RECSIZ * (MALLOC_MAX + 1)];

Wess_Data_IO_Struct data_fileref;

// sram transfer stuff

#define CHUNKSIZE 2048
extern char chunk1[CHUNKSIZE];
extern char chunk2[CHUNKSIZE];

#define SRAM_TO_ALLOC 520192

// while I thought end of sram should be 524288, it seems to be 520192
//#define END_O_SRAM 520192
extern unsigned long end_of_sram;

void wess_low_level_init(void)
{
    psxspu_init();
}

void wess_low_level_exit(void)
{
    return;
}

void *wess_malloc(int size)
{
    return 0;
}

void wess_free(char *mem)
{
    return;
}

short GetIntsPerSec(void)
{
    return(120);
}

unsigned long CalcPartsPerInt(short ips,short ppq,short qpm)
{
    unsigned long ppi;
	ppi = ((((unsigned long)qpm*0x10000)+((unsigned long)ips*30)+30)/((unsigned long)ips*60))*(unsigned long)ppq;
	return(ppi);
}

static long WessInterruptHandler(void)
{

    //printf("millicount %d\n",millicount);
    //printf("SeqOn %d\n",SeqOn);
    //printf("WessTimerActive %d\n",WessTimerActive);

    T2counter++;
    millisum += 0x85555;
    millicount += millisum >> 16;
    millisum &= 0xffff;

    psxspu_fadeengine();
    if (SeqOn)
    {
        //printf("SeqOn %d\n",SeqOn);
        SeqEngine();
    }
    return (0);
}

void init_WessTimer(void)
{
    //printf("init_WessTimer\n");

    SeqOn = 0;
	EnterCriticalSection();

	EV2 = OpenEvent(RCntCNT2, EvSpINT, EvMdINTR, WessInterruptHandler);
	EnableEvent(EV2);
	SetRCnt(RCntCNT2, 34722, RCntMdINTR);
	StartRCnt(RCntCNT2);

	WessTimerActive = 1;

	ExitCriticalSection();
}

void exit_WessTimer(void)
{
    psxspu_set_master_vol(psxspu_get_master_vol());
	psxspu_set_cd_vol(psxspu_get_cd_vol());

	EnterCriticalSection();

    WessTimerActive = 0;

    DisableEvent(EV2);
    CloseEvent(EV2);

    ExitCriticalSection();
}


//static SpuReverbAttr rev_attr;
int Wess_init_for_LoadFileData(char *filename)
{
    /*SpuInitMalloc (MALLOC_MAX, spu_malloc_rec);
    rev_attr.mask = SPU_REV_MODE;
    rev_attr.mode = SPU_REV_MODE_OFF;
    SpuSetReverbModeParam (&rev_attr);
    SpuSetReverbVoice (SpuOff, SPU_ALLCH);
    SpuReserveReverbWorkArea(SpuOff);
    SpuSetReverb (SpuOff);
    SpuMalloc (520192);
    SpuSetTransMode (SpuTransferByDMA);*/
    return(1);
}

Wess_File_IO_Struct *module_open(char *filename)
{
    Wess_File_IO_Struct *fp;

    fp = psxcd_open(filename);

    module_fileref = *fp;

    return(&module_fileref);
}

int module_read(void *destptr,int readbytes,Wess_File_IO_Struct *fileptr)
{
    return(psxcd_read(destptr,readbytes,fileptr));
}

int module_seek(Wess_File_IO_Struct *fileptr,int seekpos,int seekmode)
{
    return(psxcd_seek(fileptr,seekpos,seekmode));
}

unsigned long module_tell(Wess_File_IO_Struct *fileptr)
{
    return(psxcd_tell(fileptr));
}

void module_close(Wess_File_IO_Struct *fileptr)
{
    psxcd_close(fileptr);
}

int get_num_Wess_Sound_Drivers(int **settings_tag_lists)
{
    return(1);
}

Wess_Data_IO_Struct *data_open(char *filename)
{
    Wess_File_IO_Struct *fp;

    fp = psxcd_open(filename);

    data_fileref = *fp;

    return(&data_fileref);
}

int ReadChunk1;
int ReadChunk2;

void data_read_chunk(Wess_Data_IO_Struct *fileptr, int totaltogo, unsigned long spuptr)
{
    if (ReadChunk1)//Read to chunk1
	{
		psxcd_read(chunk1, totaltogo, fileptr);
		SpuSetTransferStartAddr(spuptr);
		SpuWrite(chunk1, totaltogo);
		ReadChunk2 = 1;
		ReadChunk1 = 0;
	}
	else
	{
		if (ReadChunk2)//Read to chunk2
		{
			psxcd_read(chunk2, totaltogo, fileptr);
			SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
			SpuSetTransferStartAddr(spuptr);
			SpuWrite(chunk2, totaltogo);
			ReadChunk2 = 0;
		}
		else//Read to chunk1
		{
			psxcd_read(chunk1, totaltogo, fileptr);
			SpuIsTransferCompleted(SPU_TRANSFER_WAIT);
			SpuSetTransferStartAddr(spuptr);
			SpuWrite(chunk1, totaltogo);
			ReadChunk2 = 1;
		}
	}
}

int data_read(Wess_Data_IO_Struct *fileptr,void *destptr,int readbytes,int filepos)
{
    int totaltogo;
	unsigned long spuptr;

	totaltogo = readbytes;
	spuptr = (unsigned long)destptr;

	if ((end_of_sram - spuptr) < readbytes)
	{
		return(0);
	}

	psxcd_seek(fileptr, filepos, PSXCD_SEEK_SET);

	ReadChunk1 = 1;
	while (CHUNKSIZE <= totaltogo)
	{
		data_read_chunk(fileptr, CHUNKSIZE, spuptr);

		totaltogo -= CHUNKSIZE;
		spuptr += CHUNKSIZE;
	}

	if (totaltogo)
	{
		data_read_chunk(fileptr, totaltogo, spuptr);
	}

	SpuIsTransferCompleted(SPU_TRANSFER_WAIT);

	return(readbytes);
}

void data_close(Wess_Data_IO_Struct *fileptr)
{
    psxcd_close(fileptr);
}
