#include "wessseq.h"

extern void (**CmdFuncArr[10])(track_status *);
extern void(*DrvFunctions[36])();

char *Read_Vlq(char *pstart, void *deltatime);
char *Write_Vlq(char *dest, unsigned int deltatime);
int Len_Vlq(unsigned int deltatime);

void Eng_DriverInit (master_status_structure *pm_stat);
void Eng_DriverExit (track_status *ptk_stat);
void Eng_DriverEntry1 (track_status *ptk_stat);
void Eng_DriverEntry2 (track_status *ptk_stat);
void Eng_DriverEntry3 (track_status *ptk_stat);
void Eng_TrkOff (track_status *ptk_stat);
void Eng_TrkMute (track_status *ptk_stat);
void Eng_PatchChg (track_status *ptk_stat);
void Eng_PatchMod (track_status *ptk_stat);
void Eng_PitchMod (track_status *ptk_stat);
void Eng_ZeroMod (track_status *ptk_stat);
void Eng_ModuMod (track_status *ptk_stat);
void Eng_VolumeMod (track_status *ptk_stat);
void Eng_PanMod (track_status *ptk_stat);
void Eng_PedalMod (track_status *ptk_stat);
void Eng_ReverbMod (track_status *ptk_stat);
void Eng_ChorusMod (track_status *ptk_stat);
void Eng_NoteOn (track_status *ptk_stat);
void Eng_NoteOff (track_status *ptk_stat);
void Eng_StatusMark (track_status *ptk_stat);
void Eng_GateJump (track_status *ptk_stat);
void Eng_IterJump (track_status *ptk_stat);
void Eng_ResetGates (track_status *ptk_stat);
void Eng_ResetIters (track_status *ptk_stat);
void Eng_WriteIterBox (track_status *ptk_stat);
void Eng_SeqTempo (track_status *ptk_stat);
void Eng_SeqGosub (track_status *ptk_stat);
void Eng_SeqJump (track_status *ptk_stat);
void Eng_SeqRet (track_status *ptk_stat);
void Eng_SeqEnd (track_status *ptk_stat);
void Eng_TrkTempo (track_status *ptk_stat);
void Eng_TrkGosub (track_status *ptk_stat);
void Eng_TrkJump (track_status *ptk_stat);
void Eng_TrkRet (track_status *ptk_stat);
void Eng_TrkEnd (track_status *ptk_stat);
void Eng_NullEvent (track_status *ptk_stat);

extern void(*DrvFunctions[36])();

extern unsigned char                skip_table[72];

extern unsigned char	            master_sfx_volume;
extern unsigned char	            master_mus_volume;
extern unsigned char	            pan_status;
extern unsigned char	            release_rate;

extern unsigned long	            voice_flags1;
extern unsigned long	            voice_flags2;
extern NoteState		            *ptr_notestate;
extern voice_status	                *ptr_pvoicestattbl;
extern unsigned long	            priority;
extern unsigned long	            max_pabstime;

extern master_status_structure		*drv_pmsbase;
extern sequence_status				*drv_pssbase;
extern track_status				    *drv_ptsbase;
extern unsigned long				drv_hwvl;
extern patch_group_data			    *drv_ppgd;
extern unsigned long				*drv_pcurabstime;
extern patches_header				*drv_patchesbase;
extern patchmaps_header			    *drv_patchmapsbase;
extern patchinfo_header			    *drv_samplesbase;
extern char						    *drv_drummapsbase;
extern SpuVoiceAttr				    drv_outattr;

extern unsigned char				drv_nvst;
extern unsigned char				drv_npti;
extern long				drv_cnt;
extern voice_status				    *drv_pvsbase;

extern voice_status				    *drv_pcurvs;

extern unsigned char				drv_channels[24];

//-----------------------------------------------------------
// Vlq System
//-----------------------------------------------------------

extern unsigned int data01;
extern unsigned char data02;

char *Read_Vlq(char *pstart, void *deltatime)
{
	data01 = *pstart++;
	if (data01 & 0x80)
	{
		data01 &= 0x7f;
		do
		{
			data01 = (data01 << 7) + ((data02 = *pstart++) & 0x7f);
		} while (data02 & 0x80);
	}
	*(int*)deltatime = data01;

	return pstart;
}

char *Write_Vlq(char *dest, unsigned int deltatime)
{
	char data[16];
	char *ptr;

    data[0] = (deltatime & 0x7f);
	ptr = (char*)&data+1;

	deltatime >>= 7;
	if (deltatime)
	{
		do
		{
			*ptr++ = ((deltatime & 0x7f) | 0x80);
			deltatime >>= 7;
		} while (deltatime);
	}

	do
	{
		ptr--;
		*dest++ = *ptr;
	} while (*ptr & 0x80);

	return dest;
}

int Len_Vlq(unsigned int deltatime)
{
	char data[16];
	char start[16];
	char *ptr, *dest;

	dest = start;
	data[0] = (deltatime & 0x7f);
	ptr = (char*)&data+1;

	deltatime >>= 7;
	if (deltatime)
	{
		do
		{
			*ptr++ = ((deltatime & 0x7f) | 0x80);
			deltatime >>= 7;
		} while (deltatime);
	}

	do
	{
		ptr--;
		*dest++ = *ptr;
	} while (*ptr & 0x80);

	return (unsigned char)(dest - start);
}

//-----------------------------------------------------------
// Engine System
//-----------------------------------------------------------

extern unsigned char			 eng_ntwa;
extern track_status			    *eng_ptsbase;
extern sequence_status			*eng_pssbase;
extern master_status_structure  *eng_pmsbase;

void Eng_DriverInit (master_status_structure *pm_stat)
{
    //printf("Eng_DriverInit\n");
	eng_pmsbase = pm_stat;
	eng_ptsbase = pm_stat->ptrkstattbl;
	eng_pssbase = pm_stat->pseqstattbl;
	eng_ntwa = pm_stat->pmod_info->mod_hdr.trk_work_areas;
}

void Eng_DriverExit (track_status *ptk_stat)
{
    //printf("Eng_DriverExit\n");
}

void Eng_DriverEntry1 (track_status *ptk_stat)
{
    //printf("Eng_DriverEntry1\n");
}

void Eng_DriverEntry2 (track_status *ptk_stat)
{
    //printf("Eng_DriverEntry2\n");
}

void Eng_DriverEntry3 (track_status *ptk_stat)
{
    //printf("Eng_DriverEntry3\n");
}

extern sequence_status			*eng_seq_stat_1;
extern char					    *eng_ptrk_indxs1;
extern unsigned long			eng_max_trks_perseq1;

void Eng_TrkOff (track_status *ptk_stat)
{
	sequence_status			*seq_stat;
	//printf("Eng_TrkOff\n");

	seq_stat = (eng_pmsbase->pseqstattbl + ptk_stat->seq_owner);
	eng_seq_stat_1 = seq_stat;

	if ((!ptk_stat->stopped))
	{
		ptk_stat->stopped = 1;

		if (!--seq_stat->tracks_playing)
		{
			eng_seq_stat_1->playmode = 0;
		}
	}

	if ((!ptk_stat->handled))
	{
		eng_max_trks_perseq1 = eng_pmsbase->max_trks_perseq;
		eng_ptrk_indxs1 = eng_seq_stat_1->ptrk_indxs;

		while (eng_max_trks_perseq1--)
		{
			if (*eng_ptrk_indxs1 == ptk_stat->refindx)
			{
				*eng_ptrk_indxs1++ = 0xFF;
				break;
			}
			eng_ptrk_indxs1++;
		}

		ptk_stat->active = 0;

		eng_pmsbase->trks_active--;
		if (!--eng_seq_stat_1->tracks_active)
		{
			eng_seq_stat_1->active = 0;
			eng_pmsbase->seqs_active--;
		}
	}

	ptk_stat->timed = 0;
}

void Eng_TrkMute (track_status *ptk_stat)
{
    //printf("Eng_TrkMute\n");
}

extern unsigned char			eng_patchnum;

void Eng_PatchChg (track_status *ptk_stat)
{
    //printf("Eng_PatchChg\n");
	eng_patchnum = *(ptk_stat->ppos + 1);
	ptk_stat->patchnum = eng_patchnum;
}

void Eng_PatchMod (track_status *ptk_stat)
{
    //printf("Eng_PatchMod\n");
}

extern short			        eng_pitch_cntrl;

void Eng_PitchMod (track_status *ptk_stat)
{
    //printf("Eng_PitchMod\n");
	eng_pitch_cntrl = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));
	ptk_stat->pitch_cntrl = eng_pitch_cntrl;
}

void Eng_ZeroMod (track_status *ptk_stat)
{
    //printf("Eng_ZeroMod\n");
}

void Eng_ModuMod (track_status *ptk_stat)
{
    //printf("Eng_ModuMod\n");
}

extern unsigned char			eng_volume_cntrl;

void Eng_VolumeMod (track_status *ptk_stat)
{
    //printf("Eng_VolumeMod\n");
	eng_volume_cntrl = *(ptk_stat->ppos + 1);
	ptk_stat->volume_cntrl = eng_volume_cntrl;
}

extern unsigned char			eng_pan_cntrl;

void Eng_PanMod (track_status *ptk_stat)
{
    //printf("Eng_PanMod\n");
	eng_pan_cntrl = *(ptk_stat->ppos + 1);
	ptk_stat->pan_cntrl = eng_pan_cntrl;
}

void Eng_PedalMod (track_status *ptk_stat)
{
    //printf("Eng_PedalMod\n");
}

void Eng_ReverbMod (track_status *ptk_stat)
{
    //printf("Eng_ReverbMod\n");
}

void Eng_ChorusMod (track_status *ptk_stat)
{
    //printf("Eng_ChorusMod\n");
}

void Eng_NoteOn (track_status *ptk_stat)
{
    //printf("Eng_NoteOn\n");
}

void Eng_NoteOff (track_status *ptk_stat)
{
    //printf("Eng_NoteOff\n");
}

extern unsigned char			eng_callback_areas;
extern unsigned char			eng_callbacks_active;
extern callback_status			*eng_pcalltable;

void Eng_StatusMark (track_status *ptk_stat)
{
	callback_status *cbs;
	//printf("Eng_StatusMark\n");

	eng_callbacks_active = eng_pmsbase->callbacks_active;

	if (eng_callbacks_active)
	{
		eng_pcalltable = eng_pmsbase->pcalltable;

		eng_callback_areas = eng_pmsbase->pmod_info->mod_hdr.callback_areas;

		while (eng_callback_areas-- > 0)
		{
			cbs = eng_pcalltable;
			if (cbs->active)
			{
				if (cbs->type == *(ptk_stat->ppos + 1))
				{
					cbs->curval = *(ptk_stat->ppos + 2) | (*(ptk_stat->ppos + 3) << 8);
					cbs->callfunc(cbs->type, cbs->curval);
					break;
				}

				if(!--eng_callbacks_active) break;
			}

			eng_pcalltable++;
		}
	}
}

extern short			    eng_labelnum;
extern char					*eng_plabellist;
extern char					*eng_pgates;

void Eng_GateJump (track_status *ptk_stat)
{
    //printf("Eng_GateJump\n");
	eng_pgates = (eng_pssbase + ptk_stat->seq_owner)->pgates + *(ptk_stat->ppos + 1);

	if (*eng_pgates != 0)
	{
		if (*eng_pgates == 0xFF)
		{
			*eng_pgates = *(ptk_stat->ppos + 2);
		}

		eng_labelnum = (*(ptk_stat->ppos + 3) | (*(ptk_stat->ppos + 4) << 8));

		if ((eng_labelnum >= 0) && (eng_labelnum < ptk_stat->labellist_count))
		{
            eng_plabellist = (char *)*(ptk_stat->plabellist + eng_labelnum);
            eng_plabellist += (unsigned long)ptk_stat->pstart;
            ptk_stat->ppos = eng_plabellist;
		}
	}
	ptk_stat->skip = 1;
}

extern char					    *eng_piters;
extern short			        eng_labelnum2;
extern char					    *eng_plabellist2;

void Eng_IterJump (track_status *ptk_stat)
{
    //printf("Eng_IterJump\n");
	eng_piters = (eng_pssbase + ptk_stat->seq_owner)->piters + *(ptk_stat->ppos + 1);

	if (*eng_piters != 0)
	{
		if (*eng_piters == 0xFF)
		{
			*eng_piters = *(ptk_stat->ppos + 2);
		}
		else
		{
			(*eng_piters)--;
		}

		eng_labelnum2 = (*(ptk_stat->ppos + 3) | (*(ptk_stat->ppos + 4) << 8));

		if (eng_labelnum2 >= 0)
		{
			if (eng_labelnum2 < ptk_stat->labellist_count)
			{
				eng_plabellist2 = (char *)*(ptk_stat->plabellist + eng_labelnum2);
				eng_plabellist2 += (unsigned long)ptk_stat->pstart;
				ptk_stat->ppos = eng_plabellist2;
			}
		}
	}
	ptk_stat->skip = 1;
}

extern unsigned char			eng_gates_per_seq;
extern char					    *eng_pgates2;

void Eng_ResetGates (track_status *ptk_stat)
{
	if (*(ptk_stat->ppos + 1) == 0xFF)
	{
		eng_gates_per_seq = eng_pmsbase->pmod_info->mod_hdr.gates_per_seq;
		eng_pgates2 = (eng_pssbase + ptk_stat->seq_owner)->pgates;

		while (eng_gates_per_seq-- > 0)
		{
			*eng_pgates2++ = 0xFF;
		}
	}
    else
    {
        eng_pgates2 = (eng_pssbase + ptk_stat->seq_owner)->pgates + *(ptk_stat->ppos + 1);
        *eng_pgates2 = 0xFF;
    }
}

extern unsigned char			eng_iters_per_seq;
extern char					    *eng_piters2;

void Eng_ResetIters (track_status *ptk_stat)
{
	if (*(ptk_stat->ppos + 1) == 0xff)
	{
		eng_iters_per_seq = eng_pmsbase->pmod_info->mod_hdr.iters_per_seq;
		eng_piters2 = (eng_pssbase + ptk_stat->seq_owner)->piters;

        while (eng_iters_per_seq-- > 0)
        {
            *eng_piters2++ = 0xff;
        }
	}
    else
    {
        eng_piters2 = (eng_pssbase + ptk_stat->seq_owner)->piters + *(ptk_stat->ppos + 1);
        *eng_piters2 = 0xff;
    }
}

extern char					*eng_piters3;

void Eng_WriteIterBox (track_status *ptk_stat)
{
	eng_piters3 = (eng_pssbase + ptk_stat->seq_owner)->piters + *(ptk_stat->ppos + 1);
	*eng_piters3 = *(ptk_stat->ppos + 2);
}

extern short			eng_tracks;
extern unsigned char			eng_tracks_active2;
extern unsigned char			*eng_ptrk_indxs2;
extern track_status			    *eng_ptrk_stat_1;
extern sequence_status			*eng_seq_stat_2;

void Eng_SeqTempo (track_status *ptk_stat)
{
	eng_seq_stat_2 = (eng_pssbase + ptk_stat->seq_owner);
	eng_tracks = (eng_pmsbase->pmod_info->pseq_info+eng_seq_stat_2->seq_num)->seq_hdr.tracks;
	eng_tracks_active2 = eng_seq_stat_2->tracks_active;
	eng_ptrk_indxs2 = eng_seq_stat_2->ptrk_indxs;

    while (eng_tracks--)
	{
		if (*eng_ptrk_indxs2 != 0xFF)
		{
			eng_ptrk_stat_1 = (eng_ptsbase+(*eng_ptrk_indxs2++));

			eng_ptrk_stat_1->qpm = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));
			eng_ptrk_stat_1->ppi = CalcPartsPerInt(GetIntsPerSec(), eng_ptrk_stat_1->ppq, eng_ptrk_stat_1->qpm);

			if (!--eng_tracks_active2) break;
		}
	}
}

extern short			        eng_labelnum3;
extern short			eng_tracks2;
extern char					    *eng_plabellist3;
extern unsigned char			eng_tracks_active3;
extern unsigned char			*eng_ptrk_indxs3;
extern track_status			    *eng_ptrk_stat_2;
extern sequence_status			*eng_seq_stat_3;

void Eng_SeqGosub (track_status *ptk_stat)
{

	eng_labelnum3 = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));

	if ((eng_labelnum3 >= 0) && (eng_labelnum3 < ptk_stat->labellist_count))
	{
		eng_seq_stat_3 = (eng_pssbase + ptk_stat->seq_owner);
		eng_tracks2 = (eng_pmsbase->pmod_info->pseq_info + eng_seq_stat_3->seq_num)->seq_hdr.tracks;
		eng_tracks_active3 = eng_seq_stat_3->tracks_active;
		eng_ptrk_indxs3 = eng_seq_stat_3->ptrk_indxs;

		while (eng_tracks2--)
		{
			if (*eng_ptrk_indxs3 != 0xFF)
			{
				eng_ptrk_stat_2 = (eng_ptsbase + (*eng_ptrk_indxs3++));

				*eng_ptrk_stat_2->psp++ = (eng_ptrk_stat_2->ppos + skip_table[26]);
				eng_plabellist3 = (char *)*(eng_ptrk_stat_2->plabellist + eng_labelnum3);
				eng_plabellist3 += (unsigned long)eng_ptrk_stat_2->pstart;
				eng_ptrk_stat_2->ppos = eng_plabellist3;

				if (!--eng_tracks_active3) break;
			}
		}
	}
	ptk_stat->skip = 1;
}

extern short			        eng_labelnum4;
extern short			eng_tracks3;
extern char					    *eng_plabellist4;
extern unsigned char			eng_tracks_active4;
extern unsigned char			*eng_ptrk_indxs4;
extern track_status			    *eng_ptrk_stat_3;
extern sequence_status			*eng_seq_stat_4;

void Eng_SeqJump (track_status *ptk_stat)
{

	eng_labelnum4 = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));

	if ((eng_labelnum4 >= 0) && (eng_labelnum4 < ptk_stat->labellist_count))
	{
		eng_seq_stat_4 = (eng_pssbase + ptk_stat->seq_owner);
		eng_tracks3 = (eng_pmsbase->pmod_info->pseq_info + eng_seq_stat_4->seq_num)->seq_hdr.tracks;
		eng_tracks_active4 = eng_seq_stat_4->tracks_active;
		eng_ptrk_indxs4 = eng_seq_stat_4->ptrk_indxs;

		while (eng_tracks3--)
		{
			if (*eng_ptrk_indxs4 != 0xFF)
			{
				eng_ptrk_stat_3 = (eng_ptsbase + (*eng_ptrk_indxs4++));
				eng_plabellist4 = (char *)*(eng_ptrk_stat_3->plabellist + eng_labelnum4);
				eng_plabellist4 += (unsigned long)eng_ptrk_stat_3->pstart;
				eng_ptrk_stat_3->ppos = eng_plabellist4;

				if (!--eng_tracks_active4) break;
			}
		}
	}
	ptk_stat->skip = 1;
}

extern short			eng_tracks4;
extern unsigned char			eng_tracks_active5;
extern unsigned char			*eng_ptrk_indxs5;
extern track_status			    *eng_ptrk_stat_4;
extern sequence_status			*eng_seq_stat_5;

void Eng_SeqRet (track_status *ptk_stat)
{

	eng_seq_stat_5 = (eng_pssbase + ptk_stat->seq_owner);
	eng_tracks4 = (eng_pmsbase->pmod_info->pseq_info + eng_seq_stat_5->seq_num)->seq_hdr.tracks;
	eng_tracks_active5 = eng_seq_stat_5->tracks_active;
	eng_ptrk_indxs5 = eng_seq_stat_5->ptrk_indxs;

	while (eng_tracks4--)
	{
		if (*eng_ptrk_indxs5 != 0xFF)
		{
			eng_ptrk_stat_4 = (eng_ptsbase + (*eng_ptrk_indxs5++));
			eng_ptrk_stat_4->psp--;
			eng_ptrk_stat_4->ppos = *eng_ptrk_stat_4->psp;

			if (!--eng_tracks_active5) break;
		}
	}

	ptk_stat->skip = 1;
}

extern sequence_status			*eng_seq_stat_6;
extern track_status			    *eng_ptrk_stat_5;
extern unsigned char			*eng_ptrk_indxs6;
extern unsigned long			eng_tracks_active6;
extern unsigned long			eng_max_trks_perseq;

void Eng_SeqEnd (track_status *ptk_stat)
{

	if (!(ptk_stat->handled))
	{
		eng_seq_stat_6 = (eng_pmsbase->pseqstattbl + ptk_stat->seq_owner);
		eng_tracks_active6 = eng_seq_stat_6->tracks_active;
		eng_max_trks_perseq = eng_pmsbase->max_trks_perseq;
		eng_ptrk_indxs6 = eng_seq_stat_6->ptrk_indxs;

		while (eng_max_trks_perseq--)
		{
			if (*eng_ptrk_indxs6 != 0xFF)
			{
				eng_ptrk_stat_5 = (eng_ptsbase + *eng_ptrk_indxs6);
				CmdFuncArr[eng_ptrk_stat_5->patchtype][TrkOff]((track_status *)eng_ptrk_stat_5);

				if (!--eng_tracks_active6) break;
			}

			eng_ptrk_indxs6++;
		}
	}
	else
	{
		eng_seq_stat_6 = (eng_pmsbase->pseqstattbl + ptk_stat->seq_owner);
		eng_tracks_active6 = eng_seq_stat_6->tracks_active;
		eng_max_trks_perseq = eng_pmsbase->max_trks_perseq;
		eng_ptrk_indxs6 = eng_seq_stat_6->ptrk_indxs;

		while (eng_max_trks_perseq--)
		{
			if (*eng_ptrk_indxs6 != 0xFF)
			{
				eng_ptrk_stat_5 = (eng_ptsbase + (*eng_ptrk_indxs6));
				CmdFuncArr[eng_ptrk_stat_5->patchtype][TrkOff]((track_status *)eng_ptrk_stat_5);

				if (!--eng_tracks_active6) break;
			}

			eng_ptrk_indxs6++;
		}

		ptk_stat->skip = 1;
	}
}

void Eng_TrkTempo (track_status *ptk_stat)
{
    //printf("Eng_TrkTempo\n");
	ptk_stat->qpm = *(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8);
	ptk_stat->ppi = CalcPartsPerInt(GetIntsPerSec(), ptk_stat->ppq, ptk_stat->qpm);
}

void Eng_TrkGosub (track_status *ptk_stat)
{
	short position;

	position = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));
	if ((position >= 0) && (position < ptk_stat->labellist_count))
	{
		*ptk_stat->psp++ = (ptk_stat->ppos + skip_table[26]);
		ptk_stat->ppos = (char *)(*(ptk_stat->plabellist + position) + (unsigned long)ptk_stat->pstart);
		ptk_stat->skip = 1;
	}
}

void Eng_TrkJump (track_status *ptk_stat)
{
	short position;

	position = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));

	if ((position >= 0) && (position < ptk_stat->labellist_count))
	{
		ptk_stat->ppos = (char *)(*(ptk_stat->plabellist + position) + (unsigned long)ptk_stat->pstart);
		ptk_stat->deltatime = 0;
		ptk_stat->skip = 1;
	}
}

void Eng_TrkRet (track_status *ptk_stat)
{
    //printf("Eng_TrkRet\n");
	ptk_stat->psp--;
	ptk_stat->ppos = *ptk_stat->psp;
	ptk_stat->ppos = Read_Vlq(ptk_stat->ppos, &ptk_stat->deltatime);
	ptk_stat->skip = 1;
}

void Eng_TrkEnd (track_status *ptk_stat)
{
	if (!(ptk_stat->handled))
	{
		if ((ptk_stat->looped) && (ptk_stat->totppi >= 16))
		{
			ptk_stat->skip = 1;
			ptk_stat->ppos = ptk_stat->pstart;
			ptk_stat->ppos = Read_Vlq(ptk_stat->ppos, &ptk_stat->deltatime);
		}
		else
		{
			CmdFuncArr[ptk_stat->patchtype][TrkOff](ptk_stat);
		}
	}
	else
	{
		if ((ptk_stat->looped) && (ptk_stat->totppi >= 16))
		{
			ptk_stat->skip = 1;
			ptk_stat->ppos = ptk_stat->pstart;
			ptk_stat->ppos = Read_Vlq(ptk_stat->ppos, &ptk_stat->deltatime);
		}
		else
		{
			CmdFuncArr[ptk_stat->patchtype][TrkOff](ptk_stat);
			ptk_stat->skip = 1;
		}
	}
}

void Eng_NullEvent (track_status *ptk_stat)
{
    //printf("Eng_NullEvent\n");
}

extern track_status *eng_tmp_ptrkstattbl;
extern unsigned char eng_tmp_trks_active;
extern unsigned int eng_tmp_trk_work_areas;
extern unsigned int eng_tmp_ppos;

void SeqEngine(void)
{
    eng_tmp_trks_active = eng_pmsbase->trks_active;
    if(eng_tmp_trks_active)
    {
        eng_tmp_ptrkstattbl = eng_ptsbase;
        eng_tmp_trk_work_areas = eng_ntwa;
        while(eng_tmp_trk_work_areas--)
        {
            if(eng_tmp_ptrkstattbl->active)
            {
                if(!eng_tmp_ptrkstattbl->stopped)
                {
                    eng_tmp_ptrkstattbl->starppi += eng_tmp_ptrkstattbl->ppi;
                    eng_tmp_ptrkstattbl->totppi += (eng_tmp_ptrkstattbl->starppi >> 0x10);
                    eng_tmp_ptrkstattbl->accppi += (eng_tmp_ptrkstattbl->starppi >> 0x10);
                    eng_tmp_ptrkstattbl->starppi &= 65535;
                    if(eng_tmp_ptrkstattbl->timed && (eng_tmp_ptrkstattbl->endppi <= eng_tmp_ptrkstattbl->totppi))
                    {
                        CmdFuncArr[eng_tmp_ptrkstattbl->patchtype][5]((track_status *)eng_tmp_ptrkstattbl);
                    }
                    else
                    {
                        while(eng_tmp_ptrkstattbl->deltatime <= eng_tmp_ptrkstattbl->accppi &&
                              !eng_tmp_ptrkstattbl->stopped && eng_tmp_ptrkstattbl->active)
                        {
                            eng_tmp_ptrkstattbl->accppi -= eng_tmp_ptrkstattbl->deltatime;
                            eng_tmp_ppos = *eng_tmp_ptrkstattbl->ppos;
                            if(eng_tmp_ppos >= 7 && eng_tmp_ppos < 19)
                            {
                                CmdFuncArr[eng_tmp_ptrkstattbl->patchtype][eng_tmp_ppos]((track_status *)eng_tmp_ptrkstattbl);
                                eng_tmp_ptrkstattbl->ppos += skip_table[eng_tmp_ppos];
                                eng_tmp_ptrkstattbl->ppos = Read_Vlq(eng_tmp_ptrkstattbl->ppos, &eng_tmp_ptrkstattbl->deltatime);
                            }
                            else if(eng_tmp_ppos >= 19 && eng_tmp_ppos < 36)
                            {
                                DrvFunctions[eng_tmp_ppos]((track_status *)eng_tmp_ptrkstattbl);
                                if(eng_tmp_ptrkstattbl->active && !eng_tmp_ptrkstattbl->skip)
                                {
                                    eng_tmp_ptrkstattbl->ppos += skip_table[eng_tmp_ppos];
                                    eng_tmp_ptrkstattbl->ppos = Read_Vlq(eng_tmp_ptrkstattbl->ppos, &eng_tmp_ptrkstattbl->deltatime);
                                }
                                else
                                {
                                    eng_tmp_ptrkstattbl->skip = 0;
                                }
                            }
                            else
                            {
                                DrvFunctions[29]((track_status *)eng_tmp_ptrkstattbl);   /* Eng_SeqEnd */
                            }
                        }
                    }
                }
                if(!--eng_tmp_trks_active) break;
            }
            eng_tmp_ptrkstattbl++;
        }
    }
    CmdFuncArr[eng_ptsbase->patchtype][2]((track_status *)eng_ptsbase);
}
