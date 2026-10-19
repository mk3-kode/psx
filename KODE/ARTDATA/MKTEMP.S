	opt	c+
l7	group
	xdef	KANDLE1
	xdef	SKTORCH1
	xdef	SKTORCH2
	xdef	SKTORCH3
	xdef	SKTORCH4
	xdef	SKTORCH5
	xdef	SKTORCH6
	xdef	a_candle_flame
	xdef	a_tflame
	xdef	temple_anims
	xdef	temple_module
	xdef	wik1
	xdef	wik2
	xdef	wik3
	xdef	wik4
	xref	BLACK_p
	xref	MKTEMP2x_CLT
	xref	RCANDLE_P
	xref	RED_p
	xref	SCORE_P
	xref	SKFIRE_P
	xref	WHITE_p
	xref	WIKS_P
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
	xref	floor_code
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
	xref	temple_calla
	xref	templfl_p
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
	section	.bkgddata_l7
a_tflame
temple_anims
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",0,32
a_candle_flame
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",32,24
SKTORCH1
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",56,12
	dw	SKFIRE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",72,8
SKTORCH2
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",80,20
SKTORCH3
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",100,20
SKTORCH4
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",120,20
SKTORCH5
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",140,20
SKTORCH6
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",160,20
wik1
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",180,12
	dw	WIKS_P
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",196,8
wik2
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",204,20
wik3
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",224,20
wik4
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",244,20
KANDLE1
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",264,12
	dw	RCANDLE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",280,8
L0_120
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",288,8
	dw	L0_134
	dw	L0_6bc
	dw	MKTEMP2x_CLT
L0_134
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",308,540
L0_350
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",848,8
	dw	L0_364
	dw	L0_6bc
	dw	MKTEMP2x_CLT
L0_364
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",868,210
	dsb	2
L0_438
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1080,8
	dw	L0_44c
	dw	L0_6bc
	dw	MKTEMP2x_CLT
L0_44c
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1100,70
	dsb	2
L0_494
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1172,8
	dw	L0_4a8
	dw	L0_6bc
	dw	MKTEMP2x_CLT
L0_4a8
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1192,400
L0_638
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1592,8
	dw	L0_64c
	dw	L0_6bc
	dw	MKTEMP2x_CLT
L0_64c
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1612,110
	dsb	2
L0_6bc
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",1724,510
	dsb	2
temple_module
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2236,12
	dw	temple_calla
	dw	L0_944
	dw	L0_968
	dw	bakmods
	dw	L0_350
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2268,4
	dw	L0_438
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2276,4
	dw	L0_494
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2284,4
	dw	L0_120
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2292,4
	dw	L0_638
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2300,8
	dw	L0_350
	dw	worldtlx1
	dw	L0_494
	dw	worldtlx3
	dw	L0_120
	dw	worldtlx4
	dw	L0_638
	dw	worldtlx5
	dw	L0_438
	dw	worldtlx7
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2348,4
	dw	L0_9c4
	dw	templfl_p
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2360,4
	dw	scrollx1
	dw	skew_7
L0_944
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2372,36
L0_968
	dw	baklst4
	dw	(2+worldtlx4)
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst7
	dw	(2+worldtlx2)
	dw	baklst2
	dw	(2+worldtlx2)
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2440,4
	dw	floor_code
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2448,4
	dw	shadow_p1p2
	dw	baklst1
	dw	(2+worldtlx1)
	dw	objlst
	dw	(2+worldtlx)
	dw	baklst5
	dw	(2+worldtlx5)
	dw	baklst6
	dw	(2+worldtlx5)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2496,4
L0_9c4
	incbin	"c:\tmp\retail\BKGDS\BKGDTEMP.OVL",2500,68160
	end
