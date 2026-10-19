	opt	c+
l17	group
	xdef	story2a_module
	xdef	story2b_module
	xdef	story2c_module
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
	section	.bkgddata_l17
L0_0
	dw	L0_c
	dw	L0_4c
	dw	L0_230
L0_c
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",12,62
	dsb	2
L0_4c
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",76,482
	dsb	2
L0_230
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",560,36
L0_254
	dw	L0_c
	dw	L0_260
	dw	L0_45c
L0_260
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",608,508
L0_45c
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",1116,36
L0_480
	dw	L0_c
	dw	L0_48c
	dw	L0_690
L0_48c
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",1164,514
	dsb	2
L0_690
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",1680,36
L0_6b4
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",1716,8
	dw	L0_6c8
	dw	L0_850
	dw	L0_0
L0_6c8
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",1736,390
	dsb	2
L0_850
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2128,70
	dsb	2
story2a_module
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2200,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_6b4
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2232,12
L0_8c4
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2244,8
	dw	L0_8d8
	dw	L0_a60
	dw	L0_254
L0_8d8
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2264,390
	dsb	2
L0_a60
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2656,70
	dsb	2
story2b_module
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2728,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_8c4
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2760,12
L0_ad4
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2772,8
	dw	L0_ae8
	dw	L0_c70
	dw	L0_480
L0_ae8
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",2792,390
	dsb	2
L0_c70
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",3184,70
	dsb	2
story2c_module
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",3256,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_ad4
	incbin	"c:\tmp\retail\ATTRACT\MKSTRY2.OVL",3288,12
	end
