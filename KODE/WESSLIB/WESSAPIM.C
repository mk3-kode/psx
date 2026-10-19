#include "kernel.h"
#include "wessarc.h"
#include "wessapi.h"
#include "wessseq.h"

extern unsigned char	master_sfx_volume;
extern unsigned char	master_mus_volume;
extern unsigned char	pan_status;
extern unsigned char	release_rate;
extern pmasterstat      *pm_stat;
extern int              SeqOn;

char wess_master_sfx_volume_get (void)
{
#ifndef BLOCK_SOUND_WESS
    if (!Is_Module_Loaded())
	{
		return 0;
	}

	return (master_sfx_volume);
#endif
}

char wess_master_mus_volume_get (void)
{
#ifndef BLOCK_SOUND_WESS
    if (!Is_Module_Loaded())
	{
		return 0;
	}

	return (master_mus_volume);
#endif
}

void wess_master_sfx_vol_set (char volume)
{
#ifndef BLOCK_SOUND_WESS
    if (!Is_Module_Loaded())
	{
		return;
	}

	master_sfx_volume = volume;
#endif
}
void wess_master_mus_vol_set (char volume)
{
#ifndef BLOCK_SOUND_WESS
    char nt, na;
	sequence_status *psq_stat;
	track_status *ptmp;
	char *lpdest;
	char *temp;
	int li, lj;
	char action[8];

	if (!Is_Module_Loaded())
	{
		return;
	}

	master_mus_volume = volume;

	/* immediate pause of all sequences */
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
				li = psq_stat->tracks_active;
				lj = pm_stat->max_trks_perseq;
				/* *lpdest refers to an active track if not 0xFF */
				lpdest = psq_stat->ptrk_indxs;
				while (lj--)
				{
					if (*lpdest != 0xFF)
					{
						ptmp = (pm_stat->ptrkstattbl + (*lpdest));

						if (ptmp->sndclass == MUSIC_CLASS)
						{
						    temp = ptmp->ppos;
							ptmp->ppos = action;
							action[0] = 12;
							ptmp->ppos[1] = ptmp->volume_cntrl;
							CmdFuncArr[ptmp->patchtype][12](ptmp);
							ptmp->ppos = temp;
						}
						if (!--li) break;
					}
					lpdest++;
				}

				if (!--na) break;
			}
			psq_stat++;
		}
	}

	SeqOn = 1;
#endif
}

char wess_pan_mode_get (void)
{
#ifndef BLOCK_SOUND_WESS
    return pan_status;
#endif
}

void wess_pan_mode_set (char mode)
{
#ifndef BLOCK_SOUND_WESS
    pan_status = mode;
#endif
}
