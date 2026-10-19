#include "wessseq.h"

void start_record_music_mute(NoteState *notestate);
void end_record_music_mute(void);
void add_music_mute_note(int seq_num, int track,
                  int keynum, int velnum,
                  patchmaps_header *patchmap, patchinfo_header *patchinfo);
void wess_set_mute_release(int newrate);
void TriggerPSXVoice(voice_status *voice_stat, unsigned char keynum, unsigned char velnum);

void PSX_DriverInit(master_status_structure *pm_stat);
void PSX_DriverExit (track_status *ptk_stat);
void PSX_DriverEntry1 (track_status *ptk_stat);
void PSX_DriverEntry2(track_status *ptk_stat);
void PSX_DriverEntry3(track_status *ptk_stat);
void PSX_TrkOff(track_status *ptk_stat);
void PSX_TrkMute(track_status *ptk_stat);
void PSX_PatchChg(track_status *ptk_stat);
void PSX_PatchMod(track_status *ptk_stat);
void PSX_PitchMod(track_status *ptk_stat);
void PSX_ZeroMod(track_status *ptk_stat);
void PSX_ModuMod(track_status *ptk_stat);
void PSX_VolumeMod(track_status *ptk_stat);
void PSX_PanMod(track_status *ptk_stat);
void PSX_PedalMod(track_status *ptk_stat);
void PSX_ReverbMod(track_status *ptk_stat);
void PSX_ChorusMod(track_status *ptk_stat);
void PSX_voiceon(voice_status *voice_stat, track_status *ptk_stat,
	           patchmaps_header *patchmaps, patchinfo_header *patchinfo,
	           unsigned char keynum, unsigned char velnum);
void PSX_voiceparmoff(voice_status *voice_stat);
void PSX_voicerelease(voice_status *voice_stat);
void PSX_voicenote(track_status *ptk_stat,
	           patchmaps_header *patchmap, patchinfo_header *patchinfo,
	           unsigned char keynum, unsigned char velnum);
void PSX_NoteOn(track_status *ptk_stat);
void PSX_NoteOff(track_status *ptk_stat);

extern void(*drv_cmds[19])();

extern unsigned char                skip_table[72];

extern unsigned char	            master_sfx_volume;
extern unsigned char	            master_mus_volume;
extern unsigned char	            pan_status;
extern unsigned char	            release_rate;

extern unsigned long	            voice_flags1;
extern unsigned long	            voice_flags2;
extern NoteState		            *ptr_notestate;
extern voice_status	                *ptr_pvoicestattbl;
extern long	            priority;
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

extern void (**CmdFuncArr[10])(track_status *);
extern void(*DrvFunctions[36])();

void start_record_music_mute(NoteState *notestate)
{
    ptr_notestate = notestate;
    if (notestate != 0)
    {
        notestate->numnotes = 0;
    }
}

void end_record_music_mute(void)
{
	ptr_notestate = 0;
}

void add_music_mute_note(int seq_num, int track,
                  int keynum, int velnum,
                  patchmaps_header *patchmap, patchinfo_header *patchinfo)
{
	if (ptr_notestate != 0)
	{
		ptr_notestate->nd[ptr_notestate->numnotes].seq_num = seq_num;
		ptr_notestate->nd[ptr_notestate->numnotes].track = track;
		ptr_notestate->nd[ptr_notestate->numnotes].keynum = keynum;
		ptr_notestate->nd[ptr_notestate->numnotes].velnum = velnum;
		ptr_notestate->nd[ptr_notestate->numnotes].patchmap = patchmap;
		ptr_notestate->nd[ptr_notestate->numnotes].patchinfo = patchinfo;
		ptr_notestate->numnotes++;
	}
}

void wess_set_mute_release(int newrate)
{
    int maxrate;

    maxrate = 0x10000000;
    release_rate = 0x1f;
    while ((newrate < maxrate && (release_rate != 0)))
    {
        maxrate >>= 1;
        release_rate -= 1;
    }
    return;
}

extern long				drv_pitch1;
extern long				drv_pitch2;
extern long				drv_pitch3;
extern long				drv_volume_1;
extern track_status				    *drv_ptrk_stat;
extern short				        drv_pan_1;

void TriggerPSXVoice(voice_status *voice_stat, unsigned char keynum, unsigned char velnum)
{
	drv_outattr.voice = 1 << voice_stat->refindx;
	drv_outattr.mask = (SPU_VOICE_VOLL | SPU_VOICE_VOLR | SPU_VOICE_NOTE | SPU_VOICE_SAMPLE_NOTE | SPU_VOICE_WDSA | SPU_VOICE_ADSR_ADSR1 | SPU_VOICE_ADSR_ADSR2);

	drv_ptrk_stat = (drv_ptsbase+voice_stat->track);

	if (drv_ptrk_stat->reverb != 0)
	{
		if (drv_channels[voice_stat->refindx] == 0)
		{
			SpuSetReverbVoice(SPU_ON, drv_outattr.voice);
			drv_channels[voice_stat->refindx] = 0x7f;
		}
	}
	else
	{
		if (drv_channels[voice_stat->refindx] != 0)
		{
			SpuSetReverbVoice(SPU_OFF, drv_outattr.voice);
			drv_channels[voice_stat->refindx] = 0;
		}
	}

	if (pan_status != 0)
	{
		drv_pan_1 = drv_ptrk_stat->pan_cntrl + voice_stat->patchmaps->pan - 0x40;

		if (drv_pan_1 > 0x7F)	drv_pan_1 = 0x7F;
		if (drv_pan_1 < 0)      drv_pan_1 = 0;
	}
	else
	{
		drv_pan_1 = 0x40;
	}

	if (drv_ptrk_stat->sndclass == SNDFX_CLASS)
	{
		drv_volume_1 = (velnum * voice_stat->patchmaps->volume * drv_ptrk_stat->volume_cntrl * master_sfx_volume) >> 21;
	}
	else
	{
		drv_volume_1 = (velnum * voice_stat->patchmaps->volume * drv_ptrk_stat->volume_cntrl * master_mus_volume) >> 21;
	}

	if (pan_status == 0)
	{
		drv_outattr.volume.left = drv_volume_1 << 6;
		drv_outattr.volume.right = drv_volume_1 << 6;
	}
	else if (pan_status == 1)
	{
		drv_outattr.volume.left = ((drv_volume_1 << 7) * (0x80 - drv_pan_1)) >> 7;
		drv_outattr.volume.right = ((drv_volume_1 << 7) * (drv_pan_1 + 1)) >> 7;
	}
	else
	{
		drv_outattr.volume.right = ((drv_volume_1 << 7) * (0x80 - drv_pan_1)) >> 7;
		drv_outattr.volume.left = ((drv_volume_1 << 7) * (drv_pan_1 + 1)) >> 7;
	}

	if (drv_ptrk_stat->pitch_cntrl == 0)
	{
		drv_outattr.note = voice_stat->keynum << 8;
	}
	else if (drv_ptrk_stat->pitch_cntrl > 0)
	{
		drv_pitch1 = drv_ptrk_stat->pitch_cntrl * voice_stat->patchmaps->pitchstep_max + 32;
		drv_pitch2 = drv_pitch1 >> 13;
		drv_pitch3 = (drv_pitch1 & 8191) >> 6;
		drv_outattr.note = (voice_stat->keynum + drv_pitch2) << 8 | drv_pitch3 & 0x7F;
	}
	else
	{
		drv_pitch1 = 32 - drv_ptrk_stat->pitch_cntrl * voice_stat->patchmaps->pitchstep_min;
		drv_pitch2 = (drv_pitch1 >> 13) + 1;
		drv_pitch3 = 0x80 - ((drv_pitch1 & 8191) >> 6);
		drv_outattr.note = (voice_stat->keynum - drv_pitch2) << 8 | drv_pitch3 & 0x7F;
	}

	{

		int sample_note = (voice_stat->patchmaps->root_key << 8) | voice_stat->patchmaps->fine_adj;
		drv_outattr.sample_note = sample_note;
	}
	drv_outattr.addr = voice_stat->patchinfo->sample_pos;
	drv_outattr.adsr1 = voice_stat->patchmaps->adsr1;
	drv_outattr.adsr2 = voice_stat->patchmaps->adsr2;

	SpuSetKeyOnWithAttr(&drv_outattr);
}

void PSX_DriverInit(master_status_structure *pm_stat)
{

	drv_pmsbase = pm_stat;
	drv_pcurabstime = pm_stat->pabstime;
	drv_pssbase = pm_stat->pseqstattbl;
	drv_ptsbase = pm_stat->ptrkstattbl;
	drv_pvsbase = pm_stat->pvoicestattbl;
	drv_nvst = pm_stat->voices_total;

	drv_cnt = 0;
	while (drv_cnt < drv_nvst)
	{
		if ((drv_pvsbase + drv_cnt)->patchtype == 1)
		{
			drv_pcurvs = (drv_pvsbase + drv_cnt);
			break;
		}
		drv_cnt++;
	}

	drv_npti = drv_pmsbase->pmod_info->mod_hdr.patch_types_infile;

	drv_cnt = 0;
	while (drv_cnt < drv_npti)
	{
		if ((drv_pmsbase->ppat_info + drv_cnt)->pat_grp_hdr.patch_id == 1)
		{
			drv_ppgd = (drv_pmsbase->ppat_info + drv_cnt);
			break;
		}
		drv_cnt++;
	}

	drv_hwvl = drv_ppgd->pat_grp_hdr.hw_voice_limit;
	drv_patchesbase = (patches_header *)drv_ppgd->ppat_data;
	drv_patchmapsbase = (patchmaps_header *)(drv_patchesbase + drv_ppgd->pat_grp_hdr.patches);
	drv_samplesbase = (patchinfo_header *)(drv_patchmapsbase + drv_ppgd->pat_grp_hdr.patchmaps);
	drv_drummapsbase = (char *)(drv_samplesbase + drv_ppgd->pat_grp_hdr.patchinfo);

	psxspu_init();

	drv_cnt = 0;
	do
	{
		drv_channels[drv_cnt] = 0x7F;
		drv_cnt++;
	} while (drv_cnt < 24);
}

void PSX_DriverExit (track_status *ptk_stat)
{
	SpuQuit();
}

extern unsigned long		drv_vn;
extern unsigned long		drv_vi;
extern unsigned long		drv_keychannels;
extern unsigned long		drv_keycnt;
extern voice_status		    *drv_pvs;
extern unsigned long		drv_voiceflag;
extern char				    drv_keysstatus[24];

void PSX_DriverEntry1 (track_status *ptk_stat)
{
	drv_vn = drv_pmsbase->voices_active;

	if (drv_vn != 0)
	{
		drv_pvs = drv_pcurvs;
		drv_vi = drv_hwvl;

		while (drv_vi--)
		{
			if ((drv_pvs->active && drv_pvs->release))
			{
				if (*drv_pcurabstime > drv_pvs->pabstime)
				{
					PSX_voiceparmoff(drv_pvs);
					if (!--drv_vn) break;
				}
			}
			drv_pvs++;
		}
	}

	drv_voiceflag = 0;
	if (voice_flags1 != 0)
	{
		drv_voiceflag = voice_flags1;
		voice_flags1 = 0;
	}

	if (voice_flags2 != 0)
	{
		drv_outattr.voice = voice_flags2;
		drv_outattr.mask = (SPU_VOICE_ADSR_RMODE | SPU_VOICE_ADSR_RR);
		drv_outattr.r_mode = SPU_VOICE_EXPDec;
		drv_outattr.rr = release_rate;
		SpuSetVoiceAttr(&drv_outattr);

		drv_voiceflag |= voice_flags2;
		voice_flags2 = 0;
	}

	if (drv_voiceflag != 0)
	{
		SpuSetKey(SPU_OFF, drv_voiceflag);
		drv_voiceflag = 0;
	}

	SpuGetAllKeysStatus(drv_keysstatus);

	drv_keychannels = 24;
	drv_keycnt = 0;
	drv_pvs = drv_pcurvs;
	while (drv_keychannels--)
	{
		if ((drv_pvs->active))
		{
			if (drv_keysstatus[drv_keycnt] == 0)
			{
				PSX_voiceparmoff(drv_pvs);
			}
		}
		drv_keycnt++;
		drv_pvs++;
	}
}

void PSX_DriverEntry2(track_status *ptk_stat)
{
}

void PSX_DriverEntry3(track_status *ptk_stat)
{
}

extern sequence_status				*drv_pss;

void PSX_TrkOff(track_status *ptk_stat)
{
	drv_pss = drv_pssbase + ptk_stat->seq_owner;
	PSX_TrkMute(ptk_stat);

	if (ptk_stat->voices_active != 0)
	{
		ptk_stat->off = 1; ptk_stat->stopped = 1;

		if (!--drv_pss->tracks_playing)
			drv_pss->playmode = SEQ_STATE_STOPPED;
	}
	else
	{
		Eng_TrkOff(ptk_stat);
	}
}

extern unsigned long				drv_vn_2;
extern unsigned long				drv_vi_2;
extern voice_status				   *drv_pvs_2;
extern sequence_status			   *drv_pss_2;

void PSX_TrkMute(track_status *ptk_stat)
{
	drv_vn_2 = ptk_stat->voices_active;

	if (drv_vn_2 != 0)
	{
		drv_pvs_2 = drv_pcurvs;
		drv_vi_2 = drv_hwvl;

		while (drv_vi_2--)
		{
			if (((drv_pvs_2->active)) && (drv_pvs_2->track == ptk_stat->refindx))
			{
                if (ptr_notestate != 0 && (!(drv_pvs_2->release) && (ptk_stat->sndclass == MUSIC_CLASS)))
                {
                  drv_pss_2 = (drv_pssbase + ptk_stat->seq_owner);
                  add_music_mute_note(drv_pss_2->seq_num,
                               drv_pvs_2->track,
                               drv_pvs_2->keynum,
                               drv_pvs_2->velnum,
                               drv_pvs_2->patchmaps,
                               drv_pvs_2->patchinfo);
                }
                drv_pvs_2->adsr2 = 0x10000000 >> (0x1f - release_rate);
                PSX_voicerelease(drv_pvs_2);

				voice_flags2 = 1 << drv_pvs_2->refindx | voice_flags2;
				if (!--drv_vn_2) break;
			}

			drv_pvs_2++;
		}
	}
}

extern unsigned short				drv_thepatch;

void PSX_PatchChg(track_status *ptk_stat)
{
	drv_thepatch = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));
	ptk_stat->patchnum = drv_thepatch;
}

void PSX_PatchMod(track_status *ptk_stat)
{
}

extern unsigned long				drv_voices_active_3;
extern unsigned long				drv_hwvl_3;
extern long				drv_pitch_1;
extern long				drv_pitch_2;
extern long				drv_pitch_3;
extern voice_status				    *drv_voice_stat_3;
extern short				        drv_pitch_cntrl;

void PSX_PitchMod(track_status *ptk_stat)
{

	drv_pitch_cntrl = (*(ptk_stat->ppos + 1) | (*(ptk_stat->ppos + 2) << 8));
	if (ptk_stat->pitch_cntrl != drv_pitch_cntrl)
	{
		ptk_stat->pitch_cntrl = drv_pitch_cntrl;
		drv_voices_active_3 = ptk_stat->voices_active;

		if (drv_voices_active_3 != 0)
		{
			drv_voice_stat_3 = drv_pcurvs;
			drv_hwvl_3 = drv_hwvl;

			while (drv_hwvl_3--)
			{
                if ((drv_voice_stat_3->active) && (drv_voice_stat_3->track == ptk_stat->refindx))
                {
                    drv_outattr.voice = 1 << drv_voice_stat_3->refindx;
                    drv_outattr.mask = (SPU_VOICE_NOTE);

                    if (ptk_stat->pitch_cntrl == 0)
                    {
                        drv_outattr.note = (drv_voice_stat_3->keynum << 8);
                    }
                    else if (ptk_stat->pitch_cntrl > 0)
                    {
                        drv_pitch_1 = 32 + ptk_stat->pitch_cntrl * drv_voice_stat_3->patchmaps->pitchstep_max;
                        drv_pitch_2 = (drv_pitch_1 >> 13);
                        drv_pitch_3 = (drv_pitch_1 & 8191) >> 6;

                        drv_outattr.note = (drv_voice_stat_3->keynum + (drv_pitch_2)) << 8 | drv_pitch_3 & 0x7F;
                    }
                    else
                    {
                        drv_pitch_1 = 32 - ptk_stat->pitch_cntrl * drv_voice_stat_3->patchmaps->pitchstep_min;
                        drv_pitch_2 = (drv_pitch_1 >> 13) + 1;
                        drv_pitch_3 = 0x80 - ((drv_pitch_1 & 8191) >> 6);

                        drv_outattr.note = (drv_voice_stat_3->keynum - (drv_pitch_2)) << 8 | drv_pitch_3 & 0x7F;
                    }

                    SpuSetVoiceAttr(&drv_outattr);

                    if (!--drv_voices_active_3) break;
                }

				drv_voice_stat_3++;
			}
		}
	}
}

void PSX_ZeroMod(track_status *ptk_stat)
{
}

void PSX_ModuMod(track_status *ptk_stat)
{
}

extern unsigned long				drv_voices_active_4;
extern unsigned long				drv_hwvl_4;
extern long				drv_volume_2;
extern voice_status				    *drv_voice_stat_4;
extern short				        drv_pan_2;

void PSX_VolumeMod(track_status *ptk_stat)
{
	ptk_stat->volume_cntrl = *(ptk_stat->ppos + 1);

	drv_voices_active_4 = ptk_stat->voices_active;
	if (drv_voices_active_4 != 0)
	{
		drv_voice_stat_4 = drv_pcurvs;
		drv_hwvl_4 = drv_hwvl;

		while (drv_hwvl_4--)
		{
			if ((drv_voice_stat_4->active) && (drv_voice_stat_4->track == ptk_stat->refindx))
			{
				if (pan_status != 0)
				{
					drv_pan_2 = ptk_stat->pan_cntrl + drv_voice_stat_4->patchmaps->pan - 0x40;

					if (drv_pan_2 > 0x7F)	drv_pan_2 = 0x7F;
					if (drv_pan_2 < 0)      drv_pan_2 = 0;
				}
				else
				{
					drv_pan_2 = 0x40;
				}

				if (ptk_stat->sndclass == SNDFX_CLASS)
				{
					drv_volume_2 = (drv_voice_stat_4->velnum * drv_voice_stat_4->patchmaps->volume * ptk_stat->volume_cntrl * master_sfx_volume) >> 21;
				}
				else
				{
					drv_volume_2 = (drv_voice_stat_4->velnum * drv_voice_stat_4->patchmaps->volume * ptk_stat->volume_cntrl * master_mus_volume) >> 21;
				}

				drv_outattr.voice = 1 << drv_voice_stat_4->refindx;
				drv_outattr.mask = (SPU_VOICE_VOLL | SPU_VOICE_VOLR);

				if (pan_status == 0)
				{
					drv_outattr.volume.left = drv_volume_2 << 6;
					drv_outattr.volume.right = drv_volume_2 << 6;
				}
				else if (pan_status == 1)
				{
					drv_outattr.volume.left  = ((drv_volume_2 << 7) * (0x80 - drv_pan_2)) >> 7;
					drv_outattr.volume.right = ((drv_volume_2 << 7) * (drv_pan_2 + 1)) >> 7;
				}
				else
				{
					drv_outattr.volume.right = ((drv_volume_2 << 7) * (0x80 - drv_pan_2)) >> 7;
					drv_outattr.volume.left  = ((drv_volume_2 << 7) * (drv_pan_2 + 1)) >> 7;
				}

				SpuSetVoiceAttr(&drv_outattr);

				if (!--drv_voices_active_4) break;
			}

			drv_voice_stat_4++;
		}
	}
}

extern unsigned long				drv_voices_active_5;
extern unsigned long				drv_hwvl_5;
extern long				drv_volume_3;
extern voice_status				    *drv_voice_stat_5;
extern short				        drv_pan_3;

void PSX_PanMod(track_status *ptk_stat)
{

	ptk_stat->pan_cntrl = *(ptk_stat->ppos + 1);

	if (pan_status != 0)
	{
		drv_voices_active_5 = ptk_stat->voices_active;

		if (drv_voices_active_5 != 0)
		{
			drv_voice_stat_5 = drv_pcurvs;
			drv_hwvl_5 = drv_hwvl;

			while (drv_hwvl_5--)
			{
				if ((drv_voice_stat_5->active) && (drv_voice_stat_5->track == ptk_stat->refindx))
				{
					drv_pan_3 = ptk_stat->pan_cntrl + drv_voice_stat_5->patchmaps->pan - 0x40;

					if (drv_pan_3 > 0x7F)	drv_pan_3 = 0x7F;
					if (drv_pan_3 < 0)      drv_pan_3 = 0;

					if (ptk_stat->sndclass == SNDFX_CLASS)
					{
						drv_volume_3 = (drv_voice_stat_5->velnum * drv_voice_stat_5->patchmaps->volume * ptk_stat->volume_cntrl * master_sfx_volume) >> 21;
					}
					else
					{
						drv_volume_3 = (drv_voice_stat_5->velnum * drv_voice_stat_5->patchmaps->volume * ptk_stat->volume_cntrl * master_mus_volume) >> 21;
					}

					drv_outattr.voice = 1 << drv_voice_stat_5->refindx;
					drv_outattr.mask = (SPU_VOICE_VOLL | SPU_VOICE_VOLR);

					if (pan_status == 1)
					{
						drv_outattr.volume.left = ((drv_volume_3 << 7) * (0x80 - drv_pan_3)) >> 7;
						drv_outattr.volume.right = ((drv_volume_3 << 7) * (drv_pan_3 + 1)) >> 7;
					}
					else
					{
						drv_outattr.volume.right = ((drv_volume_3 << 7) * (0x80 - drv_pan_3)) >> 7;
						drv_outattr.volume.left = ((drv_volume_3 << 7) * (drv_pan_3 + 1)) >> 7;
					}

					SpuSetVoiceAttr(&drv_outattr);

					if (!--drv_voices_active_5) break;
				}

				drv_voice_stat_5++;
			}
		}
	}
}

void PSX_PedalMod(track_status *ptk_stat)
{
}

void PSX_ReverbMod(track_status *ptk_stat)
{
}

void PSX_ChorusMod(track_status *ptk_stat)
{
}

void PSX_voiceon(voice_status *voice_stat, track_status *ptk_stat,
	           patchmaps_header *patchmaps, patchinfo_header *patchinfo,
	           unsigned char keynum, unsigned char velnum)
{

	voice_stat->active = 1; voice_stat->release = 0;
	voice_stat->track = ptk_stat->refindx;
	voice_stat->priority = ptk_stat->priority;
	voice_stat->keynum = keynum;
	voice_stat->velnum = velnum;
	voice_stat->sndtype = 0;
	voice_stat->patchmaps = patchmaps;
	voice_stat->patchinfo = patchinfo;
	voice_stat->pabstime = *drv_pcurabstime;

	if (patchmaps->adsr2 & 0x20)
		voice_stat->adsr2 = 0x10000000 >> (0x1f - (patchmaps->adsr2 & 0x1f));
	else
		voice_stat->adsr2 = 0x5dc0000 >> (0x1f - (patchmaps->adsr2 & 0x1f));

	ptk_stat->voices_active++;
	drv_pmsbase->voices_active++;

	TriggerPSXVoice(voice_stat, keynum, velnum);
}

extern track_status				*drv_ptrk_stat_1;

void PSX_voiceparmoff(voice_status *voice_stat)
{
	drv_ptrk_stat_1 = (drv_ptsbase + voice_stat->track);

	drv_pmsbase->voices_active--;

	if ((--drv_ptrk_stat_1->voices_active == 0) && (drv_ptrk_stat_1->off))
	{
        Eng_TrkOff(drv_ptrk_stat_1);
	}

	voice_stat->active = 0; voice_stat->release = 0;
}

void PSX_voicerelease(voice_status *voice_stat)
{
	voice_flags1 = 1 << voice_stat->refindx | voice_flags1;
	voice_stat->release = 1;
	voice_stat->pabstime = *drv_pcurabstime + voice_stat->adsr2;
}

extern unsigned long				drv_hwvl_6;
extern unsigned long				drv_note_stat;
extern voice_status				*drv_voice_stat_6;

void PSX_voicenote(track_status *ptk_stat,
	           patchmaps_header *patchmap, patchinfo_header *patchinfo,
	           unsigned char keynum, unsigned char velnum)
{

	drv_voice_stat_6 = drv_pcurvs;
	drv_note_stat = 0;

    for (drv_hwvl_6 = drv_hwvl - 1; drv_hwvl_6 != -1; drv_hwvl_6--)
    {
        voice_status *vs = drv_voice_stat_6;
        long one = 1;
        if (!vs->active)
        {
          PSX_voiceon(vs, ptk_stat, patchmap, patchinfo, keynum, velnum);
          drv_note_stat = 0;
          break;
        }
        if (vs->priority <= ptk_stat->priority)
        {
          if (vs->priority >= priority)
          {
            if (vs->release)
            {
              if ((!ptr_pvoicestattbl->release)) goto set_note_stat;
            }
            else
            {
              if ((ptr_pvoicestattbl->release)) goto next_voice;
            }
            if (vs->pabstime >= max_pabstime) goto next_voice;
          }
    set_note_stat:
          drv_note_stat = one;
          priority = vs->priority;
          max_pabstime = vs->pabstime;
          ptr_pvoicestattbl = vs;
        }
    next_voice:
        drv_voice_stat_6++;
    }

    if (drv_note_stat != 0)
    {
        PSX_voiceparmoff(ptr_pvoicestattbl);
        PSX_voiceon(ptr_pvoicestattbl,ptk_stat,patchmap,patchinfo,keynum,velnum);
    }
}

extern unsigned long				drv_patch_cnt;
extern unsigned char				drv_byte01;
extern unsigned char				drv_byte02;
extern unsigned char				drv_patchmap_cnt;
extern patches_header				*drv_patch_1;
extern patchmaps_header			    *drv_patchmap_1;
extern patchinfo_header			    *drv_samplesbase_1;

void PSX_NoteOn(track_status *ptk_stat)
{
	char *drummaps;

	drv_byte01 = *(ptk_stat->ppos + 1);
	drv_byte02 = *(ptk_stat->ppos + 2);

	if (ptk_stat->sndclass == DRUMS_CLASS)
	{
		drummaps = (drv_drummapsbase + (drv_byte01 * sizeof(long)));
		drv_patch_1 = drv_patchesbase + *(short*)(drummaps);
		drv_byte01 = *(drummaps + sizeof(short));
	}
	else
	{
		drv_patch_1 = drv_patchesbase+ptk_stat->patchnum;
	}

	drv_patchmap_cnt = drv_patch_1->patchmap_cnt;
	drv_patch_cnt = 0;

	while (drv_patchmap_cnt--)
	{
		drv_patchmap_1 = drv_patchmapsbase + (drv_patch_1->patchmap_idx + drv_patch_cnt);
		drv_samplesbase_1 = drv_samplesbase + drv_patchmap_1->sample_id;

		if (drv_samplesbase_1->sample_pos != 0)
		{
			if (drv_patchmap_1->note_min <= drv_byte01)
			{
				if (drv_byte01 <= drv_patchmap_1->note_max)
				{
					PSX_voicenote(ptk_stat,drv_patchmap_1,
                   drv_samplesbase_1,drv_byte01,drv_byte02);
				}
			}
		}

		drv_patch_cnt++;
	}
}

extern unsigned long			drv_hwvl_7;
extern voice_status				*drv_voice_stat_7;

void PSX_NoteOff(track_status *ptk_stat)
{
	drv_voice_stat_7 =
	drv_pcurvs;
	drv_hwvl_7 = drv_hwvl;

	while (drv_hwvl_7--)
	{
		if (((drv_voice_stat_7->active && !drv_voice_stat_7->release)) &&
			(drv_voice_stat_7->keynum == *(ptk_stat->ppos + 1)) &&
			(drv_voice_stat_7->track == ptk_stat->refindx))
		{
			PSX_voicerelease(drv_voice_stat_7);
		}

		drv_voice_stat_7++;
	}
}
