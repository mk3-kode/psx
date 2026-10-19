/******************************************************************************
 File: mksound.h

 By: David Schwartz

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III sound Header
******************************************************************************/

#ifndef __mk_mksound_h__
#define __mk_mksound_h__

#include "mk3snd.h"

/*
 * 	DEFINITIONS
 */

/* sound priorities */
#define SP_WOOSH1	0x10*0x100
#define SP_GROUND	0x18*0x100
#define SP_BLOCK1	0x1f*0x100

#define SP_DONTIN	0x30*0x100		// 30s = dont interupt myself
#define SP_RUNRUN	0x31*0x100

#define SP_ONLY1	0x40*0x100		// 40s = special (dont overlap)
#define SP_WINDY1	0x41*0x100

#define SP_EFFECT	0x50*0x100
#define SP_HIT1		0x55*0x100
#define SP_VOICE1	0x60*0x100
#define SP_HIT2		0x61*0x100
#define SP_KAHNVC	0x62*0x100
#define SP_COIN		0x7f*0x100

/* group offsets */
#define GP_FEMALE	0
#define GP_MALE1	1
#define GP_MALE2	2
#define GP_MALE3	3
#define GP_MALE4	4
#define GP_ROBO		5
#define GP_KANG		6
#define GP_SHEEVA	 7
#define GP_SHAO_KAHN  8

/* tracks of the various tunes */
#define TRK_LADDER_STRT  			3		/* ladder start screen, ONEPLAY0.RAW */
#define TRK_ATTRACT		  			4		/* attract mode, SLOWATTR.RAW */
#define TRK_OPT_ATTRACT 			5		/* attract mode, FASTATTR.RAW */
#define TRK_VS						6		/* versus screen, VERSUSSC.RAW */
#define TRK_SELECT			 		7		/* select screen, SELECTSC.RAW */
#define TRK_BUYIN					8		/* buyin screen, BUYIN.RAW */
#define TRK_YOUWIN					9
#define TRK_BABYP1					10		/* babality ending part 1, FATAL1.RAW */
#define TRK_FATALP1					10		/* fatality ending part 1, FATAL1.RAW */
#define TRK_FATALP3 				11		/* fatality ending part 3, SKFATAL.RAW */
#define TRK_ANIMALP1				12	/* animality ending part 1, ANIMAL1.RAW */
#define TRK_ANIMALP3				13	/* animality ending part 3, ANIMALIT.RAW */
#define TRK_BABYP3					14	/* babality ending part 3, BABALITY.RAW */
#define TRK_FRIENDP1				15		/* friendship ending part 1, FRIEND1.RAW */
#define TRK_FRIENDP3				16		/* friendship ending part 3, SKFRIEND.RAW */
#define TRK_BANK					17	/* bank background, BANK.RAW */
#define TRK_THRUBANK				18		/* thru bank to city , THRUBANK.RAW */
#define TRK_PIT						19		/* the pit background, THEPIT.RAW */
#define TRK_SOUL				 	20		/* souls background, GREENFLA.RAW */
#define TRK_ROOF				 	21		/* city roof background, ROOF.RAW */
#define TRK_CHURCH					22	/* temple background, CHRUCH.RAW */
#define TRK_STREET					23		/* street background, STREET.RAW */
#define TRK_THRUSUB					24		/* thru subway to street, THRUSUBW.RAW */
#define TRK_SUBWAY					25		/* subway background, TRAIN.RAW */
#define TRK_HIDDEN					26		/* hidden background, SPECIALM.RAW */
#define TRK_GRAVE				 	27		/* graveyard background, GRAVEYAR.RAW */
#define TRK_BRIDGE					28	/* bridge background, BRIDGE.RAW */
#define TRK_KANO_WINS				33		/* all winning endings, STcharacter.RAW */
#define TRK_SONYA_WINS              30
#define TRK_JAX_WINS                35
#define TRK_INDIAN_WINS             45
#define TRK_SUBZERO_WINS            32
#define TRK_SWAT_WINS               43
#define TRK_LIA_WINS                40
#define TRK_ROBO1_WINS              44
#define TRK_ROBO2_WINS              36
#define TRK_LAO_WINS                39
#define TRK_TUSK_WINS               34
#define TRK_SHEEVA_WINS             31
#define TRK_SHANG_WINS              41
#define TRK_LIUKANG_WINS            38
#define TRK_SMOKE_WINS              37
#define TRK_MOTARO_WINS             42
#define TRK_SK_WINS                 29
#define TRK_KANO_FWINS          TRK_KANO_WINS
#define TRK_SONYA_FWINS         TRK_SONYA_WINS
#define TRK_JAX_FWINS           TRK_JAX_WINS
#define TRK_INDIAN_FWINS        TRK_INDIAN_WINS
#define TRK_SUBZERO_FWINS       TRK_SUBZERO_WINS
#define TRK_SWAT_FWINS          TRK_SWAT_WINS
#define TRK_LIA_FWINS           TRK_LIA_WINS
#define TRK_ROBO1_FWINS         TRK_ROBO1_WINS
#define TRK_ROBO2_FWINS         TRK_ROBO2_WINS
#define TRK_LAO_FWINS           TRK_LAO_WINS
#define TRK_TUSK_FWINS          TRK_TUSK_WINS
#define TRK_SHEEVA_FWINS        TRK_SHEEVA_WINS
#define TRK_SHANG_FWINS         TRK_SHANG_WINS
#define TRK_LIUKANG_FWINS       TRK_LIUKANG_WINS
#define TRK_SMOKE_FWINS         TRK_SMOKE_WINS
#define TRK_MOTARO_FWINS        TRK_MOTARO_WINS
#define TRK_FLAWLESS				62		/* flawless victory, STFLAWLS.RAW */
#define TRK_KANO_MERCY				59		/* all mercy endings, SMcharacter.RAW */
#define TRK_SONYA_MERCY             58
#define TRK_JAX_MERCY               49
#define TRK_INDIAN_MERCY            57
#define TRK_SUBZERO_MERCY           51
#define TRK_SWAT_MERCY              52
#define TRK_LIA_MERCY               56
#define TRK_ROBO1_MERCY             54
#define TRK_ROBO2_MERCY             46
#define TRK_LAO_MERCY               60
#define TRK_TUSK_MERCY              55
#define TRK_SHEEVA_MERCY            53
#define TRK_SHANG_MERCY             47
#define TRK_LIUKANG_MERCY           50
#define TRK_SMOKE_MERCY             48
#define TRK_MOTARO_MERCY            51
#define TRK_FIGHT					61		/* fight, ROUND5.RAW */
#define TRK_RND1_FIGHT	 			33		/* round 1 fight, ROUND1.RAW */
#define TRK_RND2_FIGHT	 			33		/* round 2 fight, ROUND2.RAW */
#define TRK_RND3_FIGHT	 			33		/* round 3 fight, ROUND3.RAW */
#define TRK_RND4_FIGHT	 			33		/* round 4 fight, ROUND4.RAW */


/* smod definitions */
#define SMOD_SELECT 0x01
#define SMOD_FIGHT 0x02
#define SMOD_REWARD 0x03
#define SMOD_HIDDEN 0x04
#define SMOD_SK_DEATH	0x5
#define SMOD_LADDER 0x6
#define SMOD_CAST		0x7
#define SMOD_BUYIN	0x8
#define SMOD_VS			0x9
#define SMOD_GAMEOVER	0xa


/*
 *	RAM
 */
__EXTERN__ LONG snd_module_status;
__EXTERN__ WORD sound_background;

/*
 *	PROTOTYPES
 */
extern short triple_sndtab[];
extern short cd_vol_tbl[];

void group_sound(WORD);
void kill_group_sound(WORD,OBJECT *);
void his_group_sound(WORD);

void rsnd_splish(void);
void rsnd_stab(void);
void rsnd_enemy_boom(void);
void rsnd_klang(void);
void rsnd_footstep(void);
void rsnd_big_block(void);
void rsnd_small_block(void);
void rsnd_smack(void);
void rsnd_med_smack(void);
void rsnd_big_smack(void);
void rsnd_rocks(void);
void sweep_sounds(void);
void rsnd_ground(void);
void rsnd_whoosh(void);
void rsnd_big_whoosh(void);
void rsnd_react_voice(void);

void next_table_sound(WORD pa0,short *pa1);
void triple_sound(WORD pa0);
void tsnd0(short *pa0,WORD pan);

void psound_for_him(WORD offset);
void nosounds(void);
void send_code_a3(WORD pa3);

void hob_ochar_sound(WORD hit_off,WORD block_off);
void hit_or_blocked_sound(WORD hit_off,WORD block_off);

void ochar_sound(WORD);
void ochar_sound_stop(WORD);
void his_ochar_sound(WORD offset);
void rsnd_ochar_sound(WORD pa0l,WORD pa0h);
void borrow_ochar_sound(WORD pa0,WORD pa1);

void play_generic_tune(WORD trk);
void play_generic_stream(WORD trk);

void sound_module_fight(void);
void sound_module_load(WORD mod);

void rsnd_sk_bonus_win(void);

WORD sound_pan_value(void);
void sound_driver_config(void);

/*
 *	MACROS
 */
#define tsound(_off) triple_sound((_off))

#define local_group_sound(_pa0) group_sound(_pa0)

#define get_group_table(_ta0) group_table[_ta0]

#endif /* __mk_mksound_h__ */

