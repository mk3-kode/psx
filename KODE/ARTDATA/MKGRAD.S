	opt	c+
l23	group
	xdef	bluegrad_module
	xdef	gradient_txt
	xdef	greengrad_module
	xdef	redgrad_module
	xdef	smoke_symbol_table
	xdef	ultimate_anims
	xref	BLACK_p
	xref	RED_p
	xref	SCORE_P
	xref	WHITE_p
	xref	baklst0
	xref	baklst1
	xref	baklst1_t
	xref	baklst2
	xref	baklst2_t
	xref	baklst3
	xref	baklst3_t
	xref	baklst4
	xref	baklst4_t
	xref	baklst5
	xref	baklst5_t
	xref	baklst6
	xref	baklst6_t
	xref	baklst7
	xref	baklst7_t
	xref	baklst8
	xref	baklst8_t
	xref	baklst9
	xref	bakmods
	xref	bpal_black_P
	xref	bpal_blue_P
	xref	bpal_flash1_P
	xref	bpal_flash2_P
	xref	bpal_flash3_P
	xref	bpal_red_P
	xref	bpal_white_P
	xref	calla_return
	xref	check_only_t
	xref	dlists_buyin
	xref	floor_code
	xref	gradientb_CLT
	xref	gradientg_CLT
	xref	gradientr_CLT
	xref	no_scroll
	xref	objlst
	xref	objlst2
	xref	objlst_t
	xref	scrollx
	xref	scrollx1
	xref	scrollx2
	xref	scrollx3
	xref	scrollx4
	xref	scrollx5
	xref	scrollx6
	xref	scrollx7
	xref	scrollx8
	xref	shadow_p1p2
	xref	skew_7
	xref	use_next_y
	xref	use_worldtly
	xref	use_worldtly_t
	xref	worldtlx
	xref	worldtlx1
	xref	worldtlx1_t
	xref	worldtlx2
	xref	worldtlx2_t
	xref	worldtlx3
	xref	worldtlx3_t
	xref	worldtlx4
	xref	worldtlx4_t
	xref	worldtlx5
	xref	worldtlx5_t
	xref	worldtlx6
	xref	worldtlx6_t
	xref	worldtlx7
	xref	worldtlx7_t
	xref	worldtlx8
	xref	worldtlx8_t
	xref	worldtlx_t
	xref	worldtly
	xref	worldtly1
	xref	worldtly2
	xref	worldtly3
	xref	worldtly4
	xref	worldtly5
	xref	worldtly6
	xref	worldtly7
	xref	worldtly8
	section	.bkgddata_l23
L0_0
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",0,8
	dw	L0_3c
	dw	L0_78
	dw	gradientb_CLT
L0_14
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",20,8
	dw	L0_3c
	dw	L0_78
	dw	gradientg_CLT
L0_28
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",40,8
	dw	L0_3c
	dw	L0_78
	dw	gradientr_CLT
L0_3c
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",60,60
L0_78
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",120,10
	dsb	2
redgrad_module
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",132,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_28
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",164,12
greengrad_module
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",176,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_14
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",208,12
bluegrad_module
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",220,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_0
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",252,12
gradient_txt
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",264,3495
	dsb	1
L0_eb0
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",3760,122
	dsb	2
L0_f2c
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",3884,118
	dsb	2
L0_fa4
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4004,124
L0_1020
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4128,132
L0_10a4
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4260,132
L0_1128
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4392,130
	dsb	2
L0_11ac
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4524,132
L0_1230
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4656,118
	dsb	2
L0_12a8
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4776,122
	dsb	2
L0_1324
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",4900,128
smoke_symbol_table
ultimate_anims
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5028,56
	dw	L0_eb0
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5088,12
	dw	L0_10a4
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5104,12
	dw	L0_1324
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5120,12
	dw	L0_12a8
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5136,12
	dw	L0_1128
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5152,12
	dw	L0_1020
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5168,12
	dw	L0_f2c
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5184,12
	dw	L0_11ac
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5200,12
	dw	L0_fa4
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5216,12
	dw	L0_1230
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5232,214
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5448,211
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5660,214
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",5876,199
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",6076,214
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",6292,413
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",6708,193
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",6904,175
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKGRAD.OVL",7080,196
	end
