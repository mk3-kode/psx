	opt	c+
l16	group
	xdef	legal_module
	xdef	raidfly_module
	xdef	title_module
	xdef	titlepg_CLT
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
	section	.bkgddata_l16
titlepg_CLT
L0_0
	dw	L0_4
L0_4
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",4,516
L0_208
	dw	L0_214
	dw	L0_410
	dw	L0_410
L0_214
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",532,508
L0_410
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1040,36
L0_434
	dw	L0_438
L0_438
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1080,46
	dsb	2
L0_468
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1128,8
	dw	L0_47c
	dw	L0_490
	dw	L0_0
L0_47c
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1148,20
L0_490
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1168,20
title_module
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1188,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_468
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1220,12
L0_4d0
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1232,8
	dw	L0_4e4
	dw	L0_504
	dw	L0_208
L0_4e4
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1252,30
	dsb	2
L0_504
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1284,30
	dsb	2
raidfly_module
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1316,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_4d0
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1348,12
L0_550
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1360,8
	dw	L0_564
	dw	L0_58c
	dw	L0_434
L0_564
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1380,40
L0_58c
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1420,40
legal_module
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1460,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_550
	incbin	"c:\tmp\retail\ATTRACT\MKTITLE.OVL",1492,12
	end
