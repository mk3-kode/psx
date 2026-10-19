;#******************************************************************************
;# File: mkstk.s
;#
;# By: David Schwartz
;#
;# Date: August 1994
;#
;# (C) Williams Entertainment
;#
;# Mortal Kombat III Strike Tables
;#******************************************************************************/

	opt c+

;**************************************************************
;* THESE FLAGS MUST MATCH IN (MKUTIL.H)
;**************************************************************
SF_SQUEEZE	=	1	; flag: squeeze
SB_SQUEEZE	=	0	; flag: squeeze
SF_DUCK		=	2	; flag: must duck/block to block

	section	.tabledata

	CNOP 0,4
	global strike_tables
strike_tables
	dw	kano_strikes			; 0
	dw	sonya_strikes			; 1
	dw	jax_strikes				; 2
	dw	indian_strikes			; 3
	dw	sz_strikes				; 4
	dw	swat_strikes			; 5
	dw	lia_strikes				; 6
	dw	robo_strikes			; 7
	dw	robo_strikes			; 8
	dw	lao_strikes				; 9
	dw	tusk_strikes			; 10
	dw	sg_strikes				; 11
	dw	st_strikes				; 12
	dw	lk_strikes				; 13
	dw	robo_strikes			; 14
	dw	mot_strikes				; 15
	dw	sk_strikes				; 16
	dw	kano_strikes			; 17
	dw	kano_strikes			; 18

	CNOP 0,4
sk_strikes
	dw	stk_sk_punch		; 0 - punch
	dw	stk_sk_kick		; 1 - kick
	dw	stk_sk_hammer		; 2 - hammah time !
	dw	stk_sk_charge		; 3 - charge
	dw	stk_sk_zap		; 4 - zap
	dw	stk_sk_air_charge	; 5 - air charge

	CNOP 0,4
stk_sk_punch
	dh	$53		; x offset of collision box
	dh	$12		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$75		; y size of collision box
	dh	$6215		; strike routine
	dh	$2206		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sk_kick
	dh	$6d		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$3d		; y size of collision box
	dh	$6215		; strike routine
	dh	$2706		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sk_hammer
	dh	$86		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$77		; x size of collision box
	dh	$39		; y size of collision box
	dh	$6315		; strike routine
	dh	$2706		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sk_charge
	dh	$40		; x offset of collision box
	dh	$11		; y offset of collision box
	dh	$42		; x size of collision box
	dh	$90		; y size of collision box
	dh	$6415		; strike routine
	dh	$2005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sk_zap
	dh	$78		; x offset of collision box
	dh	$29		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$31		; y size of collision box
	dh	$6415		; strike routine
	dh	$2306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sk_air_charge
	dh	$4d		; x offset of collision box
	dh	$17		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$4a		; y size of collision box
	dh	$6515		; strike routine
	dh	$2005		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Motaro Strikes									     *
*											     *
**************************************************************************
	CNOP 0,4
mot_strikes
	dw	stk_mot_punch		; 0
	dw	stk_mot_kick
	dw	stk_mot_sweep
	dw	stk_mot_zap
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy


	CNOP 0,4
stk_mot_punch
	dh	$6b		; x offset of collision box
	dh	$12		; y offset of collision box
	dh	$5f		; x size of collision box
	dh	$75		; y size of collision box
	dh	$6015		; strike routine
	dh	$2809		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_mot_kick
	dh	$0b		; x offset of collision box
	dh	$23		; y offset of collision box
	dh	$72		; x size of collision box
	dh	$64		; y size of collision box
	dh	$6115		; strike routine
	dh	$300d		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_mot_sweep
	dh	$e3		; x offset of collision box
	dh	$6e		; y offset of collision box
	dh	$bd		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0403		; strike routine
	dh	$2007		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_mot_zap
	dh	$0d		; x offset of collision box
	dh	$fff2		; y offset of collision box
	dh	$19		; x size of collision box
	dh	$1c		; y size of collision box
	dh	$6015		; strike routine
	dh	$2005		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Liu Kang strikes 									     *
*											     *
**************************************************************************
	CNOP 0,4
lk_strikes
	dw	stk_lk_hikick			; 0
	dw	stk_lk_lokick			; 1
	dw	stk_lk_hi_punch   		; 2
	dw	stk_lk_lo_punch   		; 3
	dw	stk_lk_sweep			; 4
	dw	stk_lk_duck_punch		; 5
	dw	stk_lk_duck_kickh		; 6
	dw	stk_lk_duck_kickl		; 7
	dw	stk_lk_uppercut   		; 8
	dw	stk_lk_jump_punch		; 9
	dw	stk_lk_jump_kick		; a
	dw	stk_lk_flip_kick		; d
	dw	stk_lk_flip_punch		; c
	dw	stk_lk_roundh			; d
	dw	stk_lk_knee			; e
	dw	stk_lk_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_lk_zap			; 11
	dw	stk_lk_bike			; 12
	dw	stk_super_kang			; 13
	dw	stk_dummy			; 14
	dw	stk_dummy			;
	dw	stk_dummy			;
	dw	stk_dummy			;

	CNOP 0,4
stk_lk_hikick
	dh	$4e		; x offset of collision box
	dh	$0e		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$2a		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_lokick
	dh	$5f		; x offset of collision box
	dh	$30		; y offset of collision box
	dh	$4f		; x size of collision box
	dh	$0f		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_hi_punch
	dh	$48		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_lo_punch
	dh	$54		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$41		; x size of collision box
	dh	$15		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_sweep
	dh	$6a		; x offset of collision box
	dh	$6c		; y offset of collision box
	dh	$4a		; x size of collision box
	dh	$19		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_lk_duck_punch
	dh	$4d		; x offset of collision box
	dh	$49		; y offset of collision box
	dh	$3b		; x size of collision box
	dh	$10		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_duck_kickh
	dh	$50		; x offset of collision box
	dh	$37		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$21		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_duck_kickl
	dh	$51		; x offset of collision box
	dh	$6d		; y offset of collision box
	dh	$3c		; x size of collision box
	dh	$18		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_uppercut
	dh	$46		; x offset of collision box
	dh	$fff6		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$43		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_jump_punch
	dh	$55		; x offset of collision box
	dh	$05		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$28		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_jump_kick
	dh	$3d		; x offset of collision box
	dh	$fffa		; y offset of collision box
	dh	$36		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_flip_kick
	dh	$57		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_flip_punch
	dh	$55		; x offset of collision box
	dh	$05		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$28		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_roundh
	dh	$6b		; x offset of collision box
	dh	$05		; y offset of collision box
	dh	$53		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_knee
	dh	$47		; x offset of collision box
	dh	$21		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$3d		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_elbow
	dh	$40		; x offset of collision box
	dh	$0c		; y offset of collision box
	dh	$2e		; x size of collision box
	dh	$32		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_zap
	dh	$d0		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$51		; x size of collision box
	dh	$14		; y size of collision box
	dh	$5501		; strike routine
	dh	$1603		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lk_bike
	dh	$42		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$41		; x size of collision box
	dh	$2a		; y size of collision box
	dh	$5600		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_super_kang
	dh	$63		; x offset of collision box
	dh	$21		; y offset of collision box
	dh	$4b		; x size of collision box
	dh	$1c		; y size of collision box
	dh	$5700		; strike routine
	dh	$1704		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Shang Tsung strikes 									     *
*											     *
**************************************************************************
	CNOP 0,4
st_strikes
	dw	stk_st_hikick			; 0
	dw	stk_st_lokick			; 1
	dw	stk_st_hi_punch   		; 2
	dw	stk_st_lo_punch   		; 3
	dw	stk_st_sweep			; 4
	dw	stk_st_duck_punch		; 5
	dw	stk_st_duck_kickh		; 6
	dw	stk_st_duck_kickl		; 7
	dw	stk_st_uppercut   		; 8
	dw	stk_st_jump_punch		; 9
	dw	stk_st_jump_kick		; a
	dw	stk_st_flip_kick		; d
	dw	stk_st_flip_punch		; c
	dw	stk_st_roundh			; d
	dw	stk_st_knee			; e
	dw	stk_st_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_st_zap			; 11
	dw	stk_summon			; 12
	dw	stk_dummy			; 13
	dw	stk_dummy			; 14
	dw	stk_dummy			;
	dw	stk_dummy			;
	dw	stk_dummy			;


	CNOP 0,4
stk_st_hikick
	dh	$55		; x offset of collision box
	dh	$fffb		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$31		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_lokick
	dh	$6a		; x offset of collision box
	dh	$27		; y offset of collision box
	dh	$53		; x size of collision box
	dh	$14		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_hi_punch
	dh	$54		; x offset of collision box
	dh	$03		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_lo_punch
	dh	$53		; x offset of collision box
	dh	$18		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$1b		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_sweep
	dh	$60		; x offset of collision box
	dh	$67		; y offset of collision box
	dh	$52		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_st_duck_punch
	dh	$4d		; x offset of collision box
	dh	$37		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$10		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_duck_kickh
	dh	$59		; x offset of collision box
	dh	$3c		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$1c		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_duck_kickl
	dh	$5a		; x offset of collision box
	dh	$69		; y offset of collision box
	dh	$44		; x size of collision box
	dh	$15		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_uppercut
	dh	$55		; x offset of collision box
	dh	$fff2		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$40		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_jump_punch
	dh	$57		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$28		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_jump_kick
	dh	$5d		; x offset of collision box
	dh	$fff5		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$2d		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_flip_kick
	dh	$57		; x offset of collision box
	dh	$17		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_flip_punch
	dh	$57		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$28		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_roundh
	dh	$65		; x offset of collision box
	dh	$fff6		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$37		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_knee
	dh	$4a		; x offset of collision box
	dh	$21		; y offset of collision box
	dh	$36		; x size of collision box
	dh	$3d		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_elbow
	dh	$47		; x offset of collision box
	dh	$fffe		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$30		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_st_zap
	dh	$9a		; x offset of collision box
	dh	$15		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$16		; y size of collision box
	dh	$5101		; strike routine
	dh	$0d02		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_summon
	dh	$14		; x offset of collision box
	dh	$ff9b		; y offset of collision box
	dh	$27		; x size of collision box
	dh	$5d		; y size of collision box
	dh	$5001		; strike routine
	dh	$0803		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   She Goro strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
sg_strikes
	dw	stk_sg_hikick			; 0
	dw	stk_sg_lokick			; 1
	dw	stk_sg_hi_punch   		; 2
	dw	stk_sg_lo_punch   		; 3
	dw	stk_sg_sweep			; 4
	dw	stk_sg_duck_punch		; 5
	dw	stk_sg_duck_kickh		; 6
	dw	stk_sg_duck_kickl		; 7
	dw	stk_sg_uppercut   		; 8
	dw	stk_sg_jump_punch		; 9
	dw	stk_sg_jump_kick		; a
	dw	stk_sg_flip_kick		; d
	dw	stk_sg_flip_punch		; c
	dw	stk_sg_roundh			; d
	dw	stk_sg_knee			; e
	dw	stk_sg_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_sg_zap			; 11
	dw	stk_pounce			; 12
	dw	stk_boss_pounce			; 13
	dw	stk_dummy			; 14
	dw	stk_dummy			;
	dw	stk_dummy			;
	dw	stk_dummy			;


	CNOP 0,4
stk_sg_hikick
	dh	$65		; x offset of collision box
	dh	$16		; y offset of collision box
	dh	$50		; x size of collision box
	dh	$2a		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_lokick
	dh	$6b		; x offset of collision box
	dh	$31		; y offset of collision box
	dh	$53		; x size of collision box
	dh	$14		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_hi_punch
	dh	$52		; x offset of collision box
	dh	$12		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_lo_punch
	dh	$4a		; x offset of collision box
	dh	$2b		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$1e		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_sweep
	dh	$63		; x offset of collision box
	dh	$73		; y offset of collision box
	dh	$52		; x size of collision box
	dh	$21		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_sg_duck_punch
	dh	$56		; x offset of collision box
	dh	$4a		; y offset of collision box
	dh	$47		; x size of collision box
	dh	$13		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_duck_kickh
	dh	$5d		; x offset of collision box
	dh	$3d		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$2f		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_duck_kickl
	dh	$60		; x offset of collision box
	dh	$7a		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$20		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_uppercut
	dh	$56		; x offset of collision box
	dh	$fff0		; y offset of collision box
	dh	$4b		; x size of collision box
	dh	$53		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_jump_punch
	dh	$49		; x offset of collision box
	dh	$0a		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$2f		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_jump_kick
	dh	$5a		; x offset of collision box
	dh	$15		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_flip_kick
	dh	$4f		; x offset of collision box
	dh	$28		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_flip_punch
	dh	$49		; x offset of collision box
	dh	$0a		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$2f		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_roundh
	dh	$77		; x offset of collision box
	dh	$03		; y offset of collision box
	dh	$51		; x size of collision box
	dh	$38		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_knee
	dh	$51		; x offset of collision box
	dh	$21		; y offset of collision box
	dh	$3c		; x size of collision box
	dh	$4a		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_elbow
	dh	$4b		; x offset of collision box
	dh	$18		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$30		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sg_zap
	dh	$01		; x offset of collision box
	dh	$ffed		; y offset of collision box
	dh	$30		; x size of collision box
	dh	$26		; y size of collision box
	dh	$5c01		; strike routine
	dh	$1a03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_pounce
	dh	$23		; x offset of collision box
	dh	$26		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$4b		; y size of collision box
	dh	$5b0e		; strike routine (unblockable)
	dh	$2020		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_boss_pounce
	dh	$23		; x offset of collision box
	dh	$26		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$4b		; y size of collision box
	dh	$5b01		; strike routine (unblockable)
	dh	$2020		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Tusk strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
tusk_strikes
	dw	stk_tusk_hikick			; 0
	dw	stk_tusk_lokick			; 1
	dw	stk_tusk_hi_punch   		; 2
	dw	stk_tusk_lo_punch   		; 3
	dw	stk_tusk_sweep			; 4
	dw	stk_tusk_duck_punch		; 5
	dw	stk_tusk_duck_kickh		; 6
	dw	stk_tusk_duck_kickl		; 7
	dw	stk_tusk_uppercut   		; 8
	dw	stk_tusk_jump_punch		; 9
	dw	stk_tusk_jump_kick		; a
	dw	stk_tusk_flip_kick		; d
	dw	stk_tusk_flip_punch		; c
	dw	stk_tusk_roundh			; d
	dw	stk_tusk_knee			; e
	dw	stk_tusk_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_tusk_zap			; 11
	dw	stk_tusk_blur			; 12
	dw	stk_tusk_saw			; 13
	dw	stk_dummy			; 14
	dw	stk_dummy			;
	dw	stk_dummy			;
	dw	stk_dummy			;

	CNOP 0,4
stk_tusk_hikick
	dh	$58		; x offset of collision box
	dh	$15		; y offset of collision box
	dh	$50		; x size of collision box
	dh	$2a		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_lokick
	dh	$63		; x offset of collision box
	dh	$31		; y offset of collision box
	dh	$4c		; x size of collision box
	dh	$14		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_hi_punch
	dh	$54		; x offset of collision box
	dh	$11		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$21		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_lo_punch
	dh	$5f		; x offset of collision box
	dh	$28		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$15		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_sweep
	dh	$68		; x offset of collision box
	dh	$70		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$1c		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_tusk_duck_punch
	dh	$51		; x offset of collision box
	dh	$50		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$0e		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_duck_kickh
	dh	$51		; x offset of collision box
	dh	$45		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_duck_kickl
	dh	$56		; x offset of collision box
	dh	$74		; y offset of collision box
	dh	$43		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_uppercut
	dh	$47		; x offset of collision box
	dh	$00		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$43		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_jump_punch
	dh	$56		; x offset of collision box
	dh	$1c		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$29		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_jump_kick
	dh	$51		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$42		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_flip_kick
	dh	$5a		; x offset of collision box
	dh	$2b		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$2d		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_flip_punch
	dh	$56		; x offset of collision box
	dh	$1c		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$29		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_roundh
	dh	$65		; x offset of collision box
	dh	$15		; y offset of collision box
	dh	$4d		; x size of collision box
	dh	$30		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_knee
	dh	$4a		; x offset of collision box
	dh	$3a		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$32		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_elbow
	dh	$47		; x offset of collision box
	dh	$2c		; y offset of collision box
	dh	$3b		; x size of collision box
	dh	$22		; y size of collision box
	dh	$4c07		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_zap
	dh	$31		; x offset of collision box
	dh	$ffef		; y offset of collision box
	dh	$2a		; x size of collision box
	dh	$19		; y size of collision box
	dh	$4a01		; strike routine
	dh	$1703		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_blur
	dh	$21		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$7e		; y size of collision box
	dh	$4b00		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_tusk_saw
	dh	$14		; x offset of collision box
	dh	$ffd4		; y offset of collision box
	dh	$22		; x size of collision box
	dh	$2b		; y size of collision box
	dh	$4d00		; strike routine
	dh	$1202		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Kung Lao strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
lao_strikes
	dw	stk_lao_hikick			; 0
	dw	stk_lao_lokick			; 1
	dw	stk_lao_hi_punch   		; 2
	dw	stk_lao_lo_punch   		; 3
	dw	stk_lao_sweep			; 4
	dw	stk_lao_duck_punch		; 5
	dw	stk_lao_duck_kickh		; 6
	dw	stk_lao_duck_kickl		; 7
	dw	stk_lao_uppercut   		; 8
	dw	stk_lao_jump_punch		; 9
	dw	stk_lao_jump_kick		; a
	dw	stk_lao_flip_kick		; d
	dw	stk_lao_flip_punch		; c
	dw	stk_lao_roundh			; d
	dw	stk_lao_knee			; e
	dw	stk_lao_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_lao_zap			; 11
	dw	stk_lao_angle			; 12
	dw	stk_lao_spin			; 13
	dw	stk_dummy			; 14
	dw	stk_dummy			;
	dw	stk_dummy			;
	dw	stk_dummy			;

	CNOP 0,4
stk_lao_hikick
	dh	$55		; x offset of collision box
	dh	$06		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$2e		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_lokick
	dh	$64		; x offset of collision box
	dh	$25		; y offset of collision box
	dh	$4c		; x size of collision box
	dh	$14		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_hi_punch
	dh	$4a		; x offset of collision box
	dh	$03		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$23		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_lo_punch
	dh	$51		; x offset of collision box
	dh	$1b		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$1c		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_sweep
	dh	$6e		; x offset of collision box
	dh	$69		; y offset of collision box
	dh	$4c		; x size of collision box
	dh	$18		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_lao_duck_punch
	dh	$4a		; x offset of collision box
	dh	$39		; y offset of collision box
	dh	$3b		; x size of collision box
	dh	$13		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_duck_kickh
	dh	$4b		; x offset of collision box
	dh	$39		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$31		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_duck_kickl
	dh	$57		; x offset of collision box
	dh	$69		; y offset of collision box
	dh	$43		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_uppercut
	dh	$3a		; x offset of collision box
	dh	$ffef		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$46		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_jump_punch
	dh	$68		; x offset of collision box
	dh	$15		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$2e		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_jump_kick
	dh	$52		; x offset of collision box
	dh	$0c		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$3b		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_flip_kick
	dh	$4c		; x offset of collision box
	dh	$2d		; y offset of collision box
	dh	$2c		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_flip_punch
	dh	$67		; x offset of collision box
	dh	$19		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$2d		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_roundh
	dh	$61		; x offset of collision box
	dh	$07		; y offset of collision box
	dh	$45		; x size of collision box
	dh	$31		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_knee
	dh	$40		; x offset of collision box
	dh	$21		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$30		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_elbow
	dh	$3d		; x offset of collision box
	dh	$0c		; y offset of collision box
	dh	$30		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_zap
	dh	$54		; x offset of collision box
	dh	$24		; y offset of collision box
	dh	$2a		; x size of collision box
	dh	$29		; y size of collision box
	dh	$4504		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_angle
	dh	$56		; x offset of collision box
	dh	$34		; y offset of collision box
	dh	$2d		; x size of collision box
	dh	$09		; y size of collision box
	dh	$4600		; strike routine
	dh	$0f02		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_lao_spin
	dh	$28		; x offset of collision box
	dh	$fff9		; y offset of collision box
	dh	$3c		; x size of collision box
	dh	$52		; y size of collision box
	dh	$0801		; strike routine
	dh	$1603		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Robo strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
robo_strikes
	dw	stk_ro_hikick			; 0
	dw	stk_ro_lokick			; 1
	dw	stk_ro_hi_punch			; 2
	dw	stk_ro_lo_punch			; 3
	dw	stk_ro_sweep			; 4
	dw	stk_ro_duck_punch		; 5
	dw	stk_ro_duck_kickh		; 6
	dw	stk_ro_duck_kickl		; 7
	dw	stk_ro_uppercut			; 8
	dw	stk_ro_jump_punch		; 9
	dw	stk_ro_jump_kick		; a
	dw	stk_ro_flip_kick		; d
	dw	stk_ro_flip_punch		; c
	dw	stk_ro_roundh			; d
	dw	stk_ro_knee			; e
	dw	stk_ro_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_ro_net			; 11
	dw	stk_ro_zap			; 12
	dw	stk_ro_tele			; 13
	dw	stk_ro_bomb			; 14
	dw	stk_spear			; 15

	CNOP 0,4
stk_ro_hikick
	dh	$5f		; x offset of collision box
	dh	$0d		; y offset of collision box
	dh	$47		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_lokick
	dh	$6a		; x offset of collision box
	dh	$30		; y offset of collision box
	dh	$47		; x size of collision box
	dh	$10		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_hi_punch
	dh	$4b		; x offset of collision box
	dh	$0e		; y offset of collision box
	dh	$36		; x size of collision box
	dh	$21		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_lo_punch
	dh	$46		; x offset of collision box
	dh	$23		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_sweep
	dh	$6a		; x offset of collision box
	dh	$6b		; y offset of collision box
	dh	$4f		; x size of collision box
	dh	$21		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_ro_duck_punch
	dh	$44		; x offset of collision box
	dh	$3f		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$13		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_duck_kickh
	dh	$48		; x offset of collision box
	dh	$3a		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$38		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_duck_kickl
	dh	$60		; x offset of collision box
	dh	$70		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$17		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_uppercut
	dh	$3c		; x offset of collision box
	dh	$fffa		; y offset of collision box
	dh	$38		; x size of collision box
	dh	$4a		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_jump_punch
	dh	$4b		; x offset of collision box
	dh	$11		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$31		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_jump_kick
	dh	$4b		; x offset of collision box
	dh	$fff6		; y offset of collision box
	dh	$45		; x size of collision box
	dh	$49		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_flip_kick
	dh	$50		; x offset of collision box
	dh	$2d		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$23		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_flip_punch
	dh	$4b		; x offset of collision box
	dh	$11		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$31		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_roundh
	dh	$68		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$4a		; x size of collision box
	dh	$33		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_knee
	dh	$47		; x offset of collision box
	dh	$2c		; y offset of collision box
	dh	$30		; x size of collision box
	dh	$3f		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_elbow
	dh	$3d		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$36		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_zap
	dh	$10		; x offset of collision box
	dh	$fff1		; y offset of collision box
	dh	$23		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$3b04		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_net
	dh	$37		; x offset of collision box
	dh	$ffe0		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$4a		; y size of collision box
	dh	$3c00		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_tele
	dh	$49		; x offset of collision box
	dh	$fff7		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$57		; y size of collision box
	dh	$3d00		; strike routine
	dh	$1002		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ro_bomb
	dh	$2f		; x offset of collision box
	dh	$ffb8		; y offset of collision box
	dh	$53		; x size of collision box
	dh	$57		; y size of collision box
	dh	$3e09		; strike routine
	dh	$1212		; damage
	dh	0

	CNOP 0,4
stk_spear
	dh	$147		; x offset of collision box
	dh	$ffff		; y offset of collision box
	dh	$50		; x size of collision box
	dh	$10		; y size of collision box
	dh	$3f00		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Lia guy strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
lia_strikes
	dw	stk_li_hikick			; 0
	dw	stk_li_lokick			; 1
	dw	stk_li_hi_punch			; 2
	dw	stk_li_lo_punch			; 3
	dw	stk_li_sweep			; 4
	dw	stk_li_duck_punch		; 5
	dw	stk_li_duck_kickh		; 6
	dw	stk_li_duck_kickl		; 7
	dw	stk_li_uppercut			; 8
	dw	stk_li_jump_punch		; 9
	dw	stk_li_jump_kick		; a
	dw	stk_li_flip_kick		; d
	dw	stk_li_flip_punch		; c
	dw	stk_li_roundh			; d
	dw	stk_li_knee			; e
	dw	stk_li_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_li_scream			; 11
	dw	stk_li_angle_zap 		; 12
	dw	stk_li_angle_zap2 		; 13
	dw	stk_li_angle_zap3 		; 14
	dw	stk_li_forward			; 15

	CNOP 0,4
stk_li_hikick
	dh	$59		; x offset of collision box
	dh	$0b		; y offset of collision box
	dh	$47		; x size of collision box
	dh	$2d		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_lokick
	dh	$5f		; x offset of collision box
	dh	$2f		; y offset of collision box
	dh	$42		; x size of collision box
	dh	$0f		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_hi_punch
	dh	$54		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$2f		; x size of collision box
	dh	$23		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_lo_punch
	dh	$54		; x offset of collision box
	dh	$26		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$16		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_sweep
	dh	$6b		; x offset of collision box
	dh	$66		; y offset of collision box
	dh	$4c		; x size of collision box
	dh	$21		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_li_duck_punch
	dh	$4d		; x offset of collision box
	dh	$49		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$13		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_duck_kickh
	dh	$59		; x offset of collision box
	dh	$40		; y offset of collision box
	dh	$47		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_duck_kickl
	dh	$59		; x offset of collision box
	dh	$72		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$18		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_uppercut
	dh	$4a		; x offset of collision box
	dh	$fff3		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$47		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_jump_punch
	dh	$55		; x offset of collision box
	dh	$06		; y offset of collision box
	dh	$2f		; x size of collision box
	dh	$2b		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_jump_kick
	dh	$4f		; x offset of collision box
	dh	$fff8		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$48		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_flip_kick
	dh	$59		; x offset of collision box
	dh	$1a		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$33		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_flip_punch
	dh	$56		; x offset of collision box
	dh	$0c		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$2a		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_roundh
	dh	$4a		; x offset of collision box
	dh	$01		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$39		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_knee
	dh	$51		; x offset of collision box
	dh	$22		; y offset of collision box
	dh	$2f		; x size of collision box
	dh	$3a		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_elbow
	dh	$4c		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$2d		; x size of collision box
	dh	$2c		; y size of collision box

;	dh	$0907		; strike routine
	dh	$4c07		; strike routine

	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_angle_zap
	dh	$53		; x offset of collision box
	dh	$30		; y offset of collision box
	dh	$25		; x size of collision box
	dh	$25		; y size of collision box
	dh	$3704		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_scream
	dh	$9a		; x offset of collision box
	dh	$08		; y offset of collision box
	dh	$6a		; x size of collision box
	dh	$42		; y size of collision box
	dh	$3608		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_angle_zap2
	dh	$7d		; x offset of collision box
	dh	$51		; y offset of collision box
	dh	$2a		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$3704		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_angle_zap3
	dh	$85		; x offset of collision box
	dh	$5b		; y offset of collision box
	dh	$2f		; x size of collision box
	dh	$2b		; y size of collision box
	dh	$3704		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_li_forward
	dh	$72		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$2d		; x size of collision box
	dh	$11		; y size of collision box
	dh	$3704		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Swat guy strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
swat_strikes
	dw	stk_sw_hikick			; 0
	dw	stk_sw_lokick			; 1
	dw	stk_sw_hi_punch			; 2
	dw	stk_sw_lo_punch			; 3
	dw	stk_sw_sweep			; 4
	dw	stk_sw_duck_punch		; 5
	dw	stk_sw_duck_kickh		; 6
	dw	stk_sw_duck_kickl		; 7
	dw	stk_sw_uppercut			; 8
	dw	stk_sw_jump_punch		; 9
	dw	stk_sw_jump_kick		; a
	dw	stk_sw_flip_kick		; d
	dw	stk_sw_flip_punch		; c
	dw	stk_sw_roundh			; d
	dw	stk_sw_knee			; e
	dw	stk_sw_elbow			; f
	dw	stk_sw_bomb			; 10
	dw	stk_dummy			; 11
	dw	stk_sw_zap			; 12
	dw	stk_sw_prezap1			; 13
	dw	stk_sw_prezap2			; 14
	dw	stk_sw_zoom			; 15
	dw	stk_sw_diag_zap2		; 16
	dw	stk_sw_stick_sweep		; 17

	CNOP 0,4
stk_sw_hikick
	dh	$5f		; x offset of collision box
	dh	$0d		; y offset of collision box
	dh	$51		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_lokick
	dh	$67		; x offset of collision box
	dh	$31		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$10		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_hi_punch
	dh	$58		; x offset of collision box
	dh	$0d		; y offset of collision box
	dh	$35  		; x size of collision box
	dh	$24  		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_lo_punch
	dh	$50		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$14		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_sweep
	dh	$6d		; x offset of collision box
	dh	$66		; y offset of collision box
	dh	$4b		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_sw_duck_punch
	dh	$4d		; x offset of collision box
	dh	$46		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$13		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_duck_kickh
	dh	$51		; x offset of collision box
	dh	$3a		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$31		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_duck_kickl
	dh	$5d		; x offset of collision box
	dh	$6f		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_uppercut
	dh	$4e		; x offset of collision box
	dh	$fff6		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$4d		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_jump_punch
	dh	$5a		; x offset of collision box
	dh	$11		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_jump_kick
	dh	$4e		; x offset of collision box
	dh	$02		; y offset of collision box
	dh	$3c		; x size of collision box
	dh	$48		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_flip_kick
	dh	$5d		; x offset of collision box
	dh	$1d		; y offset of collision box
	dh	$41		; x size of collision box
	dh	$36		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_flip_punch
	dh	$5a		; x offset of collision box
	dh	$11		; y offset of collision box
	dh	$3d		; x size of collision box
	dh	$2c		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_roundh
	dh	$6d		; x offset of collision box
	dh	$fff7		; y offset of collision box
	dh	$48		; x size of collision box
	dh	$3b		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_knee
	dh	$4e		; x offset of collision box
	dh	$27		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$36		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_elbow
	dh	$41		; x offset of collision box
	dh	$0d		; y offset of collision box
	dh	$2c		; x size of collision box
	dh	$28		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_zap
	dh	$e9		; x offset of collision box
	dh	$2b		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$13		; y size of collision box
	dh	$3004		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_prezap1
	dh	$87		; x offset of collision box
	dh	$2b		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$13		; y size of collision box
	dh	$3004		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_prezap2
	dh	$ad		; x offset of collision box
	dh	$2b		; y offset of collision box
	dh	$5b		; x size of collision box
	dh	$13		; y size of collision box
	dh	$3004		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_diag_zap1
	dh	$5f		; x offset of collision box
	dh	$ffe4		; y offset of collision box
	dh	$2b		; x size of collision box
	dh	$30		; y size of collision box
	dh	$3000		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_diag_zap2
	dh	$8c		; x offset of collision box
	dh	$ffbc		; y offset of collision box
	dh	$2b		; x size of collision box
	dh	$30		; y size of collision box
	dh	$3000		; strike routine
	dh	$1402		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_bomb
	dh	$17		; x offset of collision box
	dh	$ffed		; y offset of collision box
	dh	$2d		; x size of collision box
	dh	$25		; y size of collision box
	dh	$3104		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_zoom
	dh	$fff2		; x offset of collision box
	dh	$1c		; y offset of collision box
	dh	$28		; x size of collision box
	dh	$24		; y size of collision box
	dh	$3200		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sw_stick_sweep
	dh	$83		; x offset of collision box
	dh	$64		; y offset of collision box
	dh	$74		; x size of collision box
	dh	$04		; y size of collision box
	dh	$3303		; strike routine
	dh	$1a04		; damage
	dh	SF_DUCK

**************************************************************************
*											     *
*   subzero strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
sz_strikes
	dw	stk_sz_hikick			; 0
	dw	stk_sz_lokick			; 1
	dw	stk_sz_hi_punch			; 2
	dw	stk_sz_lo_punch			; 3
	dw	stk_sz_sweep			; 4
	dw	stk_sz_duck_punch		; 5
	dw	stk_sz_duck_kickh		; 6
	dw	stk_sz_duck_kickl		; 7
	dw	stk_sz_uppercut			; 8
	dw	stk_sz_jump_punch		; 9
	dw	stk_sz_jump_kick		; a
	dw	stk_sz_flip_kick		; d
	dw	stk_sz_flip_punch		; c
	dw	stk_sz_roundh			; d
	dw	stk_sz_knee			; e
	dw	stk_sz_elbow			; f
	dw	stk_sz_slide			; 10
	dw	stk_dummy			; 11
	dw	stk_sz_zap			; 12
	dw	stk_sz_forward_zap		; 13
	dw	stk_dummy			; 14
	dw	stk_dummy			; 15
	dw	stk_dummy			; 16
	dw	stk_dummy			; 17


	CNOP 0,4
stk_sz_hikick
	dh	$68		; x offset of collision box
	dh	$0a		; y offset of collision box
	dh	$4e		; x size of collision box
	dh	$2b		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_lokick
	dh	$6f		; x offset of collision box
	dh	$2e		; y offset of collision box
	dh	$4d		; x size of collision box
	dh	$0f		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_hi_punch
	dh	$52		; x offset of collision box
	dh	$06		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$25		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
 	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_lo_punch
	dh	$57		; x offset of collision box
	dh	$1c		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$1c		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_sweep
	dh	$65		; x offset of collision box
	dh	$67		; y offset of collision box
	dh	$52		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_sz_duck_punch
	dh	$46		; x offset of collision box
	dh	$3c		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$18		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_duck_kickh
	dh	$49		; x offset of collision box
	dh	$35		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$31		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_duck_kickl
	dh	$5e		; x offset of collision box
	dh	$60		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$24		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_uppercut
	dh	$51		; x offset of collision box
	dh	$ffee		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$48		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_jump_punch
	dh	$65		; x offset of collision box
	dh	$fff4		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_jump_kick
	dh	$60		; x offset of collision box
	dh	$ffef		; y offset of collision box
	dh	$4c		; x size of collision box
	dh	$42		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_flip_kick
	dh	$64		; x offset of collision box
	dh	$1a		; y offset of collision box
	dh	$41		; x size of collision box
	dh	$29		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_flip_punch
	dh	$65		; x offset of collision box
	dh	$00		; y offset of collision box
	dh	$34		; x size of collision box
	dh	$35		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_roundh
	dh	$5a		; x offset of collision box
	dh	$00		; y offset of collision box
	dh	$48		; x size of collision box
	dh	$36		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_knee
	dh	$41		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$32		; x size of collision box
	dh	$35		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_elbow
	dh	$3e		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$2b		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_zap
	dh	$17		; x offset of collision box
	dh	$3f		; y offset of collision box
	dh	$30		; x size of collision box
	dh	$7e		; y size of collision box
	dh	$2c05		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_slide
	dh	$59		; x offset of collision box
	dh	$65		; y offset of collision box
	dh	$55		; x size of collision box
	dh	$22		; y size of collision box
	dh	$2d00		; strike routine
	dh	$0d03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sz_forward_zap
	dh	$82		; x offset of collision box
	dh	$fff5		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$06		; y size of collision box
	dh	$2c05		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   indian strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
indian_strikes
	dw	stk_ind_hikick			; 0
	dw	stk_ind_lokick			; 1
	dw	stk_ind_hi_punch		; 2
	dw	stk_ind_lo_punch		; 3
	dw	stk_ind_sweep			; 4
	dw	stk_ind_duck_punch		; 5
	dw	stk_ind_duck_kickh		; 6
	dw	stk_ind_duck_kickl		; 7
	dw	stk_ind_uppercut		; 8
	dw	stk_ind_jump_punch		; 9
	dw	stk_ind_jump_kick		; a
	dw	stk_ind_flip_kick		; d
	dw	stk_ind_flip_punch		; c
	dw	stk_ind_roundh			; d
	dw	stk_ind_knee			; e
	dw	stk_ind_elbow			; f
	dw	stk_dummy			; 10
	dw	stk_ind_charge			; 11
	dw	stk_ind_zap			; 12
	dw	stk_axe_horz			; 13
	dw	stk_dummy			; 14
	dw	stk_axe_up			; 15
	dw	stk_dummy			; 16
	dw	stk_dummy			; 17


	CNOP 0,4
stk_ind_hikick
	dh	$64		; x offset of collision box
	dh	$07		; y offset of collision box
	dh	$53		; x size of collision box
	dh	$2f		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_lokick
	dh	$6a		; x offset of collision box
	dh	$2e		; y offset of collision box
	dh	$4d		; x size of collision box
	dh	$13		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_hi_punch
	dh	$4b		; x offset of collision box
	dh	$0b		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$25		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_lo_punch
	dh	$45+4		; x offset of collision box
	dh	$1f		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_sweep
	dh	$6d+4		; x offset of collision box
	dh	$68		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$21		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_ind_duck_punch
	dh	$45+4		; x offset of collision box
	dh	$41		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_duck_kickh
	dh	$3b+4		; x offset of collision box
	dh	$33		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$3c		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_duck_kickl
	dh	$5e+4		; x offset of collision box
	dh	$66		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$20		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_uppercut
	dh	$3e		; x offset of collision box
	dh	$fff3		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$4b		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_jump_punch
	dh	$4d		; x offset of collision box
	dh	$19		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$2b		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_jump_kick
	dh	$52+4		; x offset of collision box
	dh	$04		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$47		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_flip_kick
	dh	$52+4		; x offset of collision box
	dh	$1b		; y offset of collision box
	dh	$3c		; x size of collision box
	dh	$37		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_flip_punch
	dh	$49+4		; x offset of collision box
	dh	$19		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_roundh
	dh	$53		; x offset of collision box
	dh	$0a		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$34		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_knee
	dh	$45		; x offset of collision box
	dh	$3a		; y offset of collision box
	dh	$44		; x size of collision box
	dh	$35		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_elbow
	dh	$43		; x offset of collision box
	dh	$14		; y offset of collision box
	dh	$2b		; x size of collision box
	dh	$16		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_zap
	dh	$74		; x offset of collision box
	dh	$24		; y offset of collision box
	dh	$4c		; x size of collision box
	dh	$12		; y size of collision box
	dh	$2805		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_ind_charge
	dh	$34		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$28		; y size of collision box
	dh	$2901		; strike routine
	dh	$1804		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_axe_horz
	dh	$5d		; x offset of collision box
	dh	$22		; y offset of collision box
	dh	$47		; x size of collision box
	dh	$16		; y size of collision box
	dh	$2a01		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_axe_up
	dh	$58		; x offset of collision box
	dh	$fffe		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$3e		; y size of collision box
	dh	$2b01		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   jax strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
jax_strikes
	dw	stk_jax_hikick			; 0
	dw	stk_jax_lokick			; 1
	dw	stk_jax_hi_punch		; 2
	dw	stk_jax_lo_punch		; 3
	dw	stk_jax_sweep			; 4
	dw	stk_jax_duck_punch		; 5
	dw	stk_jax_duck_kickh		; 6
	dw	stk_jax_duck_kickl		; 7
	dw	stk_jax_uppercut		; 8
	dw	stk_jax_jump_punch		; 9
	dw	stk_jax_jump_kick		; a
	dw	stk_jax_flip_kick		; d
	dw	stk_jax_flip_punch		; c
	dw	stk_jax_roundh			; d
	dw	stk_jax_knee			; e
	dw	stk_jax_elbow			; f
	dw	stk_jax_dash			; 10
	dw	stk_dummy			; 11
	dw	stk_jax_zap			; 12
	dw	stk_jax_prezap			; 13
	dw	stk_noogy			; 14

	CNOP 0,4
stk_jax_hikick
	dh	$5f		; x offset of collision box
	dh	$1e		; y offset of collision box
	dh	$51		; x size of collision box
	dh	$2e		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_lokick
	dh	$69		; x offset of collision box
	dh	$39		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$14		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_hi_punch
	dh	$50		; x offset of collision box
	dh	$1a		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$20		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_lo_punch
	dh	$4e		; x offset of collision box
	dh	$2d		; y offset of collision box
	dh	$3e		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_sweep
	dh	$65		; x offset of collision box
	dh	$7a		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_jax_duck_punch
	dh	$51		; x offset of collision box
	dh	$48		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_duck_kickh
	dh	$3c		; x offset of collision box
	dh	$55		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$42		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_duck_kickl
	dh	$63		; x offset of collision box
	dh	$78		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$20		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_uppercut
	dh	$4b		; x offset of collision box
	dh	$fff8		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$4c		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_jump_punch
	dh	$58		; x offset of collision box
	dh	$12		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$39		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_jump_kick
	dh	$47		; x offset of collision box
	dh	$0f		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$47		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_flip_kick
	dh	$58		; x offset of collision box
	dh	$31		; y offset of collision box
	dh	$42		; x size of collision box
	dh	$29		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_flip_punch
	dh	$47		; x offset of collision box
	dh	$0f		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$47		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_roundh
	dh	$53		; x offset of collision box
	dh	$09		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$36		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_knee
	dh	$52		; x offset of collision box
	dh	$2e		; y offset of collision box
	dh	$30		; x size of collision box
	dh	$37		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_elbow
	dh	$41		; x offset of collision box
	dh	$13		; y offset of collision box
	dh	$36		; x size of collision box
	dh	$29		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_zap
	dh	$73		; x offset of collision box
	dh	$36		; y offset of collision box
	dh	$5c		; x size of collision box
	dh	$10		; y size of collision box
	dh	$2304		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_prezap
	dh	$4f		; x offset of collision box
	dh	$2f		; y offset of collision box
	dh	$4a		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$2304		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_noogy
	dh	$60 		; x offset of collision box
	dh	$0c		; y offset of collision box
	dh	$36		; x size of collision box
	dh	$28		; y size of collision box
	dh	$0d00		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_jax_dash
	dh	$5d		; x offset of collision box
	dh	$24		; y offset of collision box
	dh	$44		; x size of collision box
	dh	$16		; y size of collision box
	dh	$2401		; strike routine
	dh	$1603		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Sonya strikes    									     *
*											     *
**************************************************************************
	CNOP 0,4
sonya_strikes
	dw	stk_sonya_hikick		; 0
	dw	stk_sonya_lokick		; 1
	dw	stk_sonya_hi_punch		; 2
	dw	stk_sonya_lo_punch		; 3
	dw	stk_sonya_sweep			; 4
	dw	stk_sonya_duck_punch		; 5
	dw	stk_sonya_duck_kickh		; 6
	dw	stk_sonya_duck_kickl		; 7
	dw	stk_sonya_uppercut		; 8
	dw	stk_sonya_jump_punch		; 9
	dw	stk_sonya_jump_kick		; a
	dw	stk_sonya_flip_kick		; d
	dw	stk_sonya_flip_punch		; c
	dw	stk_sonya_roundh		; d
	dw	stk_sonya_knee			; e
	dw	stk_sonya_elbow			; f
	dw	stk_sonya_leg			; 10
	dw	stk_sonya_square		; 11
	dw	stk_sonya_zap			; 12
	dw	stk_sonya_prezap		; 13
	dw	stk_sonya_bike			; 14

; 1. new stk table entry
; 2. set hit/block offsets
; 3. set hit/block damage

	CNOP 0,4
stk_sonya_hikick
	dh	$4b+8		; x offset of collision box
	dh	$0f		; y offset of collision box
	dh	$44		; x size of collision box
	dh	$2e		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_lokick
	dh	$52+8		; x offset of collision box
	dh	$30		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_duck_punch
	dh	$39+8		; x offset of collision box
	dh	$40		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$22		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_duck_kickh
	dh	$47+8		; x offset of collision box
	dh	$33		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$3e		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_duck_kickl
	dh	$62+8		; x offset of collision box
	dh	$6d		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$1e		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_uppercut
	dh	$4e		; x offset of collision box
	dh	$fff9		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$43		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_elbow
	dh	$3d+8		; x offset of collision box
	dh	$13		; y offset of collision box
	dh	$29		; x size of collision box
	dh	$27		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_knee
	dh	$40+8		; x offset of collision box
	dh	$2e		; y offset of collision box
	dh	$2b		; x size of collision box
	dh	$37		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_roundh
	dh	$48+8		; x offset of collision box
	dh	$0d		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$10		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_sweep
	dh	$5d+8		; x offset of collision box
	dh	$6e		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$1b		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_sonya_flip_kick
	dh	$41+8		; x offset of collision box
	dh	$23		; y offset of collision box
	dh	$42		; x size of collision box
	dh	$22		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_flip_punch
	dh	$3e+8		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$31		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_jump_punch
	dh	$3e+8		; x offset of collision box
	dh	$10		; y offset of collision box
	dh	$31		; x size of collision box
	dh	$31		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_jump_kick
	dh	$3e+8		; x offset of collision box
	dh	$15		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$3f		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_hi_punch
	dh	$41		; x offset of collision box
	dh	$12		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$1e		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_lo_punch
	dh	$48		; x offset of collision box
	dh	$28		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$13		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_leg
	dh	$6b+8		; x offset of collision box
	dh	$22		; y offset of collision box
	dh	$48		; x size of collision box
	dh	$4d		; y size of collision box
	dh	$0d00		; strike routine
	dh	$0000		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_sonya_square
	dh	$46		; x offset of collision box
	dh	$0f		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$34		; y size of collision box
	dh	$1d00		; strike routine
	dh	$1b08		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_zap
	dh	$6c		; x offset of collision box
	dh	$23		; y offset of collision box
	dh	$24		; x size of collision box
	dh	$0b		; y size of collision box
	dh	$1e04		; strike routine
	dh	$1303		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_prezap
	dh	$4d		; x offset of collision box
	dh	$23		; y offset of collision box
	dh	$2f		; x size of collision box
	dh	$1b		; y size of collision box
	dh	$1e04		; strike routine
	dh	$1303		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_sonya_bike
	dh	$36		; x offset of collision box
	dh	$03		; y offset of collision box
	dh	$39		; x size of collision box
	dh	$35		; y size of collision box
	dh	$0d01		; strike routine
	dh	$1603		; damage
	dh	SF_SQUEEZE

**************************************************************************
*											     *
*   Kano strikes										     *
*											     *
**************************************************************************
	CNOP 0,4
kano_strikes
	dw	stk_kano_hikick		; 0
	dw	stk_kano_lokick		; 1
	dw	stk_kano_hi_punch	; 2
	dw	stk_kano_lo_punch	; 3
	dw	stk_kano_sweep		; 4
	dw	stk_kano_duck_punch	; 5
	dw	stk_kano_duck_kickh	; 6
	dw	stk_kano_duck_kickl	; 7
	dw	stk_kano_uppercut	; 8
	dw	stk_kano_jump_punch	; 9
	dw	stk_kano_jump_kick	; a
	dw	stk_kano_flip_kick	; d
	dw	stk_kano_flip_punch	; c
	dw	stk_kano_roundh		; d
	dw	stk_kano_knee		; e
	dw	stk_kano_elbow		; f
	dw	stk_kano_shake		;10
	dw	0			;11
	dw	stk_kano_swipe		;12
	dw	stk_kano_roll		;13 - kano ball roll
	dw	stk_kano_prezap		;14
	dw	stk_kano_zap		;15

; 1. new stk table entry
; 2. set hit/block offsets
; 3. set hit/block damage

	CNOP 0,4
stk_kano_hikick
	dh	$59		; x offset of collision box
	dh	$0d		; y offset of collision box
	dh	$40		; x size of collision box
	dh	$29		; y size of collision box
	dh	$0006		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_lokick
	dh	$6d		; x offset of collision box
	dh	$2a		; y offset of collision box
	dh	$49		; x size of collision box
	dh	$12		; y size of collision box
	dh	$0106		; strike routine
	dh	$1504		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_duck_punch
	dh	$56		; x offset of collision box
	dh	$44		; y offset of collision box
	dh	$3a		; x size of collision box
	dh	$15		; y size of collision box
	dh	$050a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_duck_kickh
	dh	$3a		; x offset of collision box
	dh	$34		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$39		; y size of collision box
	dh	$060b		; strike routine
	dh	$0c03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_duck_kickl
	dh	$5c		; x offset of collision box
	dh	$6d		; y offset of collision box
	dh	$46		; x size of collision box
	dh	$20		; y size of collision box
	dh	$070a		; strike routine
	dh	$0602		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_uppercut
	dh	$4d		; x offset of collision box
	dh	$fff7		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$46		; y size of collision box
	dh	$0802		; strike routine
	dh	$2409		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_elbow
	dh	$41		; x offset of collision box
	dh	$04		; y offset of collision box
	dh	$29		; x size of collision box
	dh	$2d		; y size of collision box
	dh	$0907		; strike routine
	dh	$1003		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_knee
	dh	$53		; x offset of collision box
	dh	$26		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$38		; y size of collision box
	dh	$0907		; strike routine
	dh	$1203		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_roundh
	dh	$59		; x offset of collision box
	dh	$06		; y offset of collision box
	dh	$37		; x size of collision box
	dh	$36		; y size of collision box
	dh	$0c01		; strike routine
	dh	$1d04		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_sweep
	dh	$6c		; x offset of collision box
	dh	$6d		; y offset of collision box
	dh	$4f		; x size of collision box
	dh	$22		; y size of collision box
	dh	$0403		; strike routine
	dh	$1403		; damage
	dh	SF_DUCK

	CNOP 0,4
stk_kano_flip_kick
	dh	$57		; x offset of collision box
	dh	$2e		; y offset of collision box
	dh	$42		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0a01		; strike routine
	dh	$1a07		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_flip_punch
	dh	$4d		; x offset of collision box
	dh	$1f		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_jump_punch
	dh	$4d		; x offset of collision box
	dh	$1f		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$24		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1005		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_jump_kick
	dh	$55		; x offset of collision box
	dh	$24		; y offset of collision box
	dh	$48		; x size of collision box
	dh	$1a		; y size of collision box
	dh	$0b01		; strike routine
	dh	$1306		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_hi_punch
	dh	$49		; x offset of collision box
	dh	$0e		; y offset of collision box
	dh	$35		; x size of collision box
	dh	$22		; y size of collision box
	dh	$0211		; strike routine
	dh	$0b03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_lo_punch
	dh	$4f		; x offset of collision box
	dh	$1d		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$1d		; y size of collision box
	dh	$0311		; strike routine
	dh	$0802		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_swipe
	dh	$6d		; x offset of collision box
	dh	$14		; y offset of collision box
	dh	$4b		; x size of collision box
	dh	$43		; y size of collision box
	dh	$1c01		; strike routine
	dh	$1a03		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_roll
	dh	$39		; x offset of collision box
	dh	$0e		; y offset of collision box
	dh	$48		; x size of collision box
	dh	$1f		; y size of collision box
	dh	$1a00		; strike routine
	dh	$1805		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_zap
	dh	$23		; x offset of collision box
	dh	-$18		; y offset of collision box
	dh	$33		; x size of collision box
	dh	$32		; y size of collision box
	dh	$1b04		; strike routine
	dh	$1303		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_prezap
	dh	$6b		; x offset of collision box
	dh	$04		; y offset of collision box
	dh	$4a		; x size of collision box
	dh	$1e		; y size of collision box
	dh	$1704		; strike routine
	dh	$1303		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
stk_kano_shake
	dh	$65		; x offset of collision box
	dh	$20		; y offset of collision box
	dh	$3f		; x size of collision box
	dh	$11		; y size of collision box
	dh	$0d00		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

;*************************************************************************
;*************************************************************************
	CNOP 0,4
	global combo_strike_table
combo_strike_table
	dw	stk_combo0	; 0
	dw	stk_combo1	; 1
	dw	stk_combo2	; 2
	dw	stk_combo3	; 3
	dw	stk_combo4  	; 4
	dw	stk_combo5  	; 5
	dw	stk_combo_klang	; 6
	dw	stk_combo1_stab	; 7
	dw	stk_combo2_stab	; 8
	dw	stk_combo6  	; 9

	dw	stk_combo0	; a - not used
	dw	stk_combo0	; b - not used
	dw	stk_combo0	; c - not used
	dw	stk_combo0	; d - not used
	dw	stk_combo0	; e - not used
	dw	stk_combo0	; f - not used

	dw	stk_hard_combo0	; 10
	dw	stk_hard_combo1	; 11
	dw	stk_hard_combo2	; 12
	dw	stk_combo3	; 13
	dw	stk_combo4  	; 14
	dw	stk_combo5  	; 15



combo_damage	equ	$0701
hard_damage		equ	$0a01

	CNOP 0,4
stk_combo0
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$100f 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_hard_combo0
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$100f 		; strike routine
	dh	hard_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo1
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$110f 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_hard_combo1
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$110f 		; strike routine
	dh	hard_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo1_stab
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$0f0f 		; strike routine
	dh	hard_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo2
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$1212 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_hard_combo2
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$1212 		; strike routine
	dh	hard_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo2_stab
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$0e12 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo3
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$1312 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo4
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$1412 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo5
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$1512 		; strike routine
	dh	combo_damage	; damage
 	dh	0


	CNOP 0,4
stk_combo6
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$1712 		; strike routine
	dh	combo_damage	; damage
 	dh	0


	CNOP 0,4
stk_combo_klang
	dh	$51   		; x offset of collision box
	dh	$0    		; y offset of collision box
	dh	$43   		; x size of collision box
	dh	$85   		; y size of collision box
	dh	$160f 		; strike routine
	dh	combo_damage	; damage
 	dh	0

	CNOP 0,4
stk_combo_axeup
	dh	$5a		; x offset of collision box
	dh	-$02		; y offset of collision box
	dh	$36		; x size of collision box
	dh	$5c		; y size of collision box
	dh	$2b01		; strike routine
	dh	$1804		; damage
	dh	SF_SQUEEZE

;*************************************************************************

	CNOP 0,4
stk_dummy
	dh	10		; x offset of collision box
	dh	10		; y offset of collision box
	dh	10		; x size of collision box
	dh	10		; y size of collision box
	dh	$0000		; strike routine
	dh	$0000		; damage
	dh	SF_SQUEEZE

	CNOP 0,4
dummy_strikes
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
	dw	stk_dummy
