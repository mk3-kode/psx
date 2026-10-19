	opt	c+
l22	group
	xdef	PORTAL01
	xdef	PORTAL02
	xdef	PORTAL03
	xdef	PORTAL04
	xdef	PORTAL05
	xdef	PORTAL06
	xdef	PORTAL07
	xdef	PORTAL08
	xdef	PORTAL09
	xdef	PORTAL11
	xdef	PORTAL12
	xdef	PORTAL13
	xdef	PORTAL14
	xdef	PORTAL17
	xdef	a_portal_zap
	xdef	portal_anims
	xdef	portal_module
	xref	BLACK_p
	xref	MKHIDDEN_CLT
	xref	RED_p
	xref	SCORE_P
	xref	WARP_P
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
	xref	floor_code
	xref	mk3_calla
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
	section	.bkgddata_l22
portal_anims
a_portal_zap
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",0,60
PORTAL01
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",60,12
	dw	WARP_P
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",76,8
PORTAL02
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",84,20
PORTAL03
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",104,20
PORTAL04
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",124,20
PORTAL05
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",144,20
PORTAL06
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",164,20
PORTAL07
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",184,20
PORTAL08
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",204,20
PORTAL09
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",224,20
PORTAL11
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",244,20
PORTAL12
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",264,20
PORTAL13
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",284,20
PORTAL14
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",304,20
PORTAL17
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",324,20
L0_158
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",344,8
	dw	L0_16c
	dw	L0_290
	dw	MKHIDDEN_CLT
L0_16c
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",364,110
	dsb	2
L0_1dc
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",476,8
	dw	L0_1f0
	dw	L0_290
	dw	MKHIDDEN_CLT
L0_1f0
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",496,160
L0_290
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",656,170
	dsb	2
portal_module
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",828,12
	dw	mk3_calla
	dw	L0_390
	dw	L0_3b4
	dw	bakmods
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",856,4
	dw	L0_158
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",864,4
	dw	L0_1dc
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",872,8
	dw	L0_1dc
	dw	worldtlx1
	dw	L0_158
	dw	worldtlx2
	dw	L0_1dc
	dw	worldtlx3
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",904,8
L0_390
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",912,36
L0_3b4
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst2
	dw	(2+worldtlx2)
	dw	baklst1
	dw	(2+worldtlx1)
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDPORT.OVL",988,4
	end
