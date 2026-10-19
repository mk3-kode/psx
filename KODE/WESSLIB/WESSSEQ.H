#ifndef _WESSSEQ_H
#define _WESSSEQ_H

#include <libspu.h>
#include "wessarc.h"
#include "wessapi.h"

typedef struct NoteData {
    short  seq_num;
    short  track;
    char   keynum;
    char   velnum;
    short  pad1;
    patchmaps_header *patchmap;
    patchinfo_header *patchinfo;
}NoteData;

typedef struct NoteState {
    int      numnotes;
    NoteData nd[24];
}NoteState;

extern unsigned char	master_sfx_volume;
extern unsigned char	master_mus_volume;
extern unsigned char	pan_status;
extern unsigned char	release_rate;

extern char *Read_Vlq(char *pstart, void *deltatime);
extern char *Write_Vlq(char *dest, unsigned int deltatime);
extern int Len_Vlq(unsigned int deltatime);

extern int SeqOn;
extern void(*drv_cmds[19])();

extern void add_music_mute_note(int seq_num, int track, int keynum, int velnum, patchmaps_header *patchmap, patchinfo_header *patchinfo);

extern void Dvr_NoteSetHandle(voice_status *pvoices_stat);
extern void Dvr_NoteOn(track_status *ptk_stat,
	           patchmaps_header *patchmap, patchinfo_header *patchinfo,
	           unsigned char keynum, unsigned char velnum);
extern void Eng_TrkOff();

extern void(*DrvFunctions[36])();
extern void SeqEngine(void);

#endif // _WESSSEQ_H
