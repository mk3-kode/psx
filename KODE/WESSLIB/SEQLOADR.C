#include <libspu.h>
#include "wessarc.h"
#include "wessapi.h"
#include "seqload.h"
#define _ALIGN4_ 1

#include <stdio.h>

extern pmasterstat *pm_stat;

extern int seq_loader_enable;
extern char *seqfilename;
extern pmasterstat *seq_pm_stat;
extern int seq_maxsequences;
extern char Driver_Init;
extern char Reset_Gates;
extern int	seqopen;
extern int(*Seq_Error_func)(int, int);
extern int Seq_Error_module;
extern Wess_File_IO_Struct *seqfileptr;

extern track_header scratch_trk_hdr;
extern track_header seq_track_header;
extern track_header base_track_header;

int wess_seq_range_sizeof(int seqfirst, int numseqs)
{
	int count;
	int seqnum;

	count = 0;
	if (seq_loader_enable)
	{
		seqnum = seqfirst;
		if (numseqs == 0)
			return 0;

		while (numseqs--)
		{
			count += wess_seq_sizeof(seqnum);
			seqnum += 1;
		}
	}
	return (count);
}

int wess_seq_range_load(int seqfirst, int numseqs, void *memptr)
{
    int count;
    char *pmem;

    pmem = (char *)memptr;

	count = 0;
	if (seq_loader_enable)
	{
		if (!open_sequence_data() || !numseqs)
			return 0;

		while (numseqs--)
		{
			count += wess_seq_load(seqfirst, pmem+count);
			seqfirst += 1;
		}

		close_sequence_data();
	}

	return count;
}

int wess_seq_range_free(int seqfirst, int numseqs)
{
	int seqfree;
	int seqnum;

	seqfree = 0;
	if (seq_loader_enable)
	{
		seqnum = seqfirst;
		if (numseqs == 0)
			return 0;

		while (numseqs--)
		{
			wess_seq_free(seqnum);
			seqnum += 1;
			seqfree = 1;
		}
	}
	return seqfree;
}
