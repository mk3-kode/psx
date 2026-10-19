;******************************************************************************
; File: mktextdt.s
;
; By: David Schwartz
;
; Date: Dec 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Text Data
;******************************************************************************/
	opt c+

STRING group
	section	.stringdata

	include mkchar.inc
	include mkbkgd.inc


;
; KEEP PALETTE FROM BEING NTSC CORRECTED, MAKES THIS LOOK UGLY IF IT IS
;
	CNOP 0, 4
	global YELLOW_p
YELLOW_p
	dw	16
	DH $0000, $8000, $0210, $0231, $0252, $0294, $02B5, $02D6, $02F7, $0318
	DH $0339, $035A, $039C, $03BD, $03DE, $03FF

	public on
;*************************************************
;buyin text, mkbuyin.c
;*************************************************
	CNOP 0,4
pf_credit_info1
	dh	FONT7N,2,84,200
	dw  WHITE_p
	dh	STRCNRMOS,0
	db	"KREDITS %d",0

	CNOP 0,4
pf_credit_info2
	dh	FONT7N,2,244,200
	dw  WHITE_p
	dh	STRCNRMOS,0
	db	"KREDITS %d",0

	CNOP 0,4
pf_player1
	dh	FONT7N,2,84,143+12
	dw  WHITE_p
	dh	STRCNRMOS,0
	db	"PLAYER 1",0

	CNOP 0,4
pf_player2
	dh	FONT7N,2,244,143+12
	dw  WHITE_p
	dh	STRCNRMOS,0
	db	"PLAYER 2",0

	CNOP 0,4
pf_pmessage
	dh	FONT15,0,14,82
	dw	WHITE_p
	dh	STRCNRMOS,0
	db	0

txt_prepare
	db	"PREPARE",13
	db	"FOR YOUR",13
	db	"NEXT",13
	db	"CHALLENGE",0

txt_start_to_continue
	db	"PRESS START",13
	db	"TO KONTINUE"
	db	0

	CNOP 0,4
txt_press_join
	db	"PRESS START",13
	db	"TO",13
	db	"JOIN IN"
	db	0

	CNOP 0,4
txt_insert_start
	db	13,"GAME OVER",13,0
	db	"INSERT KOIN",13
	db	"TO",13
	db	"JOIN IN"
	db	0

	CNOP 0,4
txt_1_coin
	db	"1 KREDIT",13
	db	"TO KONTINUE",0

	CNOP 0,4
txt_2_coins
	db	"2 KREDITS",13
	db	"TO KONTINUE",0

	CNOP 0,4
txt_x_coins
	db	"INSERT KOIN",13
	db	"TO KONTINUE",0

	CNOP 0,4
txt_press_start
	db	"PRESS",13
	db	"START"
	db	0

	CNOP 0,4
txt_insert_coin
	db	"INSERT KOIN",0

	CNOP 0,4
fl_num
	dw	bpal_flash2_P
	dh	6
	dh	RGB_RED
	dh	RGB_WHITE
	dh	END_STUFF

;*************************************************
; main text, mkmain.c
;*************************************************
	CNOP 0,4
pf_round_num
	dh	FONT15,$ffff,160,75
	dw  WHITE_p
	dh	STRCNRMOS_SCR,0
	db "ROUND %d",0

	CNOP 0,4
fl_entered
	dw	bpal_flash1_P
	dh	4
	dh	RGB_BLUE
	dh	$ffff
	dh	END_STUFF

	CNOP 0,4
fl_finish
	dw	bpal_flash1_P
	dh	4
	dh	$ffff
	dh	RGB_RED
	dh	END_STUFF


	CNOP 0,4
pf_entered
	dh	FONT15,0,320/2,$40
	dw  bpal_flash1_P
	dh	STRCNRMOS_SCR,0
	db	0

;*************************************************
; text, mktext.c
;*************************************************
	CNOP 0,4
pf_15point
	dh	FONT15,$ffff,0,0
	dw  WHITE_p
	dh	STRCNRMOS_SCR,0
	db	0

	CNOP 0,4
pf_15point_soff
	dh	FONT15,$0,0,0
	dw  WHITE_p
	dh	STRCNRMO_SCR,0
	db	0



	CNOP 0,4
pf_7point
	dh	FONT7N,2,0,0
	dw  WHITE_p
	dh	STRCNRMOS_SCR,0
	db	0

	CNOP 0,4
pf_dave_smallc_soff
	dh	FONT7,$0,0,0
	dw  WHITE_p
	dh	STRCNRMO_SCR,0
	db	0

	CNOP 0,4
pf_dave_smallc
	dh	FONT7,$0,0,0
	dw  WHITE_p
	dh	STRCNRMOS_SCR,0
	db	0

	CNOP 0,4
pf_dave_smallr
	dh	FONT7,$ffff,0,0
	dw  WHITE_p
	dh	STRRNRMOS_SCR,0
	db	0

	CNOP 0,4
pf_dave_smalll
	dh	FONT7,$ffff,0,0
	dw  WHITE_p
	dh	STRLNRMOS_SCR,0
	db	0

;*************************************************
; player select text, mksel.c
;*************************************************
	CNOP 0,4
fl_cursor1
	dw bpal_flash1_P
	dh 4
	dh %0000000111100000
	dh %0000001111100000
	dh END_STUFF

	CNOP 0,4
fl_cursor2
	dw bpal_flash2_P
	dh 4
	dh %0000000000001111
	dh %0000000000011111
	dh END_STUFF

	CNOP 0,4
fl_auto
	dw bpal_flash3_P
	dw 4
	dh RGB_BLUE
	dh $ffff
	dh END_STUFF

	CNOP 0,4
pf_auto_msg_1
	dh	FONT7N,2,26,68
	dw  bpal_flash3_P
	dh	STRCNRMOS_SCR,0
	db "RANDOM",13,"SELECT",0

	CNOP 0,4
pf_auto_msg_2
	dh	FONT7N,2,290,68
	dw  bpal_flash3_P
	dh	STRCNRMOS_SCR,0
	db "RANDOM",13,"SELECT",0

	CNOP 0,4
pf_bk_setup
	dh	FONT7N,2,160,214
	dw  YELLOW_p
	dh	STRCNRMOS_SCR,0
	db	0

	CNOP 0,4
pf_iar_num
	dh	FONT7N,2,38,54
	dw  YELLOW_p
	dh	STRCNRMOS_SCR,0
	db	0

	CNOP 0,4
pf_new_champ
	dh	FONT7N,2,160,54
	dw  YELLOW_p
	dh	STRCNRMOS_SCR,0
	db	0

	CNOP 0,4
coin_mess
	dh	FONT7,1,160,198
	dw  YELLOW_p
	dh	STRCNRMOS,0
	db	0

	CNOP 0,4
buyin_coin_mess
	dh	FONT7,1,160,198
	dw  YELLOW_p
	dh	STRCNRMOS,0
	db	0

	CNOP 0,4
txt_p1_entered
	db	"PLAYER 1 HAS ENTERED",13,"THE TOURNAMENT !"

	CNOP 0,4
txt_p2_entered
	db	"PLAYER 2 HAS ENTERED",13,"THE TOURNAMENT !"


;*************************************************
; round intro messages, mkr1.asm
;*************************************************
	CNOP 0,4
fl_r1
	dw bpal_white_P
	dh 4
	dh RGB_BLUE
	dh $ffff
	dh END_STUFF

;*************************************************
; attract mode, amode
;*************************************************
	CNOP 0,4
txt_quote1
	db "THERE IS NO KNOWLEDGE THAT IS NOT POWER",0

	CNOP 0,4
txt_quote2
	db "YOU KNOW, THATS THE THING",0

	CNOP 0,4
txt_quote3
	db "THE MEEK SHALL INHERIT THE EARTH",0

	CNOP 0,4
txt_quote4
	db "IMAGINATION IS MORE IMPORTANT",13,"THAN KNOWLEDGE",0


	CNOP 0,4
txt_space_game_intro
	db	"YOU HAVE BEEN TRANSPORTED",13
	db	"TO ANOTHER REALM",13,13
	db	"A REALM WHERE NEITHER",13
	db	"THE EARTH WARRIORS",13
	db	"NOR SHAO KAHN HAVE ANY CONTROL",13,13
	db	"BEWARE THE REALM OF",13
	db	"RELLIM OHCANEP",0


; Ending Stuff (MKEND.C)
	CNOP 0,4
txt_smoke1
	 db "ENTER",13,"THE ULTIMATE KOMBAT KODE",0


	CNOP 0,4
end_winner_text
	dw txt_victory1
	dw txt_victory2

	CNOP 0,4
txt_victory1
	db "SHAO KAHN IS NO MORE",0

	CNOP 0,4
txt_victory2
	db	"YOU ARE THE MK3",13
	db	"CHAMPION",0

	CNOP 0,4
pf_rise
	dh FONT15,$ffff,160,240
	dw WHITE_p
	dh STRCNRMOS_SCR
	db	0

;*********************************
	CNOP 0,4
txt_execs
	db	"EXECUTIVE PRODUCERS",13,13
	db	"NEIL NICASTRO",13
	db	"KEN FEDESNA",13
	db	"PAUL DUSSAULT",13
	db	"JOHN ROWE",13
	db	"MIKE ABBOT",13
	db	"KEVIN LYDY",13,13,0

;	CNOP 0,4
;txt_dcs
;	db	"WILLIAMS AUDIO SOUND SYSTEM:",13
;	db	"SCOTT PATTERSON",13,13,0

	CNOP 0,4
txt_ssr
	db	"STEVE RITCHIE",13,"AS",13,"THE VOICE OF SHAO KAHN",13,0

	CNOP 0,4
txt_voices
	db	"GRUNTS, SCREAMS, GROANS AND GIBBERISH",13,13
	db	"JON HEY",13
	db	"PEG BURR",13
	db	"DAN FORDEN",13
	db	"ANN MAZZA",13
	db	"VINCE PONTARELLI",13
	db	"ED BOON",13,13,0

	CNOP 0,4
txt_scea
	db	"SCEA PRODUCER",13,13
	db	"PERRY RODGERS",13,13,0

	CNOP 0,4
txt_thanx_alot
	db	"MANY THANKS GO TO",13,13
	db	"ED BOON",13,13
	db	"JOHN TOBIAS",13,13
	db	"DAN FORDEN",13,13
	db	"TOM BOYD",13,13
	db	"ANGUS GUSCHWAN",13,13
	db	"PETER CLARK",13,13
	db	"KERRY",13,13,0

	CNOP 0,4
txt_testers
	db	"UNBEATABLE KOMBAT MASTERS",13,"(GAME TESTERS)",13,13
	db  "BRIAN JOHNSON",13
	db	"WILL SHEN",13
	db	"TIM HEYDELAAR",13
	db	"JOHN STOOKEY",13
	db	"STEVE KRAMER",13
	db	"DANNY LEWIS",13
	db	"RANDY ESTRELLA",13
	db	"EDDIE FERRIER",13
	db	"MIKE VINIKOUR",13,13,0

txt_mk3_design
	db	"MK3 DESIGN TEAM",13,13
	db	"ED BOON",13
	db	"JOHN TOBIAS",13
	db	"STEVE BERAN",13
	db	"DAN FORDEN",13
	db	"TONY GOSKIE",13
	db	"DAVE MICHICICH",13
	db	"JOHN VOGEL",13,13,0

;high score stuff (mkhstd.h)
	CNOP 0,4
txt_p1_enter
	db	"PLAYER 1",13
	db	"INCREDIBLE WINNING STREAK",0

	CNOP 0,4
txt_p2_enter
	db	"PLAYER 2",13
	db	"INCREDIBLE WINNING STREAK",0

	CNOP 0,4
txt_enter_your
	db	"ENTER YOUR INITIALS",13
	db	"TO BECOME IMMORTALIZED",0

	CNOP 0,4
txt_gods
	db "YOU HAVE PROVEN TO BE THE SUPREME",13
	db "MORTAL KOMBAT WARRIOR. THE ELDER",13
	db "GODS NOW DESCEND UPON YOUR WORLD TO",13
	db "GRANT YOU ETERNAL POWER.",13,13,0
	db	"MORE KOMBAT . . . . WINTER OF 96",0

	CNOP 0,4
pf_dave_smalll_soff
	dh	FONT7,$0,8,16
	dw  WHITE_p
	dh	STRLNRMO_SCR,0
	db	0


	CNOP 0,4
pf_dave_smallr_soff
	dh	FONT7,$0,8,16
	dw  WHITE_p
	dh	STRRNRMO_SCR,0
	db	0


	CNOP 0,4
txt_rank_wiar
	db	"%d  WINS IN A ROW",13,0

;ending stuff
	CNOP 0,4
txt_david
	db	"DAVID SCHWARTZ",13,"SOFTWARE",0

	CNOP 0,4
txt_greg
	db	"GREG MILLER",13,"GRAPHICS",0

	CNOP 0,4
txt_markm
	db	"MARK MAY",13,"GRAPHICS",0

	CNOP 0,4
txt_markg
	db	"MARK GUIDARELLI",13,"ART TOOLS",0

	CNOP 0,4
txt_scott
	db	"SCOTT PATTERSON",13,"WILLIAMS AUDIO SOUND SYSTEM",0

	CNOP 0,4
txt_rob
	db	"ROB ATESALP",13,"SOUND",0

	CNOP 0,4
txt_ed
	db	"ED BOON",13,"SOFTWARE",0

	CNOP 0,4
txt_johnt
	db	"JOHN TOBIAS",13,"GRAPHICS",0

	CNOP 0,4
txt_steve
	db	"STEVE BERAN",13,"GRAPHICS",0

	CNOP 0,4
txt_dan
	db "DAN FORDEN",13,"SOUNDS AND MUSIC",0

	CNOP 0,4
txt_tonyg
	db	"TONY GOSKIE",13,"GRAPHICS",0

	CNOP 0,4
txt_dave
	db	"DAVE MICHICICH",13,"GRAPHICS",0

	CNOP 0,4
txt_johnv
	db	"JOHN VOGEL",13,"GRAPHICS",0

;cast table
	CNOP 0,4
cast_table
	dw	txt_rich		; name
	dh	160,$20			; position
	dw	0				; terminate names
	dh	ft_kano,90		; character & x pos
	dh	ft_tusk,230

	dw	txt_kerri
	dh	80,$20
	dw	txt_johnp
	dh	240,$20
	dw	0
	dh	ft_sonya,86		; character & x pos
	dh	ft_jax,238

	dw	txt_tony
	dh	80,$20
	dw	txt_mike
	dh	240,$20
	dw	0
	dh	ft_lao,86		; character & x pos
	dh	ft_swat,236

	dw	txt_sal1		; name
	dh	160,$20			; position
	dw	0				; terminate names
	dh	ft_indian,86		; character & x pos
	dh	ft_robo1,246

	dw	txt_turk		; name
	dh	160,$20			; position
	dw	0				; terminate names
	dh	ft_subzero,86		; character & x pos
	dh	ft_st,230

	dw	txt_lia
	dh	80,$20
	dw	txt_wong
	dh	240,$20
	dw	0
	dh	ft_lia,70		; character & x pos
	dh	ft_lk,234

	dw	txt_sal2		; name
	dh	160,$20			; position
	dw	0				; terminate names
	dh	ft_robo2,74		; character & x pos
	dh	ft_smoke,230

	dw	txt_brian		; name
	dh	160,$20			; position
	dw	0				; terminate names
	dh	ft_sk,160		; character & x pos
	dh	$ffff,0

	dw	0				; terminate cast list



	CNOP 0,4
txt_rich
	db	"RICHARD DIVIZIO",13,"AS",13,"KANO AND KABAL",0

	CNOP 0,4
txt_kerri
	db	"KERRI HOSKINS",13,"AS",13,"SONYA",0

	CNOP 0,4
txt_johnp
	db	"JOHN PARRISH",13,"AS",13,"JAX",0

	CNOP 0,4
txt_tony
	db	"TONY MARQUEZ",13,"AS",13,"KUNG LAO",0

	CNOP 0,4
txt_mike
	db	"MICHAEL OBRIEN",13,"AS",13,"STRYKER",0

	CNOP 0,4
txt_turk
	db	"JOHN TURK",13,"AS",13,"SUB-ZERO  AND  SHANG TSUNG",0

	CNOP 0,4
txt_lia
	db	"LIA MONTELONGO",13,"AS",13,"SINDEL",0

	CNOP 0,4
txt_wong
	db	"EDDIE WONG",13,"AS",13,"LIU KANG",0

	CNOP 0,4
txt_sal1
	db	"SAL DIVITA",13,"AS",13,""
	db	"NIGHTWOLF  AND  SEKTOR",0

	CNOP 0,4
txt_sal2
	db	"SAL DIVITA",13,"AS",13,""
	db	"CYRAX  AND  SMOKE",0

	CNOP 0,4
txt_brian
	db	"BRIAN GLYNN",13,"AS",13,"SHAO KAHN",0
