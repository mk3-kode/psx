;#******************************************************************************
;# File: mkcombo.s
;#
;# By: David Schwartz
;#
;# Date: August 1994
;#
;# (C) Williams Entertainment
;#
;# Mortal Kombat III Combo Tables
;#******************************************************************************/

	opt c+

sw_hi_punch	= 0
sw_lo_punch	= 1
sw_block	= 2
sw_hi_kick	= 3
sw_lo_kick	= 4
sw_run		= 5
sw_up		= 6
sw_down		= 7
sw_left		= 8
sw_right	= 9

x_ground = 0
x_airborn = 1
x_fatal = 2
x_mercy = 3
x_animal = 4
x_close_animal = 5
x_friend = 6
x_baby	= 7

	xref	do_animality
	xref	do_baby
	xref	do_floor_blade
	xref	do_friendship
	xref	do_ind_zap
	xref	do_inviso
	xref	do_kano_swipe
	xref	do_kano_zap
	xref	do_lao_spin
	xref	do_lia_forward
	xref	do_lia_scream
	xref	do_mercy
	xref	do_noogy
	xref	do_pit_fatality
	xref	do_robo_tele
	xref	do_smoke_spear
	xref	do_square_wave
	xref	do_st_2_ind
	xref	do_st_2_jax
	xref	do_st_2_kano
	xref	do_st_2_lao
	xref	do_st_2_lia
	xref	do_st_2_lk
	xref	do_st_2_robo1
	xref	do_st_2_robo2
	xref	do_st_2_sg
	xref	do_st_2_swat
	xref	do_st_2_tusk
	xref	do_st_2_smoke
	xref	do_sz_forward_zap
	xref	q_animal_req
	xref	q_bubble_fatal
	xref	q_close_animal
	xref	q_dinger_friend
	xref	q_earth_fatal
	xref	q_eatit_fatal
	xref	q_floor_blade
	xref	q_friend
	xref	q_grow_fatal
	xref	q_ind_axe_fatal
	xref	q_ind_friend
	xref	q_inflate_fatal
	xref	q_kabal_animal
	xref	q_kano_animal
	xref	q_lao_hat_fatal
	xref	q_lia_hair_fatal
	xref	q_lia_scream
	xref	q_lk_animal
	xref	q_lk_friend
	xref	q_lk_mk_fatal
	xref	q_mercy_req
	xref	q_pit_fatal
	xref	q_robo_crush_fatal
	xref	q_scream_fatal
	xref	q_shang_animal
	xref	q_sherip_fatal
	xref	q_skel_fatal
	xref	q_smoke_animal
	xref	q_smoke_friend
	xref	q_smoke_tele
	xref	q_sonya_friend
	xref	q_spear_ok
	xref	q_st_spike_fatal
	xref	q_swat_animal
	xref	q_sz_forward_zap
	xref	q_shang_morph_lk
	xref	q_shang_morph_sg
	xref	q_shang_morph_lao
	xref	q_shang_morph_robo1
	xref	q_shang_morph_swat
	xref	q_shang_morph_tusk
	xref	q_shang_morph_ind
	xref	q_shang_morph_robo2
	xref	q_shang_morph_kano
	xref	q_shang_morph_jax
	xref	q_shang_morph_sz
	xref	q_shang_morph_lia
	xref	q_shang_morph_smoke
	xref	do_axe_up
	xref	do_fast_axe_up
	xref	do_fatality_1
	xref	do_fatality_2
	xref	do_reflect
	xref	do_sg_pounce
	xref	do_sg_quake
	xref	do_sg_zap
	xref	do_shake
	xref	do_st_2_sz
	xref	do_st_zap1
	xref	do_st_zap2
	xref	do_st_zap3
	xref	do_stick_sweep
	xref	do_summon
	xref	do_super_kang
	xref	do_swat_bomb_hi
	xref	do_swat_bomb_lo
	xref	do_swat_zoom
	xref	do_sz_decoy
	xref	do_tusk_blur
	xref	do_tusk_zap
	xref	lk_bike_kick
	xref	lk_zap_hi
	xref	lk_zap_lo
	xref	q_babality
	xref	q_bike_req
	xref	q_blurred_req
	xref	q_close_fatal
	xref	q_fatality_req
	xref	q_half_screen_fatal
	xref	q_pounce_ok_now
	xref	q_robo_flame_fatal
	xref	q_sz_decoy
	xref	q_taser_fatal
	xref	hc_smoke
	xref	hc_cheat
	xref	hc_cheat1
	xref	hc_free_play


MASK_JLEFT		=	$8000
MASK_JRIGHT		=	$2000
MASK_JDOWN		=	$4000
MASK_JUP		=	$1000
MASK_JBLOCK		=	$0008
MASK_JRUN		=	$0004
MASK_JHIP		=	$0010
MASK_JLOP		=	$0080
MASK_JHIK		=	$0020
MASK_JLOK	   	=	$0040

p1b0 = (MASK_JHIP)
p1b1 = (MASK_JLOP)
p1b2 = (MASK_JBLOCK)
p1b3 = (MASK_JHIK)
p1b4 = (MASK_JLOK)
p1b5 = (MASK_JRUN)
p1sf2 = 0

p2b0 =	(MASK_JHIP)
p2b1 =	(MASK_JLOP)
p2b2 =	(MASK_JBLOCK)
p2b3 =	(MASK_JHIK)
p2b4 =	(MASK_JLOK)
p2b5 =	(MASK_JRUN)
p2sf2 = 0

	public	on

TABLE group
	section	.tabledata

	CNOP 0,4
scom_robo_zap1
	dh	$20		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_robo_zap2
	dh	$16		   	; time to do entire switch combo
	dh	sw_left
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0

	dh	sw_right
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_robo_net
	dh	$20		   	; time to do entire switch combo
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_bomb_mid
	dh	$18		   	; time to do entire switch combo
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_bomb_full
scom_robo_tele
	dh	$18		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_robo2_tele
	dh	$18		   	; time to do entire switch combo
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_robo_air_grab
	dh	$18		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0



	CNOP 0,4
scom_fly
	dh	$28		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_lia_anglez
	dh	$12		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_dash
	dh	$10		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_jax_zap2
	dh	$2a		   	; time to do entire switch combo
	dh	sw_left
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0


	CNOP 0,4
scom_jax_zap1
	dh	$10		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_bike
	dh	$20		   	; time to do entire switch combo
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_ind_charge
	dh	$18
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_sonya_zap
	dh	$18
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_sky_zap_on
	dh	$20		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_sky_zap_behind
	dh	$30		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_sky_zap_front
	dh	$30		   	; time to do entire switch combo
	dh	sw_left
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0

	dh	sw_right
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_sw_zap
	dh	$24		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_lao_teleport
	dh	$10
	dh	sw_up
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0

	CNOP 0,4
scom_lao_angle_kick
	dh	$20		   	; time to do entire switch combo
	dh	sw_down
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0

	dh	sw_down
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0


	CNOP 0,4
scom_lao_zap
	dh	$18
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0

;**************************************************************************
;*											     *
;*  Secret Move tables									     *
;*											     *
;* entry format:
;* typedef struct smove {
;*	WORD s_p1leg;			// p1 requirements, format change long-$word
;* 	WORD s_p2leg;			// p2 requirements, format change long-$word
;* 	LONG s_xfer;			// xfer type index, format change word-$long
;* 	LONG s_yes_no;			// yes/no routine
;* 	FUNC *s_routine;			// address of secret move
;*
;* 	WORD s_time;			// time for move
;* 	WORD s_r1;				// move right 1
;* 	WORD s_r2;				// move right 2
;* 	WORD s_r3;				// move right 3
;* 	WORD s_r4;				// move right 4
;* 	WORD s_r5;				// move right 5
;* 	WORD s_r6;				// move right 6
;* 	WORD s_l1;				// move left 1
;* 	WORD s_l2;				// move left 2
;* 	WORD s_l3;				// move left 3
;* 	WORD s_l4;				// move left 4
;* 	WORD s_l5;				// move left 5
;* 	WORD s_l6;				// move left 6
;* 	WORD s_pad;				// padding added to keep alignment
;* } SMOVE;
;**************************************************************************
	CNOP 0,4
sm_home_codes
	dh	p1b5	     	; player 1 requirements
	dh	p2b5	     	; player 2 requirements
	dw	0
	dw	0				; yes/no routine
	dw	hc_free_play	; address of secret move
	dh	$50
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0				; added field

	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	0
	dw	0				; yes/no routine
	dw	hc_smoke	; address of secret move
	dh	$60
	dh	sw_up
	dh	sw_left
	dh	sw_down
	dh	sw_right
	dh	sw_up
	dh	sw_left
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0				; added field

	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	0
	dw	0				; yes/no routine
	dw	hc_cheat1	; address of secret move
	dh	$60
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_block
	dh	sw_block
	dh	sw_hi_kick
	dh	sw_lo_kick
	dh	sw_lo_punch
	dh	sw_hi_punch
	dh	0
	dh	0
	dh	0				; added field

	dh	p1b5	     	; player 1 requirements
	dh	p2b5	     	; player 2 requirements
	dw	0
	dw	0				; yes/no routine
	dw	hc_cheat	; address of secret move
	dh	$58
	dh	sw_run
	dh	sw_block
	dh	sw_lo_punch
	dh	sw_hi_punch
	dh	sw_lo_kick
	dh	sw_hi_kick
	dh	sw_lo_punch
	dh	sw_hi_punch
	dh	sw_lo_kick
	dh	sw_hi_kick
	dh	0
	dh	0
	dh	0

	dh	0				; ending zero needed here to terminate

	CNOP 0,4
sm_all_ro
	dh	p1b5	     	; player 1 requirements
	dh	p2b5	     	; player 2 requirements
	dw	x_mercy
	dw	q_mercy_req	; yes/no routine
	dw	do_mercy 	; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0				; added field
	dh	0				; ending zero needed here to terminate

	CNOP 0,4
sm_smoke_lkc
	dh	p1b4     		; player 1 requirements
	dh	p2b4      		; player 2 requirements
	dw	x_airborn
	dw	q_smoke_tele		; yes/no routine
	dw	do_robo_tele		; address of secret move
	dh	$18
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4
	dh	p2b4
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$20
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

	CNOP 0,4
sm_smoke_uc
	dh	p1b2|p1b5     		; player 1 requirements
	dh	p2b2|p2b5      		; player 2 requirements
	dw	x_fatal
	dw	q_eatit_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_up
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_up
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_smoke_dc
	dh	p1b2|p1b5     		; player 1 requirements
	dh	p2b2|p2b5      		; player 2 requirements
	dw	x_fatal
	dw	q_earth_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$30
	dh	sw_down
	dh	sw_right
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_smoke_hkc
	dh	p1b3	     		; player 1 requirements
	dh	p2b3	      		; player 2 requirements
	dw	x_friend
	dw	q_smoke_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_hi_kick
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	sw_hi_kick
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3
	dh	p2b3
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dw	0



	CNOP 0,4
sm_smoke_bc
	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	x_animal
	dw	q_smoke_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_smoke_lpc
	dh	p1b1     	; player 1 requirements
	dh	p2b1     	; player 2 requirements
	dw	x_ground
	dw	q_spear_ok	; yes/no routine
	dw	do_smoke_spear 	; address of secret move
	dh	$14
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_smoke_rc
	dh	p1b5|p1b2     	; player 1 requirements
	dh	p2b5|p2b2     	; player 2 requirements
	dw	x_ground
	dw	0		; yes/no routine
	dw	do_inviso 	; address of secret move
	dh	$28
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

**************************************************************************
*											     *
*     Kano										     *
*											     *
**************************************************************************
	CNOP 0,4
sm_kano_hpc
	dh	p1b0|p1b4      	; player 1 requirements
	dh	p2b0|p2b4      	; player 2 requirements
	dw	x_ground
	dw	0		; yes/no routine
	dw	do_kano_swipe 	; address of secret move
	dh	$18
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0|p1b4      	; player 1 requirements
	dh	p2b0|p2b4      	; player 2 requirements
	dw	x_ground
	dw	0		; yes/no routine
	dw	do_kano_zap 	; address of secret move
	dh	$18
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_kano_lpo
	dh	p1b1			; player 1 requirements
	dh	p2b1			; player 2 requirements
	dw	x_fatal
	dw	q_skel_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_kano_lkc
	dh	p1b4
	dh	p2b4
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b2|p1b4
	dh	p2b2|p2b4
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_kano_hpo
	dh	p1b0	     	; player 1 requirements
	dh	p2b0	     	; player 2 requirements
	dw	x_animal
	dw	q_kano_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$28
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0
	dh	0
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


*
* Sektor !!
*
	CNOP 0,4
sm_robo2_uc
	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

	CNOP 0,4
sm_robo1_dc
	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_friend
	dw	q_dinger_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5
	dh	p2b5
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$20
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0



	CNOP 0,4
sm_robo1_uc
	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_animal
	dw	q_close_animal		; yes/no routine
	dw	do_animality		; address of secret move
	dh	$28		   	; time to do entire switch combo
	dh	sw_up
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_up
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_robo_hkc
	dh	p1b3
	dh	p2b3
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dw	0



	CNOP 0,4
sm_robo_bc
	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_fatal
	dw	q_robo_flame_fatal	; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_fatal
	dw	q_robo_crush_fatal	; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$28
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	0					; added field

	dw	0

*
* Cyrax
*
	CNOP 0,4
sm_robo2_hpc
	dh	p1b0|p1b2     		; player 1 requirements
	dh	p2b0|p2b2      		; player 2 requirements
	dw	x_fatal
	dw	q_fatality_req		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_up
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_down
	dh	sw_up
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0
	dh	p2b0
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_robo2_dc
	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_animal
	dw	q_close_animal		; yes/no routine
	dw	do_animality		; address of secret move
	dh	$28		   	; time to do entire switch combo
	dh	sw_down
	dh	sw_down
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_robo2_rc
	dh	p1b5
	dh	p2b5
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$12
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5|p1b2     		; player 1 requirements
	dh	p2b5|p2b2      		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$28
	dh	sw_up
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_up
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dw	0

;********************************************

	CNOP 0,4
sm_lia_uc
	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0					; added field

	dh	p1b2
	dh	p2b2
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lia_hpc
	dh	p1b0	     		; player 1 requirements
	dh	p2b0	      		; player 2 requirements
	dw	x_ground
	dw	q_lia_scream		; yes/no routine
	dw	do_lia_scream		; address of secret move
	dh	$20		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0	     		; player 1 requirements
	dh	p2b0	      		; player 2 requirements
	dw	x_animal
	dw	q_animal_req		; yes/no routine
	dw	do_animality		; address of secret move
	dh	$2a		   	; time to do entire switch combo
	dh	sw_up
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

;********************************************

	CNOP 0,4
sm_lia_bc
	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_fatal
	dw	q_lia_hair_fatal	; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0					; added field

	dh	p1b2|p1b5     		; player 1 requirements
	dh	p2b2|p2b5      		; player 2 requirements
	dw	x_fatal
	dw	q_scream_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$30
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lia_lpc
	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_lia_forward		; address of secret move
	dh	$18
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1
	dh	p2b1
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$20
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


*
* Subzero
*
	CNOP 0,4
sm_sz_rc
	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_fatal
	dw	q_half_screen_fatal	; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$28
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_block
	dh	0
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sz_uc
	dh	p1b2|p1b5	    	; player 1 requirements
	dh	p2b2|p2b5	    	; player 2 requirements
	dw	x_animal
	dw	q_close_animal		; yes/no routine
	dw	do_animality 		; address of secret move
	dh	$28
	dh	sw_up
	dh	sw_up
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_up
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sz_lpc
	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_airborn
	dw	q_sz_decoy		; yes/no routine
	dw	do_sz_decoy		; address of secret move
	dh	$14		   	; time to do entire switch combo
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_ground
	dw	q_sz_forward_zap	; yes/no routine
	dw	do_sz_forward_zap	; address of secret move
	dh	$14		   	; time to do entire switch combo
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

;*************************

	CNOP 0,4
sm_sz_hkc
	dh	p1b3
	dh	p2b3
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3
	dh	p2b3
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

;****************************************************************


	CNOP 0,4
sm_ind_lpc
	dh	p1b1
	dh	p2b1
	dw	x_ground
	dw	0
	dw	do_ind_zap
	dh	$18
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1
	dh	p2b1
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_right
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_ind_bc
	dh	p1b2
	dh	p2b2
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$18
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$2a
	dh	sw_right
	dh	sw_left
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	sw_left
	dh	sw_right
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_ind_dc
	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	x_animal
	dw	q_close_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_friend
	dw	q_ind_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_hi_punch
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_hi_punch
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_ind_hpo
	dh	p1b0	     		; player 1 requirements
	dh	p2b0	      		; player 2 requirements
	dw	x_fatal
	dw	q_ind_axe_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_ind_hpc
	dh	p1b0	     		; player 1 requirements
	dh	p2b0	      		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_axe_up		; address of secret move
scom_axe_up
	dh	$18
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_ind_hkc
	dh	p1b3	     		; player 1 requirements
	dh	p2b3	      		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_reflect		; address of secret move
	dh	$20
	dh	sw_left
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_sonya_hpc
	dh	p1b0     		; player 1 requirements
	dh	p2b0      		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_square_wave		; address of secret move
	dh	$18
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0	     		; player 1 requirements
	dh	p2b0	      		; player 2 requirements
	dw	x_fatal
	dw	q_pit_fatal		; yes/no routine
	dw	do_pit_fatality		; address of secret move
	dh	$22
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0



	CNOP 0,4
sm_sonya_dc
	dh	p1b2|p1b5     	; player 1 requirements
	dh	p2b2|p2b5     	; player 2 requirements
	dw	x_fatal
	dw	q_bubble_fatal	; yes/no routine
	dw	do_fatality_2 	; address of secret move
	dh	$30
	dh	sw_down
	dh	sw_left
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	sw_down
	dh	sw_right
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_sonya_rc
	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_friend
	dw	q_sonya_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_down
	dh	sw_left
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	sw_down
	dh	sw_right
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_fatal
	dw	q_fatality_req		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sonya_lpo
	dh	p1b1	     	; player 1 requirements
	dh	p2b1	     	; player 2 requirements
	dw	x_animal
	dw	q_close_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dw	0



	CNOP 0,4
sm_sonya_lkc
	dh	p1b4
	dh	p2b4
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_jax_lpc
	dh	p1b1|p1b4
	dh	p2b1|p1b4
	dw	x_ground
	dw   0			; yes/no routine
	dw	do_noogy
	dh	$18
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1
	dh	p2b1
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_jax_lkc
	dh	p1b4	     	; player 1 requirements
	dh	p2b4     	; player 2 requirements
	dw	x_fatal
	dw	q_grow_fatal	; yes/no routine
	dw	do_fatality_2 	; address of secret move
	dh	$30
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0					; added field

	dh	p1b4
	dh	p2b4
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4			; player 1 requirements
	dh	p2b4			; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$2a
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_jax_bo
	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal	; yes/no routine
	dw	do_fatality_1 	; address of secret move
	dh	$28
	dh	sw_up
	dh	sw_right
	dh	sw_down
	dh	sw_up
	dh	0
	dh	0
	dh	sw_up
	dh	sw_left
	dh	sw_down
	dh	sw_up
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_jax_lpo
	dh	p1b1	     	; player 1 requirements
	dh	p2b1	     	; player 2 requirements
	dw	x_animal
	dw	q_close_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dw	0
*
* Swat
*
	CNOP 0,4
sm_sw_bc
	dh	p1b2|p1b5     		; player 1 requirements
	dh	p2b2|p2b5      		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	x_animal
	dw	q_swat_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$28
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sw_lkc
	dh	p1b4	     		; player 1 requirements
	dh	p2b4	      		; player 2 requirements
	dw	x_fatal
	dw	q_taser_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$1f
	dh	sw_right
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4	     		; player 1 requirements
	dh	p2b4	      		; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$30
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_lo_punch
	dh	sw_run
	dh	0
	dh	0
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_lo_punch
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_swat_hkc
	dh	p1b2|p1b3      		; player 1 requirements
	dh	p2b2|p2b3      		; player 2 requirements
	dw	x_ground
	dw	0	     		; yes/no routine
	dw	do_swat_zoom		; address of secret move
	dh	$1f
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3|p1b2
	dh	p2b3|p2b2
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_up
	dh	sw_up
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_up
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_swat_lpc
	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_ground
	dw	0	     		; yes/no routine
	dw	do_swat_bomb_lo		; address of secret move
	dh	$10
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_ground
	dw	0	     		; yes/no routine
	dw	do_stick_sweep		; address of secret move
	dh	$10
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_friend
	dw	q_friend     		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$28
	dh	sw_lo_punch
	dh	sw_run
	dh	sw_run
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	sw_lo_punch
	dh	sw_run
	dh	sw_run
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_swat_hpc
	dh	p1b0				; player 1 requirements
	dh	p2b0		 		; player 2 requirements
	dw	x_ground
	dw	0				; yes/no routine
	dw	do_swat_bomb_hi			; address of secret move
	dh	$10
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0
	dh	p2b0
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

*
* Sheeva
*
	CNOP 0,4
sm_sg_bc
	dh	p1b2		    	; player 1 requirements
	dh	p2b2	     		; player 2 requirements
	dw	x_animal
	dw	q_close_animal		; yes/no routine
	dw	do_animality 		; address of secret move
	dh	$28
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_sg_hko
	dh	p1b3	     		; player 1 requirements
	dh	p2b3	      		; player 2 requirements
	dw	x_fatal
	dw	q_sherip_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sg_lpc
	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1
	dh	p2b1
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sg_hkc
	dh	p1b3	     		; player 1 requirements
	dh	p2b3	      		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_sg_quake		; address of secret move
	dh	$1a
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3
	dh	p2b3
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_sg_hpc
	dh	p1b0				; player 1 requirements
	dh	p2b0		 		; player 2 requirements
	dw	x_ground
	dw	0				; yes/no routine
	dw	do_sg_zap			; address of secret move
	dh	$10
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

	CNOP 0,4
sm_sg_uc
	dh	p1b0|p1b1|p1b2|p1b3|p1b4		; player 1 requirements
	dh	p2b0|p2b1|p2b2|p2b3|p2b4 		; player 2 requirements
	dw	x_ground
	dw	q_pounce_ok_now				; yes/no routine
	dw	do_sg_pounce				; address of secret move
	dh	$10
	dh	sw_up
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

*
* Kung Lao
*
	CNOP 0,4
sm_lao_lkc
	dh	p1b4			; player 1 requirements
	dh	p2b4	 		; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$30
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_lo_punch
	dh	sw_run
	dh	0
	dh	0
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_lo_punch
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4
	dh	p2b4
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_lao_bc
	dh	p1b2		    	; player 1 requirements
	dh	p2b2	     		; player 2 requirements
	dw	x_animal
	dw	q_close_animal		; yes/no routine
	dw	do_animality 		; address of secret move
	dh	$28
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

	CNOP 0,4
sm_lao_hpc
	dh	p1b0           		; player 1 requirements
	dh	p2b0         	  	; player 2 requirements
	dw	x_fatal
	dw	q_lao_hat_fatal		; yes/no routine
	dw	do_fatality_2 		; address of secret move
	dh	$30
	dh	sw_down
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_down
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b0
	dh	p2b0
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lao_dc
	dh	p1b0	     		; player 1 requirements
	dh	p2b0	      		; player 2 requirements
	dw	x_fatal
	dw	q_fatality_req		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$2a
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lao_rc
	dh	p1b5		; player 1 requirements
	dh	p2b5 		; player 2 requirements
	dw	x_ground
	dw	0		; yes/no routine
	dw	do_lao_spin	; address of secret move
	dh	$10
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

*
* Liu Kang
*
	CNOP 0,4
sm_lk_dc
	dh	p1b2|p1b5		; player 1 requirements
	dh	p2b2|p2b5 		; player 2 requirements
	dw	x_friend
	dw	q_lk_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$20
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_lk_uc
	dh	p1b2	     	; player 1 requirements
	dh	p2b2	     	; player 2 requirements
	dw	x_animal
	dw	q_lk_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$30
	dh	sw_up
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!



	CNOP 0,4
sm_lk_bc
	dh	p1b2|p1b5     		; player 1 requirements
	dh	p2b2|p2b5      		; player 2 requirements
	dw	x_fatal
	dw	q_lk_mk_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_up
	dh	sw_up
	dh	sw_down
	dh	sw_up
	dh	0
	dh	0
	dh	sw_up
	dh	sw_up
	dh	sw_down
	dh	sw_up
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lk_lkc
	dh	p1b4	     		; player 1 requirements
	dh	p2b4	      		; player 2 requirements
	dw	x_fatal
	dw	q_fatality_req		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$30
	dh	sw_down
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4
	dh	p2b4
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_lo_kick
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	sw_lo_kick
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lk_hkc
	dh	p1b3|p1b4		; player 1 requirements
	dh	p2b3|p2b4 		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_super_kang		; address of secret move
	dh	$1e
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3
	dh	p2b3
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$20
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lk_hpc
	dh	p1b0|p1b4		; player 1 requirements
	dh	p2b0|p2b4 		; player 2 requirements
	dw	x_airborn
	dw	0			; yes/no routine
	dw	lk_zap_hi		; address of secret move
	dh	$1a
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lk_lko
	dh	p1b4			; player 1 requirements
	dh	p2b4 			; player 2 requirements
	dw	x_ground
	dw	q_bike_req		; yes/no routine
	dw	lk_bike_kick		; address of secret move
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_lk_lpc
	dh	p1b1|p1b4		; player 1 requirements
	dh	p2b1|p2b4		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	lk_zap_lo		; address of secret move
	dh	$1a
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


*
* Shang Tsung
*
	CNOP 0,4
sm_st_hpo
	dh	p1b0	     	; player 1 requirements
	dh	p2b0	     	; player 2 requirements
	dw	x_animal
	dw	q_shang_animal	; yes/no routine
	dw	do_animality 	; address of secret move
	dh	$22
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

	CNOP 0,4
sm_st_lpo
	dh	p1b1	     		; player 1 requirements
	dh	p2b1	      		; player 2 requirements
	dw	x_fatal
	dw	q_st_spike_fatal	; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$30
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1|p1b2|p1b5 		; player 1 requirements
	dh	p2b1|p2b2|p2b5 		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	sw_block
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_st_dc
	dh	p1b2			; player 1 requirements
	dh	p2b2			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_lk	; yes/no routine
	dw	do_st_2_lk		; address of secret move
	dh	$18
	dh	sw_down
	dh	sw_right
	dh	sw_up
	dh	sw_left
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_up
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b2			; player 1 requirements
	dh	p2b2			; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$28
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0

	CNOP 0,4
sm_st_lko
	dh	p1b5			; player 1 requirements
	dh	p2b5			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_sg			; yes/no routine
	dw	do_st_2_sg		; address of secret move
	dh	$20
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_st_rc
	dh	p1b5			; player 1 requirements
	dh	p2b5			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_lao			; yes/no routine
	dw	do_st_2_lao		; address of secret move
	dh	$20
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	sw_run
	dh	sw_block
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b5			; player 1 requirements
	dh	p2b5			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_robo1			; yes/no routine
	dw	do_st_2_robo1		; address of secret move
	dh	$20
	dh	sw_left
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0



	CNOP 0,4
sm_st_hkc
	dh	p1b3			; player 1 requirements
	dh	p2b3			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_swat			; yes/no routine
	dw	do_st_2_swat		; address of secret move
	dh	$20
	dh	sw_right
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3			; player 1 requirements
	dh	p2b3			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_tusk			; yes/no routine
	dw	do_st_2_tusk		; address of secret move
	dh	$10
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	0
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_st_uc
	dh	p1b2			; player 1 requirements
	dh	p2b2			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_ind			; yes/no routine
	dw	do_st_2_ind		; address of secret move
	dh	$20
	dh	sw_up
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	sw_up
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_st_bc
	dh	p1b2			; player 1 requirements
	dh	p2b2			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_robo2			; yes/no routine
	dw	do_st_2_robo2		; address of secret move
	dh	$13
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0
	dh	0
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b2			; player 1 requirements
	dh	p2b2			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_kano			; yes/no routine
	dw	do_st_2_kano		; address of secret move
	dh	$08
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_st_lpc
	dh	p1b1			; player 1 requirements
	dh	p2b1			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_jax			; yes/no routine
	dw	do_st_2_jax		; address of secret move
	dh	$1d
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b1|p1b2
	dh	p2b1|p2b2
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_up
	dh	sw_up
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_st_hpc
	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_sz			; yes/no routine
	dw	do_st_2_sz		; address of secret move
	dh	$18
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field
*
* shang tsung zap 1
*
	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_st_zap1		; address of secret move
	dh	$24
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field
*
* shang zap 2
*
	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_st_zap2		; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field
*
* shang zap 3
*
	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_st_zap3		; address of secret move
	dh	$30
	dh	sw_right
	dh	sw_right
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	sw_left
	dh	sw_left
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

*
* Kabal (Tusk)
*
	CNOP 0,4
sm_tusk_hpo
	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_close_animal
	dw	q_kabal_animal		; yes/no routine
	dw	do_animality		; address of secret move
	dh	$28
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0					; added field

	dw	0


	CNOP 0,4
sm_st_lkc
	dh	p1b4			; player 1 requirements
	dh	p2b4			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_lia			; yes/no routine
	dw	do_st_2_lia		; address of secret move
	dh	$18
	dh	sw_left
	dh	sw_down
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_down
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4			; player 1 requirements
	dh	p2b4			; player 2 requirements
	dw	x_ground
	dw	q_shang_morph_smoke			; yes/no routine
	dw	do_st_2_smoke		; address of secret move
	dh	$18
	dh	sw_down
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_down
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field


*
* summon
*
	dh	p1b4			; player 1 requirements
	dh	p2b4			; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_summon		; address of secret move
	dh	$28
	dh	sw_left
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4
	dh	p2b4
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_tusk_uc
	dh	p1b5			; player 1 requirements
	dh	p2b5			; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$38
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	sw_run
	dh	0
	dh	0
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	sw_run
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_tusk_hkc
	dh	p1b3	     		; player 1 requirements
	dh	p2b3	      		; player 2 requirements
	dw	x_fatal
	dw	q_close_fatal		; yes/no routine
	dw	do_fatality_2		; address of secret move
	dh	$30
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_block
	dh	sw_block
	dh	sw_run
	dh	0
	dh	0					; added field

	dh	p1b3
	dh	p2b3
	dw	x_ground
	dw   q_pit_fatal		; yes/no routine
	dw	do_pit_fatality 	; address of secret move
	dh	$18
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0
	dh	0
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_block
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

	CNOP 0,4
sm_tusk_lkc
	dh	p1b4			; player 1 requirements
	dh	p2b4			; player 2 requirements
	dw	x_ground
	dw	q_blurred_req	 	; yes/no routine
	dw	do_tusk_blur		; address of secret move
	dh	$12
	dh	sw_right
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b4
	dh	p2b4
	dw	x_baby
	dw	q_babality	; yes/no routine
	dw	do_baby 	; address of secret move
	dh	$28
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	sw_lo_kick
	dh	sw_run
	dh	sw_run
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_tusk_bc
	dh	p1b2	     		; player 1 requirements
	dh	p2b2	      		; player 2 requirements
	dw	x_fatal
	dw	q_inflate_fatal		; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$30
	dh	sw_right
	dh	sw_left
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	sw_left
	dh	sw_right
	dh	sw_down
	dh	sw_down
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_tusk_rc
	dh	p1b5	     		; player 1 requirements
	dh	p2b5	      		; player 2 requirements
	dw	x_ground
	dw	q_floor_blade		; yes/no routine
	dw	do_floor_blade		; address of secret move
	dh	$20
	dh	sw_left
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

	CNOP 0,4
sm_tusk_zap
	dh	p1b0			; player 1 requirements
	dh	p2b0			; player 2 requirements
	dw	x_airborn
	dw	0			; yes/no routine
	dw	do_tusk_zap		; address of secret move
	dh	$18
	dh	sw_left
	dh	sw_left
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_right
	dh	sw_right
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_kano_hkc
	dh	p1b3			; player 1 requirements
	dh	p2b3			; player 2 requirements
	dw	x_fatal
	dw	q_half_screen_fatal	; yes/no routine
	dw	do_fatality_1		; address of secret move
	dh	$28
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_block
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	sw_hi_kick
	dh	sw_block
	dh	sw_block
	dh	sw_lo_punch
	dh	0
	dh	0
	dh	0					; added field

	dh	p1b3			; player 1 requirements
	dh	p2b3			; player 2 requirements
	dw	x_friend
	dw	q_friend		; yes/no routine
	dw	do_friendship		; address of secret move
	dh	$28
	dh	sw_hi_kick
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	sw_hi_kick
	dh	sw_run
	dh	sw_run
	dh	sw_lo_kick
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!


	CNOP 0,4
sm_kano_lpc
	dh	p1b1|p1b4		; player 1 requirements
	dh	p2b1|p2b4		; player 2 requirements
	dw	x_ground
	dw	0			; yes/no routine
	dw	do_shake		; address of secret move
	dh	$18
	dh	sw_right
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	sw_left
	dh	sw_down
	dh	0
	dh	0
	dh	0
	dh	0
	dh	0					; added field
	dh	0			; NEEDED !!

;****************************************************************
; COMBO MOVE TABLES
;****************************************************************
;**************************************************************************
;*											     *
;*  combo table format:									     *
;* 											     *
;*     dh   $aa         where aa = time allowed					*
;*     dh   $bbcc       where bb = attack ani    cc = attack ani part  *
;*     dh   $ddee       where dd = attack speed  ee = button number    *
;*     dh   $ffgg       where ff = retract ani   gg = retract ani part *
;*     dh   $hhii       where hh = stk offset	   ii = requirement      *
;*	   dh   0		   padding (not in arcade, make sure add to new entries)
;*     dw   $jjjjjjjj   where jj = success pointer				     *
;*											     *
;**************************************************************************
cb_hipunch	equ	$00
cb_lopunch	equ	$01
cb_block	equ	$02
cb_hikick	equ	$03
cb_lokick	equ	$04

cb_jump_address	equ	$1111


stk_0		equ	$0000	; hit in face
stk_1		equ	$0100	; stumble away
stk_2		equ	$0200	; knocked on back
stk_3		equ	$0300	; knocked high on back
stk_4		equ	$0400	; NAILED !
stk_5		equ	$0500	; uppercutted
stk_klang	equ		$0600	; hit but with a klang sound !!

stk_1_stab	equ		$0700	; stumble away
stk_2_stab	equ		$0800	; knocked on back
stk_6		equ		$0900	; knocked almost vertical on your back

stk_h0		equ		$1000	; hit in face
stk_h1		equ		$1100	; stumble away
stk_h2		equ		$1200	; knocked on back

c_speed1		equ	$0100
c_speed2		equ	$0200
c_speed3		equ	$0300

last_option	equ	$8000
b_last_option	equ	15

req_none		equ	0	; requirement: none
req_stkaway	equ	1	; requirement: joystick away
req_stktow	equ	3	; requirement: joystick towards
req_stkdown	equ	4
req_halfdamage equ 5

retract_elbow	equ	$1002
retract_knee	equ	$1302
retract_lokick	equ	$1202

atk_upcut	equ	$0b01

atk_elbow1	equ	$1001
atk_elbow2	equ	$1003
atk_elbow3	equ	$1004
atk_elbow4	equ	$1005
atk_knee1	equ	$1301
atk_knee2	equ	$1303
atk_knee3	equ	$1304
atk_knee4	equ	$1305
atk_hikick	equ	$1101
atk_lokick	equ	$1201
atk_roundh	equ	$1501


;***********************
;***********************
	CNOP 0,4
	global ct_tusk_elbow2
ct_tusk_elbow2
	dh	9|last_option		; time allowed
	dh	atk_elbow2		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1_stab|req_halfdamage	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_tusk_elbow3

ct_tusk_elbow3
	dh	9			; time allowed
	dh	atk_hikick		; attack
	dh	c_speed2|cb_hikick	; speed,button
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_tusk_knee4

	dh	9			; time allowed
	dh	atk_upcut		; attack = uppercut
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_5|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

	dh	9|last_option			; time allowed
	dh	atk_elbow3			; attack
	dh	c_speed3|cb_lopunch		; speed,button = hi kick
	dh	retract_elbow			; retract = elbow
	dh	stk_1_stab|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_tusk_elbow4

ct_tusk_elbow4
	dh	9|last_option		; time allowed
	dh	atk_elbow4		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2_stab|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	$1a

	CNOP 0,4
	global ct_tusk_knee2
ct_tusk_knee2
	dh	9|last_option		; time allowed
	dh	atk_knee2		; attack
	dh	c_speed2|cb_lokick	; speed,button
	dh	retract_knee		; retract = knee
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_tusk_knee3

ct_tusk_knee3
	dh	9			; time allowed
	dh	atk_roundh		; attack = knee #1
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	$1304			; retract = knee 2
	dh	stk_h2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

	dh	9			; time allowed
	dh	atk_elbow1		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	$1304			; retract = knee 2
	dh	stk_1_stab|req_none 	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_tusk_elbow2

	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack
	dh	c_speed2|cb_hikick	; speed,button
	dh	$1304			; retract = knee 2
	dh	stk_h1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_tusk_knee4

ct_tusk_knee4
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = knee #1
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	$1102			; retract = hi kick
	dh	stk_h2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;***********************

	CNOP 0,4
	global ct_sg_knee2
ct_sg_knee2
	dh	9|last_option		; time allowed
	dh	atk_knee2		; attack
	dh	c_speed3|cb_hikick	; speed,button
	dh	retract_knee		; retract = knee
	dh	stk_h1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sg_knee3

ct_sg_knee3
	dh	9|last_option		; time allowed
	dh	atk_knee3		; attack
	dh	c_speed2|cb_lokick	; speed,button
	dh	retract_knee		; retract = knee
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sg_knee4

ct_sg_knee4
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack
	dh	c_speed2|cb_hikick	; speed,button
	dh	retract_knee		; retract = knee
	dh	stk_h2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$12


	CNOP 0,4
	global ct_sg_elbow2
ct_sg_elbow2
	dh	9|last_option		; time allowed
	dh	atk_elbow2		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_h1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sg_elbow3

ct_sg_elbow3
	dh	9|last_option		; time allowed
	dh	atk_elbow3		; attack
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_h1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sg_elbow4

ct_sg_elbow4
	dh	9			; time allowed
	dh	atk_knee1		; attack
	dh	c_speed2|cb_hikick	; speed,button
	dh	retract_elbow		; retract = knee
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sg_knee2

	dh	9|last_option		; time allowed
	dh	atk_elbow4		; attack
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
;	dh	stk_2|req_stktow	; strike check / requirements
	dh	stk_6|req_stktow	; strike check / requirements
	dh	0					; padding to align structure
	dw	$1a

;***********************

	CNOP 0,4
	global ct_sonya_knee2
ct_sonya_knee2
	dh	6			; time allowed
	dh	atk_hikick		; attack
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sonya_roundh

	dh	9|last_option		; time allowed
	dh	atk_elbow1
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sonya_elbow2

ct_sonya_roundh
	dh	9			; time allowed
	dh	atk_roundh
	dh	c_speed3|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

ct_sonya_elbow1
	dh	9|last_option		; time allowed

;***********
	dh	$1007
;	dh	atk_elbow1		; attack
;***********

	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sonya_elbow2

;***********************

	CNOP 0,4
	global ct_ind_knee2
ct_ind_knee2
	dh	9			; time allowed
	dh	atk_elbow1		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_ind_elbow2

	dh	6|last_option		; time allowed
	dh	atk_hikick		; attack
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_ind_roundh

ct_ind_roundh
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = knee #1
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;***********************

	CNOP 0,4
	global ct_swat_knee2
ct_swat_knee2
	dh	9			; time allowed
	dh	atk_elbow1		; attack
	dh	c_speed1|cb_hipunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_swat_elbow2

ct_swat_hikick
	dh	6|last_option		; time allowed
	dh	atk_hikick		; attack
	dh	c_speed2|cb_lokick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_swat_baton

ct_swat_baton
	dh	9			; time allowed
	dh	atk_elbow3		; attack = knee #1
	dh	c_speed1|cb_lopunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_swat_roundh

ct_swat_roundh
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = knee #1
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;***********************

	CNOP 0,4
	global ct_swat_elbow2
ct_swat_elbow2
	dh	6|last_option		; time allowed
	dh	atk_elbow2		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_swat_elbow3

ct_swat_elbow3
	dh	4|last_option		; time allowed
	dh	atk_elbow3		; attack
	dh	c_speed1|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_5|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$08

;***********************

	CNOP 0,4
	global ct_lk_elbow2
ct_lk_elbow2
	dh	9			; time allowed
	dh	atk_elbow2		; attack
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lk_elbow3

ct_lk_knee1
	dh	9|last_option		; time allowed
	dh	atk_knee1		; attack
	dh	c_speed3|cb_lokick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lk_knee2

ct_lk_elbow3
	dh	9|last_option		; time allowed
	dh	atk_elbow3		; attack
	dh	c_speed3|cb_block	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lk_knee1

	CNOP 0,4
	global ct_lk_knee2
ct_lk_knee2
	dh	9|last_option		; time allowed
	dh	atk_knee2		; attack
	dh	c_speed3|cb_lokick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_h1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lk_knee3

ct_lk_knee3
	dh	9|last_option		; time allowed
	dh	atk_knee3		; attack
	dh	c_speed3|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lk_knee4

ct_lk_knee4
	dh	9|last_option		; time allowed
	dh	atk_knee4		; attack
	dh	c_speed3|cb_lokick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_4|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$14

;***********************

	CNOP 0,4
	global ct_st_knee2
ct_st_knee2
	dh	9			; time allowed
	dh	atk_elbow1		; attack = elbow 3rd hit
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_st_elbow2

	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = elbow 3rd hit
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_st_roundh

	CNOP 0,4
	global ct_st_elbow2
ct_st_elbow2
	dh	9|last_option		; time allowed
	dh	atk_elbow2		; attack = elbow 3rd hit
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_st_elbow3

ct_st_elbow3
	dh	9|last_option		; time allowed
	dh	atk_elbow3		; attack = elbow 3rd hit
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_st_roundh

ct_st_roundh
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = knee #1
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;***********************

	CNOP 0,4
	global ct_kano_elbow2
ct_kano_elbow2
	dh	9|last_option		; time allowed
	dh	$1001			; attack = elbow #1 AGAIN
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_kano_post_elbow2

	CNOP 0,4
	global ct_kano_knee2
ct_kano_knee2
ct_kano_post_elbow2
	dh	9			; time allowed
	dh	atk_knee1		; attack = knee #1
	dh	c_speed3|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_kano_hikick

	dh	9				; time allowed
	dh	atk_elbow2			; attack = elbow #2 (head butt)
	dh	c_speed3|cb_lopunch		; speed,button = hi kick
	dh	retract_elbow			; retract = elbow
	dh	stk_klang|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_kano_diff_upcut

	dh	9|last_option		; time allowed
	dh	atk_upcut		; attack = uppercut
	dh	c_speed2|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_5|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

ct_kano_diff_upcut
	dh	9|last_option		; time allowed
	dh	atk_upcut		; attack = uppercut
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	$1004			; retract = head butt
	dh	stk_5|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

ct_kano_hikick
	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = knee #1
	dh	c_speed2|cb_lokick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_kano_roundh

ct_kano_roundh
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = knee #1
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;************************

	CNOP 0,4
	global ct_jax_knee2
ct_jax_knee2
	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = elbow #2
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_jax_roundh

ct_jax_roundh
	dh	9			; time allowed
	dh	atk_roundh		; attack = roundhouse
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_knee
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

ct_jax_elbow1
	dh	9|last_option		; time allowed
	dh	atk_elbow1		; attack
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_1|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_jax_elbow2


	CNOP 0,4
	global ct_jax_elbow2
ct_jax_elbow2
	dh	9|last_option		; time allowed
	dh	$1003			; attack = elbow #2
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_jax_elbow3

ct_jax_elbow3
	dh	9|last_option		; time allowed
	dh	$1004			; attack = elbow #3
	dh	c_speed2|cb_block	; speed,button = hi kick
	dh	$0e05			; retract = unhipunch 2
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_jax_elbow4

ct_jax_elbow4
	dh	9|last_option		; time allowed
	dh	$1005			; attack = elbow #4
	dh	c_speed2|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_3|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_jax_elbow5

ct_jax_elbow5
	dh	9|last_option		; time allowed
	dh	$1006			; attack = elbow #5
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	$0e04			; retract = elbow
	dh	stk_4|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$0f

;********************************************************************

	CNOP 0,4
	global ct_sonya_elbow2
ct_sonya_elbow2
	dh	9|last_option		; time allowed
	dh	$1003			; attack = elbow #2
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sonya_elbow3

ct_sonya_elbow3
	dh	9|last_option		; time allowed
	dh	$1004			; attack = elbow #3
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sonya_elbow4

ct_sonya_elbow4
	dh	9|last_option		; time allowed
	dh	$1005			; attack = elbow #3
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$0f

;**************************************

	CNOP 0,4
	global ct_lia_elbow2
ct_lia_elbow2
	dh	9|last_option		; time allowed
	dh	$1003			; attack = elbow #2
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1_stab|req_none 	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lia_elbow3_up

ct_lia_elbow3_up
	dh	9			; time allowed
	dh	$1004			; attack = elbow #3
	dh	c_speed2|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1_stab|req_none	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lia_hikick

	dh	9|last_option		; time allowed
	dh	atk_upcut		; attack = uppercut
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_5|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

ct_lia_hikick
	dh	9|last_option		; time allowed
	dh	$1101			; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$08

ct_lia_knee
	dh	9			; time allowed
	dh	$1001			; attack = elbow #1
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_knee
	dh	stk_1_stab|req_none	; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lia_elbow2

	dh	9|last_option		; time allowed
	dh	$1101			; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lia_roundh

ct_lia_roundh
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = roundhouse
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_knee
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;**********************************

	CNOP 0,4
	global ct_sektor_elbow2
ct_sektor_elbow2
	dh	9|last_option		; time allowed
	dh	atk_elbow2		; attack = elbow #2
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sektor_knee1

ct_sektor_knee1
	dh	9			; time allowed
	dh	atk_knee1 		; attack = elbow #2
	dh	c_speed3|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sektor_roundh1

	dh	9|last_option		; time allowed
	dh	atk_upcut		; attack = uppercut
	dh	c_speed2|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_5|req_stkdown	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

ct_sektor_roundh1
	dh	9			; time allowed
	dh	atk_knee2 		; attack = elbow #2 (backwards roundh)
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

ct_wimpy_hikick
	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sektor_roundh2

ct_sektor_roundh2
	dh	9|last_option		; time allowed
	dh	atk_knee2 		; attack = elbow #2 (backwards roundh)
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;**************************************************

	CNOP 0,4
	global ct_cyrax_elbow2
ct_cyrax_elbow2
	dh	9|last_option		; time allowed
	dh	atk_elbow2		; attack = elbow #2
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_cyrax_eknee1

ct_cyrax_eknee1
	dh	9			; time allowed
	dh	$1004			; attack = elbow #3
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

	dh	9|last_option		; time allowed
	dh	atk_knee1 		; attack = elbow #2
	dh	c_speed3|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_cyrax_elbow3

ct_cyrax_elbow3
	dh	9|last_option		; time allowed
	dh	atk_elbow1		; attack = elbow #2
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_cyrax_eknee2

	CNOP 0,4
	global ct_cyrax_eknee2
ct_cyrax_eknee2
	dh	9|last_option		; time allowed
	dh	atk_knee1 		; attack = elbow #2
	dh	c_speed3|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_cyrax_hikick

ct_cyrax_hikick
	dh	9|last_option		; time allowed
	dh	atk_hikick 		; attack
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

	CNOP 0,4
	global ct_cyrax_knee2
ct_cyrax_knee2
	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh  	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_cyrax_roundh2

ct_cyrax_roundh2
	dh	9|last_option		; time allowed
	dh	atk_roundh 		; attack = elbow #2 (backwards roundh)
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$10

;**************************************************

	CNOP 0,4
	global ct_sektor_knee2
ct_sektor_knee2
	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

;***************************************************

	CNOP 0,4
	global ct_smoke_elbow2
ct_smoke_elbow2
	dh	9|last_option		; time allowed
	dh	$1003			; attack = elbow #2
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_smoke_elbow3

ct_smoke_elbow3
	dh	9			; time allowed
	dh	$1301			; attack = knee #1
	dh	c_speed3|cb_lokick	; speed,button
	dh	retract_elbow		; retract = knee
	dh	stk_0|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_smoke_knee2

	dh	9			; time allowed
	dh	$1101			; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

	dh	9|last_option		; time allowed
	dh	$1004			; attack = elbow #3
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

	CNOP 0,4
	global ct_smoke_knee2
ct_smoke_knee2
	dh	9|last_option		; time allowed
	dh	atk_hikick		; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_smoke_turnaround

ct_smoke_turnaround
	dh	9|last_option		; time allowed
	dh	$1004			; attack = elbow #3
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

;***************************************************

	CNOP 0,4
	global ct_sz_elbow2
ct_sz_elbow2
	dh	9|last_option		; time allowed
	dh	$1003			; attack = elbow 2nd hit
	dh	c_speed2|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0000			; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sz_elbow3

ct_sz_elbow3
	dh	9			; time allowed
	dh	atk_elbow3		; attack = elbow 2nd hit
	dh	c_speed2|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0000			; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sz_knee1

ct_sz_knee1
	dh	9			; time allowed
	dh	$1305			; move closer !!!

	dh	c_speed3|cb_lokick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0100|req_halfdamage			; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sz_knee2

	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = elbow 2nd hit
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0100|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

	CNOP 0,4
	global ct_sz_knee2
ct_sz_knee2
	dh	12|last_option		; time allowed
	dh	$1303			; attack = 2nd knee
	dh	c_speed3|cb_hikick	; speed,button
	dh	retract_knee		; retract = knee
	dh	$0100			; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_sz_roundh

ct_sz_roundh
	dh	9|last_option		; time allowed
	dh	atk_roundh		; attack = elbow 2nd hit
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	retract_knee		; retract = elbow
	dh	stk_4|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e

;**********************************

	CNOP 0,4
	global ct_ind_elbow2
ct_ind_elbow2
	dh	9|last_option		; time allowed
	dh	$1003			; attack = chop
	dh	c_speed3|cb_hipunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0000			; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_ind_elbow3

ct_ind_elbow3
	dh	9|last_option		; time allowed
	dh	$1004			; attack = chop
	dh	c_speed2|cb_lopunch	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0000			; strike check
	dh	0					; padding to align structure
	dw	ct_ind_hikick

ct_ind_hikick
	dh	9			; time allowed
	dh	cb_jump_address
	dh	cb_hipunch		; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	$0002			; strike check / requirements
	dh	0					; padding to align structure
	dw	do_fast_axe_up

	dh	9|last_option		; time allowed
	dh	$1101			; attack = hi kick
	dh	c_speed1|cb_hikick	; speed,button = hi kick
	dh	retract_elbow		; retract = elbow
	dh	stk_2|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$20

**************************************************************************
*											     *
*  Kung Lao Combos									     *
*											     *
**************************************************************************
	CNOP 0,4
	global ct_lao_elbow2
ct_lao_elbow2
	dh	9			; time
	dh	atk_hikick		; attack = hi kick
	dh	c_speed1|cb_lokick	; speed,button = hi kick
	dh	$1002			; retract = elbow
	dh	$0000			; strike check
	dh	0					; padding to align structure
	dw	ct_lao_roundh

	dh	9|last_option		; time allowed
	dh	atk_elbow2		; ani ---$ [offset , part #]
	dh	c_speed3|cb_lopunch	; speed,button = hi kick
	dh	$1002			; retract [ani,part #]
	dh	$0000			; strike check
	dh	0					; padding to align structure
	dw	ct_lao_elbow3		; success pointer

ct_lao_elbow3
	dh	9|last_option		; 9 ticks
	dh	$1004  			; ani ---$ [offset , part #]
	dh	$0300  			; ani ---$ [ speed , button #]
	dh	$1002			; retract [ani,part #]
	dh	$0000			; strike check
	dh	0					; padding to align structure
	dw	ct_lao_elbow4		; success pointer

ct_lao_elbow4
	dh	9|last_option		; 9 ticks
	dh	$1005  			; ani ---$ [offset , part #]
	dh	$0301  			; ani ---$ [ speed , button #]
	dh	$1002			; retract [ani,part #]
	dh	$0000			; strike check
	dh	0					; padding to align structure
	dw	ct_lao_e2k		; success = "elbow to knee"

;***********

ct_lao_e2k
	dh	9|last_option		; time
	dh	atk_knee1		; attack = roundhouse
	dh	c_speed2|cb_lokick	; speed,button = hi kick
	dh	retract_elbow
	dh	stk_1|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	ct_lao_knee2		; success

ct_lao_roundh
	dh	9|last_option		; time
	dh	atk_roundh		; attack = roundhouse
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	$1102			; retract = hi kick
	dh	stk_2|req_stkaway	; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e			; success

	CNOP 0,4
	global ct_lao_knee2
ct_lao_knee2
	dh	9|last_option		; time allowed
	dh	atk_knee2		; attack = knee #2
	dh	c_speed3|cb_lokick	; speed,button = hi kick
	dh	retract_knee		; retract = knee
	dh	$0000			; strike check
	dh	0					; padding to align structure
	dw	ct_lao_knee3		; success pointer

ct_lao_knee3
	dh	9|last_option		; time allowed
	dh	atk_knee3		; attack = knee #3
	dh	c_speed2|cb_hikick	; speed,button = hi kick
	dh	$1102			; retract = hi kick
	dh	stk_4|req_none		; strike check / requirements
	dh	0					; padding to align structure
	dw	$0e	 		; final sleep time











