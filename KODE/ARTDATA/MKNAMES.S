	opt	c+
NAMES	group
	xdef	DANGER
	xdef	TOASTY
	xdef	combo_heap
	xdef	damage_s
	xdef	hit_s
	xdef	name_anim_imgs
	xref	BLACK_p
	xref	LOADING_P
	xref	RED_p
	xref	SCORE_P
	xref	WHITE_p
	xref	bpal_black_P
	xref	bpal_blue_P
	xref	bpal_flash1_P
	xref	bpal_flash2_P
	xref	bpal_flash3_P
	xref	bpal_red_P
	xref	bpal_white_P
	section	.nameschardata
combo_heap
DANGER
	incbin	"c:\tmp\retail\MK3.EXE",597208,12
	dw	WHITE_p
	incbin	"c:\tmp\retail\MK3.EXE",597224,8
TOASTY
	incbin	"c:\tmp\retail\MK3.EXE",597232,12
	dw	LOADING_P
	incbin	"c:\tmp\retail\MK3.EXE",597248,8
damage_s
	incbin	"c:\tmp\retail\MK3.EXE",597256,12
	dw	WHITE_p
	incbin	"c:\tmp\retail\MK3.EXE",597272,8
hit_s
	incbin	"c:\tmp\retail\MK3.EXE",597280,12
	dw	WHITE_p
	incbin	"c:\tmp\retail\MK3.EXE",597296,8
name_anim_imgs
	dw	L0_270
	dw	L0_dcc
	dw	L0_154
	dw	L0_5dc
	dw	L0_f68
	dw	L0_e78
	dw	L0_c68
	dw	L0_850
	dw	L0_a8
	dw	L0_30c
	dw	L0_1c4
	dw	L0_ba4
	dw	L0_914
	dw	L0_40c
	dw	L0_d18
	dw	L0_500
	dw	L0_a80
	dw	L0_704
L0_a8
	incbin	"c:\tmp\retail\MK3.EXE",597376,172
L0_154
	incbin	"c:\tmp\retail\MK3.EXE",597548,109
	dsb	3
L0_1c4
	incbin	"c:\tmp\retail\MK3.EXE",597660,172
L0_270
	incbin	"c:\tmp\retail\MK3.EXE",597832,154
	dsb	2
L0_30c
	incbin	"c:\tmp\retail\MK3.EXE",597988,256
L0_40c
	incbin	"c:\tmp\retail\MK3.EXE",598244,241
	dsb	3
L0_500
	incbin	"c:\tmp\retail\MK3.EXE",598488,220
L0_5dc
	incbin	"c:\tmp\retail\MK3.EXE",598708,295
	dsb	1
L0_704
	incbin	"c:\tmp\retail\MK3.EXE",599004,331
	dsb	1
L0_850
	incbin	"c:\tmp\retail\MK3.EXE",599336,196
L0_914
	incbin	"c:\tmp\retail\MK3.EXE",599532,364
L0_a80
	incbin	"c:\tmp\retail\MK3.EXE",599896,292
L0_ba4
	incbin	"c:\tmp\retail\MK3.EXE",600188,196
L0_c68
	incbin	"c:\tmp\retail\MK3.EXE",600384,175
	dsb	1
L0_d18
	incbin	"c:\tmp\retail\MK3.EXE",600560,178
	dsb	2
L0_dcc
	incbin	"c:\tmp\retail\MK3.EXE",600740,172
L0_e78
	incbin	"c:\tmp\retail\MK3.EXE",600912,238
	dsb	2
L0_f68
	incbin	"c:\tmp\retail\MK3.EXE",601152,238
	end
