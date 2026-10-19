#include "kernel.h"
#include "wessarc.h"
#include "wessapi.h"
#include "wessseq.h"

extern int num_sd;
extern char *wmd_file_ptr;
extern char *wmd_file_ptr2;
extern Wess_File_IO_Struct *fp_wmd_file;
extern int sysinit;
extern int module_loaded;
extern int early_exit;
extern int max_seq_num;
extern int mem_limit;
extern patch_group_header scratch_pat_grp_hdr;
extern track_header scratch_trk_hdr;
extern int wmd_mem_is_mine;
extern char *wmd_mem;
extern char *wmd_end;
extern int wmd_size;
extern int (*Error_func)(int, int);
extern int Error_module;
extern pmasterstat *pm_stat;

void updatetrackstat(track_status *ptk_stat, TriggerPlayAttr *attr)
{
	int tempmask;
	char *temp;
	char action[8];

	if ((attr == NULL) || (!attr->mask))
		return;

	tempmask = attr->mask;

	if (tempmask & TRIGGER_VOLUME)
	{
		ptk_stat->volume_cntrl = attr->volume;
	}

	if (tempmask & TRIGGER_PAN)
	{
		ptk_stat->pan_cntrl = attr->pan;
	}

	if (tempmask & (TRIGGER_VOLUME | TRIGGER_PAN))
	{
		ptk_stat->volume_cntrl = attr->volume;
		ptk_stat->pan_cntrl = attr->pan;

		temp = ptk_stat->ppos;
		ptk_stat->ppos = action;
		action[0] = 12;
		ptk_stat->ppos[1] = ptk_stat->volume_cntrl;
		CmdFuncArr[ptk_stat->patchtype][12](ptk_stat);
		ptk_stat->ppos = temp;
	}
	else
	{
		if (tempmask & TRIGGER_VOLUME)
		{
			ptk_stat->volume_cntrl = attr->volume;

			temp = ptk_stat->ppos;
			ptk_stat->ppos = action;
			action[0] = 12;
			ptk_stat->ppos[1] = ptk_stat->volume_cntrl;
			CmdFuncArr[ptk_stat->patchtype][12](ptk_stat);
			ptk_stat->ppos = temp;
		}
		else if (tempmask & TRIGGER_PAN)
		{
			ptk_stat->pan_cntrl = attr->pan;

			temp = ptk_stat->ppos;
			ptk_stat->ppos = action;
			action[0] = 13;
			ptk_stat->ppos[1] = ptk_stat->pan_cntrl;
			CmdFuncArr[ptk_stat->patchtype][13](ptk_stat);
			ptk_stat->ppos = temp;
		}
	}

	if (tempmask & TRIGGER_PATCH)
	{
		ptk_stat->patchnum = attr->patch;
	}

	if (tempmask & TRIGGER_PITCH)
	{
		ptk_stat->pitch_cntrl = attr->pitch;

		temp = ptk_stat->ppos;
		ptk_stat->ppos = action;
		action[0] = 9;
		ptk_stat->ppos[1] = (char)(ptk_stat->pitch_cntrl & 0xff);
		ptk_stat->ppos[2] = (char)(ptk_stat->pitch_cntrl >> 8);
		CmdFuncArr[ptk_stat->patchtype][9](ptk_stat);
		ptk_stat->ppos = temp;
	}

	if (tempmask & TRIGGER_MUTEMODE)
	{
		if (ptk_stat->mutemask & (1 << attr->mutemode))
		{
			ptk_stat->mute = 1;
		}
		else {
			ptk_stat->mute = 0;
		}
	}

	if (tempmask & TRIGGER_TEMPO)
	{
		ptk_stat->qpm = attr->tempo;
		ptk_stat->ppi = CalcPartsPerInt(GetIntsPerSec(),
			ptk_stat->ppq,
			ptk_stat->qpm);
	}

	if (tempmask & TRIGGER_TIMED)
	{
		ptk_stat->endppi = ptk_stat->totppi + attr->timeppq;
		ptk_stat->timed = 1;
	}

	if (tempmask&TRIGGER_LOOPED)
	{
		ptk_stat->looped = 1;
	}
}

void wess_seq_trigger_type (int seq_num, unsigned long seq_type)
{
#ifndef BLOCK_SOUND_WESS

    sequence_data *psq_info;

    psq_info = pm_stat->pmod_info->pseq_info+seq_num; /* pointer math */

    wess_seq_structrig (psq_info, seq_num, seq_type, NoHandle, NULL);
#endif
}

void wess_seq_trigger_type_special (int              seq_num,
                                    unsigned long    seq_type,
                                    TriggerPlayAttr *attr)
{
#ifndef BLOCK_SOUND_WESS

    sequence_data *psq_info;

    psq_info = pm_stat->pmod_info->pseq_info+seq_num; /* pointer math */

    wess_seq_structrig (psq_info, seq_num, seq_type, NoHandle, attr);
#endif
}

void wess_seq_update_type_special(unsigned long seq_type, TriggerPlayAttr *attr)
{
#ifndef BLOCK_SOUND_WESS

	/* immediate stop of sequence */
	char nt, na;
	sequence_status *psq_stat;
	track_status *ptmp;
	char *lpdest;
	int li, lj;

	if (!Is_Module_Loaded())
	{
		return;
	}

	SeqOn = 0;

	/* search for all sequences with this number and turn them off */
	nt = pm_stat->pmod_info->mod_hdr.seq_work_areas;
	na = pm_stat->seqs_active;
	psq_stat = pm_stat->pseqstattbl;
	if (na)
	{
		while (nt--)
		{
			if (psq_stat->active)
			{
				if (psq_stat->seq_type == seq_type)
				{
					li = psq_stat->tracks_active;
					lj = pm_stat->max_trks_perseq;
					/* *lpdest refers to an active track if not 0xFF */
					lpdest = psq_stat->ptrk_indxs;
					while (lj--)
					{
						if (*lpdest != 0xFF)
						{
							ptmp = (pm_stat->ptrkstattbl + (*lpdest));
							if (attr != 0)
							{
								updatetrackstat(ptmp, attr);
							}
							if (!--li) break;
						}
						lpdest++;
					}
				}
				if (!--na) break;
			}
			psq_stat++;
		}
	}

	SeqOn = 1;
#endif
}

void wess_seq_stoptype (unsigned long type_number)
{
#ifndef BLOCK_SOUND_WESS

    /* immediate stop of sequence */
    char nt,na;
    sequence_status *psq_stat;
    track_status *ptmp;
    char *lpdest;
    int li,lj;

    if(!Is_Module_Loaded())
    {
        return;
    }

    SeqOn = 0;

    /* search for all sequences with this number and turn them off */
    nt = pm_stat->pmod_info->mod_hdr.seq_work_areas;
    na = pm_stat->seqs_active;
    psq_stat = pm_stat->pseqstattbl;
    if(na)
    {
        while(nt--)
        {
            if (psq_stat->active)
            {
                if(psq_stat->seq_type==type_number)
                {
                    li = psq_stat->tracks_active;
                    lj = pm_stat->max_trks_perseq;
                    /* *lpdest refers to an active track if not 0xFF */
                    lpdest = psq_stat->ptrk_indxs;
                    while(lj--)
                    {
                        if(*lpdest!=0xFF)
                        {
                            ptmp = (pm_stat->ptrkstattbl+(*lpdest));
                            CmdFuncArr[ptmp->patchtype][TrkOff](ptmp);
                            if(!--li) break;
                        }
                        lpdest++;
                    }
                }
                if(!--na) break;
            }
            psq_stat++;
        }
    }

    SeqOn = 1;
#endif
}
