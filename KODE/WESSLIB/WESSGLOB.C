#include <libspu.h>
#include "wessarc.h"
#include "wessapi.h"
#include "wessseq.h"
#include "psxspu.h"
#include "lcdload.h"

#define CHUNKSIZE 2048

void PSX_DriverInit(master_status_structure *pm_stat);
void PSX_DriverExit(track_status *ptk_stat);
void PSX_DriverEntry1(track_status *ptk_stat);
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
void PSX_NoteOn(track_status *ptk_stat);
void PSX_NoteOff(track_status *ptk_stat);
void Eng_DriverInit(master_status_structure *pm_stat);
void Eng_DriverExit(track_status *ptk_stat);
void Eng_DriverEntry1(track_status *ptk_stat);
void Eng_DriverEntry2(track_status *ptk_stat);
void Eng_DriverEntry3(track_status *ptk_stat);
void Eng_TrkOff(track_status *ptk_stat);
void Eng_TrkMute(track_status *ptk_stat);
void Eng_PatchChg(track_status *ptk_stat);
void Eng_PatchMod(track_status *ptk_stat);
void Eng_PitchMod(track_status *ptk_stat);
void Eng_ZeroMod(track_status *ptk_stat);
void Eng_ModuMod(track_status *ptk_stat);
void Eng_VolumeMod(track_status *ptk_stat);
void Eng_PanMod(track_status *ptk_stat);
void Eng_PedalMod(track_status *ptk_stat);
void Eng_ReverbMod(track_status *ptk_stat);
void Eng_ChorusMod(track_status *ptk_stat);
void Eng_NoteOn(track_status *ptk_stat);
void Eng_NoteOff(track_status *ptk_stat);
void Eng_StatusMark(track_status *ptk_stat);
void Eng_GateJump(track_status *ptk_stat);
void Eng_IterJump(track_status *ptk_stat);
void Eng_ResetGates(track_status *ptk_stat);
void Eng_ResetIters(track_status *ptk_stat);
void Eng_WriteIterBox(track_status *ptk_stat);
void Eng_SeqTempo(track_status *ptk_stat);
void Eng_SeqGosub(track_status *ptk_stat);
void Eng_SeqJump(track_status *ptk_stat);
void Eng_SeqRet(track_status *ptk_stat);
void Eng_SeqEnd(track_status *ptk_stat);
void Eng_TrkTempo(track_status *ptk_stat);
void Eng_TrkGosub(track_status *ptk_stat);
void Eng_TrkJump(track_status *ptk_stat);
void Eng_TrkRet(track_status *ptk_stat);
void Eng_TrkEnd(track_status *ptk_stat);
void Eng_NullEvent(track_status *ptk_stat);

int seq_loader_enable = 0;
char *loaderfile = 0;
pmasterstat *ref_pm_stat = 0;
int ref_max_seq_num = 0;
char Driver_Init = DriverInit;
char Reset_Gates = TrkEnd;
int	opencount = 0;
int(*Seq_Error_func)(int, int) = 0;
int Seq_Error_module = 0;
Wess_File_IO_Struct *fp_seq_file = 0;
unsigned int psxspu_initialized = 0;
unsigned int psxspu_status = 0;
unsigned long end_of_sram = 0x7F000;
int psxspu_master_vol = 0x3FFF;
int psxspu_master_fadecount = 0;
int psxspu_master_vol_fixed = 0x3FFF0000;
int psxspu_master_destvol = 0;
int psxspu_master_changeval = 0;
int psxspu_cd_vol = 0x3CFF;
int psxspu_cd_fadecount = 0;
int psxspu_cd_vol_fixed = 0x3CFF0000;
int psxspu_cd_destvol = 0;
int psxspu_cd_changeval =  0;
void(*drv_cmds[19])() =
{
	PSX_DriverInit, PSX_DriverExit, PSX_DriverEntry1, PSX_DriverEntry2, PSX_DriverEntry3,
	PSX_TrkOff, PSX_TrkMute, PSX_PatchChg, PSX_PatchMod, PSX_PitchMod, PSX_ZeroMod,
	PSX_ModuMod, PSX_VolumeMod, PSX_PanMod, PSX_PedalMod, PSX_ReverbMod, PSX_ChorusMod,
	PSX_NoteOn, PSX_NoteOff
};
unsigned char	master_sfx_volume = 0x7f;
unsigned char	master_mus_volume = 0x7f;
unsigned char	pan_status = 0x1;
unsigned char	release_rate = 0xD;
unsigned long	voice_flags1 = 0;
unsigned long	voice_flags2 = 0;
NoteState		*ptr_notestate = 0;
voice_status	*ptr_pvoicestattbl = 0;
unsigned long	priority = 0x100;
unsigned long	max_pabstime = 0xFFFFFFFF;
void(*DrvFunctions[36])() =
{
	Eng_DriverInit, Eng_DriverExit, Eng_DriverEntry1, Eng_DriverEntry2, Eng_DriverEntry3,
	Eng_TrkOff, Eng_TrkMute, Eng_PatchChg, Eng_PatchMod, Eng_PitchMod, Eng_ZeroMod,
	Eng_ModuMod, Eng_VolumeMod, Eng_PanMod, Eng_PedalMod, Eng_ReverbMod, Eng_ChorusMod,
	Eng_NoteOn, Eng_NoteOff, Eng_StatusMark, Eng_GateJump, Eng_IterJump, Eng_ResetGates,
	Eng_ResetIters, Eng_WriteIterBox, Eng_SeqTempo, Eng_SeqGosub, Eng_SeqJump, Eng_SeqRet,
	Eng_SeqEnd, Eng_TrkTempo, Eng_TrkGosub, Eng_TrkJump, Eng_TrkRet, Eng_TrkEnd,
	Eng_NullEvent
};
unsigned long wess_unused = 0;
unsigned char            eng_ntwa = 0;
track_status            *eng_ptsbase = 0;
sequence_status         *eng_pssbase = 0;
master_status_structure *eng_pmsbase = 0;
int lcd_open = 0;
char *lcd_ppat_data_patches = 0;
char *lcd_ppat_data_patchmaps = 0;
char *lcd_ppat_data_patchinfo = 0;
char *lcd_ppat_data_track = 0;
patch_group_data *lcd_ppat_info = 0;
unsigned long lcd_sample_pos = 0;
int lcd_sectorbuf_pos = 0;
int lcd_totaltogo = 0;
unsigned short lcd_sectorbuf_code = 0;
char *lcd_sectorbuf = 0;
int lcd_cd_status = 0;
int  lcd_sync_intr = 0;
char lcd_sync_result[8] = { 0,0,0,0,0,0,0,0 };
unsigned char skip_table[72] = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03,
0x02, 0x03, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
0x02, 0x03, 0x02, 0x04, 0x05, 0x05, 0x02, 0x02,
0x03, 0x03, 0x03, 0x03, 0x01, 0x01, 0x03, 0x03,
0x03, 0x01, 0x01, 0x01, 0x00, 0x01, 0x02, 0x03,
0x04, 0x07, 0x06, 0x16, 0x17, 0x18, 0x15, 0x1A,
0x1E, 0x19, 0x1B, 0x1D, 0x1C, 0x1F, 0x05, 0x0F,
0x08, 0x09, 0x12, 0x11, 0x10, 0x14, 0x0D, 0x0B,
0x22, 0x23, 0x13, 0x0C, 0x0A, 0x20, 0x21, 0x0E
};

char chunk1[CHUNKSIZE];
char chunk2[CHUNKSIZE];

track_header scratch_trk_hdr;

Wess_Data_IO_Struct lcd_data_fileref;

track_header seq_track_header;
track_header base_track_header;

#define MALLOC_MAX 1
char spu_malloc_rec[SPU_MALLOC_RECSIZ * (MALLOC_MAX + 1)];

SpuReverbAttr rev_attr;

master_status_structure		*drv_pmsbase;
sequence_status				*drv_pssbase;
track_status				*drv_ptsbase;
unsigned long				 drv_hwvl;
patch_group_data			*drv_ppgd;
unsigned long				*drv_pcurabstime;
patches_header				*drv_patchesbase;
patchmaps_header			*drv_patchmapsbase;
patchinfo_header			*drv_samplesbase;
char						*drv_drummapsbase;
SpuVoiceAttr				drv_outattr;

unsigned char				drv_nvst;
unsigned char				drv_npti;
long				drv_cnt;
voice_status				*drv_pvsbase;

voice_status				*drv_pcurvs;

unsigned char				drv_channels[24];

long				drv_pitch1;
long				drv_pitch2;
long				drv_pitch3;
long				drv_volume_1;
track_status				*drv_ptrk_stat;
short				        drv_pan_1;

unsigned long		        drv_vn;
unsigned long		        drv_vi;
unsigned long		        drv_keychannels;
unsigned long		        drv_keycnt;
voice_status		        *drv_pvs;
unsigned long		        drv_voiceflag;
char				        drv_keysstatus[24];

sequence_status				*drv_pss;

unsigned long				drv_vn_2;
unsigned long				drv_vi_2;
voice_status				*drv_pvs_2;
sequence_status				*drv_pss_2;

unsigned short				drv_thepatch;

unsigned long				drv_voices_active_3;
unsigned long				drv_hwvl_3;
long				drv_pitch_1;
long				drv_pitch_2;
long				drv_pitch_3;
voice_status				*drv_voice_stat_3;
short				        drv_pitch_cntrl;

unsigned long				drv_voices_active_4;
unsigned long				drv_hwvl_4;
long				drv_volume_2;
voice_status				*drv_voice_stat_4;
short				        drv_pan_2;

unsigned long				drv_voices_active_5;
unsigned long				drv_hwvl_5;
long				drv_volume_3;
voice_status				*drv_voice_stat_5;
short				        drv_pan_3;

track_status				*drv_ptrk_stat_1;

unsigned long				drv_hwvl_6;
unsigned long				drv_note_stat;
voice_status				*drv_voice_stat_6;

unsigned long				drv_patch_cnt;
unsigned char				drv_byte01;
unsigned char				drv_byte02;
unsigned char				drv_patchmap_cnt;
patches_header				*drv_patch_1;
patchmaps_header			*drv_patchmap_1;
patchinfo_header			*drv_samplesbase_1;

unsigned long				drv_hwvl_7;
voice_status			    *drv_voice_stat_7;

unsigned int data01;
unsigned char data02;

sequence_status			*eng_seq_stat_1;
char					*eng_ptrk_indxs1;
unsigned long			eng_max_trks_perseq1;

unsigned char			eng_patchnum;
short			        eng_pitch_cntrl;

unsigned char			eng_volume_cntrl;

unsigned char			eng_pan_cntrl;

unsigned char			eng_callback_areas;
unsigned char			eng_callbacks_active;
callback_status			*eng_pcalltable;

short			        eng_labelnum;
char					*eng_plabellist;
char					*eng_pgates;

char					*eng_piters;
short			        eng_labelnum2;
char					*eng_plabellist2;

unsigned char			eng_gates_per_seq;
char					*eng_pgates2;

unsigned char			eng_iters_per_seq;
char					*eng_piters2;

char					*eng_piters3;

short			eng_tracks;
unsigned char			eng_tracks_active2;
unsigned char			*eng_ptrk_indxs2;
track_status			*eng_ptrk_stat_1;
sequence_status			*eng_seq_stat_2;

short			        eng_labelnum3;
short			eng_tracks2;
char					*eng_plabellist3;
unsigned char			eng_tracks_active3;
unsigned char			*eng_ptrk_indxs3;
track_status			*eng_ptrk_stat_2;
sequence_status			*eng_seq_stat_3;

short			        eng_labelnum4;
short			eng_tracks3;
char					*eng_plabellist4;
unsigned char			eng_tracks_active4;
unsigned char			*eng_ptrk_indxs4;
track_status			*eng_ptrk_stat_3;
sequence_status			*eng_seq_stat_4;

short			eng_tracks4;
unsigned char			eng_tracks_active5;
unsigned char			*eng_ptrk_indxs5;
track_status			*eng_ptrk_stat_4;
sequence_status			*eng_seq_stat_5;

sequence_status			*eng_seq_stat_6;
track_status			*eng_ptrk_stat_5;
unsigned char			*eng_ptrk_indxs6;
unsigned long			eng_tracks_active6;
unsigned long			eng_max_trks_perseq;

track_status *eng_tmp_ptrkstattbl;
unsigned char eng_tmp_trks_active;
unsigned int eng_tmp_trk_work_areas;
unsigned int eng_tmp_ppos;
