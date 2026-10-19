#ifndef _WESSARC_H
#define _WESSARC_H

//#include "psxspu.h"
#include "psxcd.h"

enum DriverIds {NoSound_ID,PSX_ID,GENERIC_ID=50};

enum SoundHardwareTags {
    SNDHW_TAG_END,
    SNDHW_TAG_DRIVER_ID,
    SNDHW_TAG_SOUND_EFFECTS,
    SNDHW_TAG_MUSIC,
    SNDHW_TAG_DRUMS,
    SNDHW_TAG_MAX
};

// Driver/sequencer command ids
enum DriverCmd {
    DriverInit          = 0,
    DriverExit          = 1,
    DriverEntry1        = 2,
    DriverEntry2        = 3,
    DriverEntry3        = 4,
    TrkOff              = 5,
    TrkMute             = 6,
    PatchChg            = 7,
    PatchMod            = 8,
    PitchMod            = 9,
    ZeroMod             = 10,
    ModuMod             = 11,
    VolumeMod           = 12,
    PanMod              = 13,
    PedalMod            = 14,
    ReverbMod           = 15,
    ChorusMod           = 16,
    NoteOn              = 17,
    NoteOff             = 18,
    StatusMark          = 19,
    GateJump            = 20,
    IterJump            = 21,
    ResetGates          = 22,
    ResetIters          = 23,
    WriteIterBox        = 24,
    SeqTempo            = 25,
    SeqGosub            = 26,
    SeqJump             = 27,
    SeqRet              = 28,
    SeqEnd              = 29,
    TrkTempo            = 30,
    TrkGosub            = 31,
    TrkJump             = 32,
    TrkRet              = 33,
    TrkEnd              = 34,
    NullEvent           = 35
};

//LCD FILE Structs
typedef struct
{
	short	patchmap_cnt;
	short	patchmap_idx;
}patches_header;
//int i = sizeof(patches_header);

typedef struct
{
	unsigned char priority;
	unsigned char reverb;
	unsigned char volume;
	signed char pan;
	unsigned char root_key;
	unsigned char fine_adj;
	unsigned char note_min;
	unsigned char note_max;
	signed char pitchstep_min;
	signed char pitchstep_max;
	short sample_id;
	unsigned short adsr1;
	unsigned short adsr2;
}patchmaps_header;

typedef struct
{
	unsigned int	sample_offset;
	unsigned int	sample_size;
	unsigned long	sample_pos;
}patchinfo_header;

typedef struct
{
	int				module_id_text;
	unsigned int	module_version;
	short	sequences;
	unsigned char	patch_types_infile;
	unsigned char	seq_work_areas;
	unsigned char	trk_work_areas;
	unsigned char	gates_per_seq;
	unsigned char	iters_per_seq;
	unsigned char	callback_areas;
}module_header;

typedef struct
{
	unsigned char	voices_type;
	unsigned char	voices_max;
	unsigned char	priority;
	unsigned char	lockchannel;
	unsigned char	voices_class;
	unsigned char	reverb;
	unsigned short	initpatchnum;
	unsigned short	initpitch_cntrl;
	unsigned char	initvolume_cntrl;
	unsigned char	initpan_cntrl;
	unsigned char	substack_count;
	unsigned char	mutebits;
	unsigned short	initppq;
	unsigned short	initqpm;
	short	labellist_count;
	unsigned int	data_size;
}track_header;

typedef struct
{
	track_header	trk_hdr;
	unsigned long   *plabellist;
	char			*ptrk_data;
}track_data;

typedef struct
{
	short tracks;
	unsigned short unk1;
}seq_header;

typedef struct
{
	seq_header		seq_hdr;
	track_data		*ptrk_info;
	unsigned int	fileposition;
	unsigned int	trkinfolength;
	unsigned int	trkstoload;
}sequence_data;

typedef struct
{
	module_header	mod_hdr;
	sequence_data	*pseq_info;
}module_data;

typedef void (*callfunc_t)();
typedef struct
{
	unsigned char	active;
	unsigned char	type;
	short	curval;
	callfunc_t      callfunc;
}callback_status;

typedef struct
{
	unsigned int	load_flags;
	unsigned char	patch_id;
	unsigned char	hw_voice_limit;
	unsigned short	pad1;
	short	patches;
	short	patch_size;
	short	patchmaps;
	short	patchmap_size;
	short	patchinfo;
	short	patchinfo_size;
	short	drummaps;
	short	drummap_size;
	unsigned int	extra_data_size;
}patch_group_header;

typedef struct
{
	int hardware_ID;
	unsigned long sfxload:1;
	unsigned long musload:1;
	unsigned long drmload:1;
}hardware_table_list;

typedef struct
{
	patch_group_header pat_grp_hdr;
	char				*ppat_data;
	int			 data_fileposition;
	int				sndhw_tags[10];
	hardware_table_list	hw_tl_list;
}patch_group_data;

#define SEQ_STATE_STOPPED 0
#define SEQ_STATE_PLAYING 1

//track
#define TRK_ACTIVE	1
#define TRK_MUTE	2
#define TRK_HANDLED	4
#define TRK_STOPPED	8
#define TRK_TIMED	16
#define TRK_LOOPED	32
#define TRK_SKIP	64
#define TRK_OFF	    128

//seq
#define SEQ_ACTIVE	1
#define SEQ_HANDLE	2

//voice
#define VOICE_ACTIVE	1
#define VOICE_RELEASE	2

typedef struct
{
	unsigned long	active:1;
	unsigned long	handle:1;
	unsigned long	flagpad:6;
	unsigned char	playmode;
	short	seq_num;
	unsigned char	tracks_active;
	unsigned char	tracks_playing;
	unsigned char	volume;
	unsigned char	pan;
	unsigned int	seq_type;
	char			*ptrk_indxs;
	char			*pgates;
	char			*piters;
}sequence_status;

typedef struct
{
	unsigned long	active:1;
	unsigned long	mute:1;
	unsigned long	handled:1;
	unsigned long	stopped:1;
	unsigned long	timed:1;
	unsigned long	looped:1;
	unsigned long	skip:1;
	unsigned long	off:1;
	unsigned char	refindx;
	unsigned char	seq_owner;
	unsigned char	patchtype;
	unsigned int	deltatime;
	unsigned char	priority;
	unsigned char	reverb;
	short	patchnum;
	unsigned char	volume_cntrl;
	unsigned char	pan_cntrl;
	short	        pitch_cntrl;
	unsigned char	voices_active;
	unsigned char	voices_max;
	unsigned char	mutemask;
	unsigned char	sndclass;
	unsigned short	ppq;
	unsigned short	qpm;
	short	labellist_count;
	unsigned short	labellist_max;
	unsigned long	ppi;
	unsigned long	starppi;
	unsigned int	accppi;
	unsigned int	totppi;
	unsigned int	endppi;
	unsigned char	*pstart;
	unsigned char	*ppos;
	unsigned long   *plabellist;
	unsigned char   **psubstack;
	unsigned char   **psp;
	unsigned char   **pstackend;
	unsigned int	data_size;
	unsigned int	data_space;
}track_status;

typedef struct
{
	unsigned long	    active:1;
	unsigned long	    release:1;
	unsigned long	    flagpad:6;
	unsigned char	    patchtype;
	unsigned char	    refindx;
	unsigned char	    track;
	unsigned char	    priority;
	unsigned char	    keynum;
	unsigned char	    velnum;
	unsigned char	    sndtype;
	patchmaps_header   *patchmaps;
	patchinfo_header   *patchinfo;
	unsigned long	    pabstime;
	unsigned long	    adsr2;
}voice_status;

typedef struct
{
	unsigned long		*pabstime;
	unsigned char		seqs_active;
	unsigned char		trks_active;
	unsigned char		voices_active;
	unsigned char		voices_total;
	unsigned char		patch_types_loaded;
	unsigned char		unk1;
	unsigned char		callbacks_active;
	unsigned char		unk3;
	module_data			*pmod_info;
	callback_status		*pcalltable;
	char				*pmaster_volume;
	patch_group_data	*ppat_info;
	unsigned char		max_trks_perseq;
	sequence_status		*pseqstattbl;
	unsigned char		max_substack_pertrk;
	track_status		*ptrkstattbl;
	unsigned char		max_voices_pertrk;
	voice_status		*pvoicestattbl;
	unsigned long		fp_module;
}master_status_structure;

typedef master_status_structure pmasterstat;

#define WESS_SSSP_TEXT		(*(unsigned long *)"SPSX")
#define WESS_CORE_VERSION	0x01

#define SNDFX_CLASS		0
#define MUSIC_CLASS		1
#define DRUMS_CLASS		2
#define SFXDRUMS_CLASS	3

#define TAG_SOUND_EFFECTS 1
#define TAG_MUSIC         2
#define TAG_DRUMS         4

#define LOAD_PATCHES	1
#define LOAD_PATCHMAPS	2
#define LOAD_PATCHINFO	4
#define LOAD_DRUMMAPS	8
#define LOAD_EXTRADATA	16

///----------------------------------
extern void (**CmdFuncArr[10])(track_status *);

extern int SeqOn;
extern volatile unsigned long millicount;
extern int WessTimerActive;

#ifndef SEEK_SET
#define SEEK_SET PSXCD_SEEK_SET
#define SEEK_CUR PSXCD_SEEK_CUR
#define SEEK_END PSXCD_SEEK_END
#endif
#ifndef NULL
#define NULL 0
#endif

typedef PsxCd_File Wess_File_IO_Struct;
typedef PsxCd_File Wess_Data_IO_Struct;

extern short GetIntsPerSec(void);
extern unsigned long CalcPartsPerInt(short ips,short ppq,short qpm);

extern void init_WessTimer(void);
extern void exit_WessTimer(void);

extern void wess_low_level_exit(void);
extern void *wess_malloc(int size);
extern void wess_free(char *mem);

#endif // _WESSARC_H
