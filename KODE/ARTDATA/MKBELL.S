	opt	c+
l6	group
	xdef	BELLHOLE1A
	xdef	BELLHOLE1B
	xdef	BELLHOLE2
	xdef	EJBSPIKE
	xdef	bell2_module
	xdef	bell_anims
	xdef	bell_module
	xref	BELFLR_P
	xref	BELHOLE_P
	xref	BLACK_p
	xref	MKBELL2_CLT
	xref	MKBELL_CLT
	xref	RED_p
	xref	SCORE_P
	xref	SPIKE_P
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
	xref	calla_bell
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
	section	.bkgddata_l6
bell_anims
BELLHOLE2
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",0,12
	dw	BELHOLE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",16,8
BELLHOLE1A
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",24,12
	dw	BELHOLE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",40,8
BELLHOLE1B
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",48,12
	dw	BELHOLE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",64,8
EJBSPIKE
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",72,12
	dw	SPIKE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",88,8
L0_60
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",96,8
	dw	L0_74
	dw	L0_424
	dw	MKBELL_CLT
L0_74
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",116,430
	dsb	2
L0_224
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",548,8
	dw	L0_238
	dw	L0_424
	dw	MKBELL_CLT
L0_238
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",568,60
L0_274
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",628,8
	dw	L0_288
	dw	L0_424
	dw	MKBELL_CLT
L0_288
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",648,20
L0_29c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",668,8
	dw	L0_2b0
	dw	L0_424
	dw	MKBELL_CLT
L0_2b0
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",688,100
L0_314
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",788,8
	dw	L0_328
	dw	L0_424
	dw	MKBELL_CLT
L0_328
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",808,100
L0_38c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",908,8
	dw	L0_3a0
	dw	L0_424
	dw	MKBELL_CLT
L0_3a0
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",928,100
L0_404
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",1028,8
	dw	L0_418
	dw	L0_424
	dw	MKBELL_CLT
L0_418
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",1048,10
	dsb	2
L0_424
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",1060,630
	dsb	2
L0_69c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",1692,8
	dw	L0_6b0
	dw	L0_78c
	dw	MKBELL2_CLT
L0_6b0
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",1712,220
L0_78c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",1932,230
	dsb	2
bell_module
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2164,12
	dw	calla_bell
	dw	L0_970
	dw	L0_994
	dw	bakmods
	dw	L0_224
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2196,4
	dw	L0_38c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2204,4
	dw	L0_314
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2212,4
	dw	L0_29c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2220,4
	dw	L0_274
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2228,4
	dw	L0_60
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2236,4
	dw	L0_404
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2244,8
	dw	L0_224
	dw	worldtlx1
	dw	L0_38c
	dw	worldtlx2
	dw	L0_314
	dw	worldtlx3
	dw	L0_29c
	dw	worldtlx4
	dw	L0_274
	dw	worldtlx5
	dw	L0_60
	dw	worldtlx6
	dw	L0_404
	dw	worldtlx7
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2308,4
	dw	L0_9f8
	dw	BELFLR_P
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2320,4
	dw	scrollx2
	dw	skew_7
bell2_module
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2332,12
	dw	calla_bell
	dw	L0_970
	dw	L0_994
	dw	bakmods
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2360,28
	dw	L0_69c
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2392,8
	dw	L0_69c
	dw	worldtlx8
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2408,8
L0_970
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2416,36
L0_994
	dw	baklst8
	dw	(2+worldtlx8)
	dw	baklst7
	dw	(2+worldtlx7)
	dw	baklst6
	dw	(2+worldtlx6)
	dw	baklst5
	dw	(2+worldtlx5)
	dw	baklst4
	dw	(2+worldtlx4)
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst2
	dw	(2+worldtlx2)
	dw	baklst1
	dw	(2+worldtlx1)
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2516,4
	dw	floor_code
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2524,4
	dw	shadow_p1p2
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2548,4
L0_9f8
	incbin	"c:\tmp\retail\BKGDS\BKGDBELL.OVL",2552,73920
	end
