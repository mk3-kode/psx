	opt	c+
l5	group
	xdef	BALFIRE1
	xdef	BALFIRE2
	xdef	BALFIRE3
	xdef	BALFIRE4
	xdef	BALFIRE5
	xdef	BALFIRE6
	xdef	SONADO1
	xdef	SONADO10
	xdef	SONADO11
	xdef	SONADO12
	xdef	SONADO2
	xdef	SONADO3
	xdef	SONADO4
	xdef	SONADO5
	xdef	SONADO6
	xdef	SONADO7
	xdef	SONADO8
	xdef	SONADO9
	xdef	SOUL_STBREAK1
	xdef	SOUL_STBREAK2
	xdef	SOUL_STBREAK3
	xdef	TOWER_LARGE01
	xdef	TOWER_LARGE02
	xdef	TOWER_LARGE03
	xdef	TOWER_LARGE04
	xdef	TOWER_LARGE05
	xdef	TOWER_LARGE06
	xdef	TOWER_LARGE07
	xdef	TOWER_LARGE08
	xdef	TOWER_LARGE09
	xdef	TOWER_LARGE10
	xdef	TOWER_LARGE11
	xdef	TOWER_LARGE12
	xdef	TOWER_MEDIUM01
	xdef	TOWER_MEDIUM02
	xdef	TOWER_MEDIUM03
	xdef	TOWER_MEDIUM04
	xdef	TOWER_MEDIUM05
	xdef	TOWER_MEDIUM06
	xdef	TOWER_MEDIUM07
	xdef	TOWER_MEDIUM08
	xdef	TOWER_MEDIUM09
	xdef	TOWER_MEDIUM10
	xdef	TOWER_MEDIUM11
	xdef	TOWER_MEDIUM12
	xdef	TOWER_SMALL01
	xdef	TOWER_SMALL02
	xdef	TOWER_SMALL03
	xdef	TOWER_SMALL04
	xdef	TOWER_SMALL05
	xdef	TOWER_SMALL06
	xdef	TOWER_SMALL07
	xdef	TOWER_SMALL08
	xdef	TOWER_SMALL09
	xdef	TOWER_SMALL10
	xdef	TOWER_SMALL11
	xdef	TOWER_SMALL12
	xdef	TOWER_XPLODE01
	xdef	TOWER_XPLODE02
	xdef	TOWER_XPLODE03
	xdef	TOWER_XPLODE04
	xdef	TOWER_XPLODE05
	xdef	TOWER_XPLODE06
	xdef	TOWER_XPLODE07
	xdef	TOWER_XPLODE08
	xdef	TOWER_XPLODE09
	xdef	TOWER_XPLODE10
	xdef	TOWER_XPLODE11
	xdef	TOWER_XPLODE12
	xdef	a_soul_na_do
	xdef	a_torch
	xdef	a_tower_crumple
	xdef	a_tower_large_rock
	xdef	a_tower_med_rock
	xdef	a_tower_small_rock
	xdef	dlists_soul_to_tower
	xdef	nowall_module
	xdef	soflor_FLR
	xdef	soflor_addr
	xdef	soul_anims
	xdef	soul_module
	xdef	tower_anims
	xdef	tower_module
	xref	BALCO_P
	xref	BALFIRE_P
	xref	BLACK_p
	xref	MEDIUM_p
	xref	MK3SOUL_CLT
	xref	MKBALC2z_CLT
	xref	RED_p
	xref	SCORE_P
	xref	SMALL_p
	xref	SONADO_P
	xref	STBREAK_P
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
	xref	calla_soul
	xref	calla_tower
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
	xref	soflor_PAL
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
	section	.bkgddata_l5
soul_anims
SOUL_STBREAK1
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",0,12
	dw	STBREAK_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",16,8
SOUL_STBREAK2
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",24,12
	dw	STBREAK_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",40,8
SOUL_STBREAK3
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",48,12
	dw	STBREAK_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",64,8
a_soul_na_do
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",72,56
SONADO1
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",128,12
	dw	SONADO_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",144,8
SONADO2
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",152,20
SONADO3
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",172,20
SONADO4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",192,20
SONADO5
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",212,20
SONADO6
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",232,20
SONADO7
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",252,20
SONADO8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",272,20
SONADO9
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",292,20
SONADO10
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",312,20
SONADO11
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",332,20
SONADO12
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",352,20
tower_anims
a_torch
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",372,32
BALFIRE1
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",404,12
	dw	BALFIRE_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",420,8
BALFIRE2
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",428,20
BALFIRE3
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",448,20
BALFIRE4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",468,20
BALFIRE5
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",488,20
BALFIRE6
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",508,20
TOWER_SMALL01
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",528,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",544,8
TOWER_SMALL02
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",552,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",568,8
TOWER_SMALL03
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",576,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",592,8
TOWER_SMALL04
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",600,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",616,8
TOWER_SMALL05
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",624,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",640,8
TOWER_SMALL06
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",648,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",664,8
TOWER_SMALL07
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",672,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",688,8
TOWER_SMALL08
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",696,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",712,8
TOWER_SMALL09
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",720,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",736,8
TOWER_SMALL10
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",744,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",760,8
TOWER_SMALL11
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",768,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",784,8
TOWER_SMALL12
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",792,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",808,8
TOWER_MEDIUM01
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",816,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",832,8
TOWER_MEDIUM02
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",840,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",856,8
TOWER_MEDIUM03
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",864,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",880,8
TOWER_MEDIUM04
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",888,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",904,8
TOWER_MEDIUM05
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",912,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",928,8
TOWER_MEDIUM06
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",936,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",952,8
TOWER_MEDIUM07
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",960,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",976,8
TOWER_MEDIUM08
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",984,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1000,8
TOWER_MEDIUM09
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1008,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1024,8
TOWER_MEDIUM10
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1032,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1048,8
TOWER_MEDIUM11
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1056,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1072,8
TOWER_MEDIUM12
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1080,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1096,8
TOWER_LARGE01
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1104,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1120,8
TOWER_LARGE02
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1128,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1144,8
TOWER_LARGE03
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1152,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1168,8
TOWER_LARGE04
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1176,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1192,8
TOWER_LARGE05
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1200,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1216,8
TOWER_LARGE06
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1224,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1240,8
TOWER_LARGE07
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1248,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1264,8
TOWER_LARGE08
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1272,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1288,8
TOWER_LARGE09
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1296,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1312,8
TOWER_LARGE10
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1320,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1336,8
TOWER_LARGE11
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1344,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1360,8
TOWER_LARGE12
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1368,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1384,8
TOWER_XPLODE01
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1392,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1408,8
TOWER_XPLODE02
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1416,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1432,8
TOWER_XPLODE03
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1440,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1456,8
TOWER_XPLODE04
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1464,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1480,8
TOWER_XPLODE05
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1488,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1504,8
TOWER_XPLODE06
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1512,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1528,8
TOWER_XPLODE07
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1536,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1552,8
TOWER_XPLODE08
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1560,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1576,8
TOWER_XPLODE09
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1584,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1600,8
TOWER_XPLODE10
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1608,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1624,8
TOWER_XPLODE11
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1632,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1648,8
TOWER_XPLODE12
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1656,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1672,8
a_tower_small_rock
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1680,56
a_tower_med_rock
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1736,56
a_tower_large_rock
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1792,56
a_tower_crumple
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1848,52
L0_76c
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1900,8
	dw	L0_780
	dw	L0_dd8
	dw	MK3SOUL_CLT
L0_780
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",1920,100
L0_7e4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",2020,8
	dw	L0_7f8
	dw	L0_dd8
	dw	MK3SOUL_CLT
L0_7f8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",2040,180
L0_8ac
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",2220,8
	dw	L0_8c0
	dw	L0_dd8
	dw	MK3SOUL_CLT
L0_8c0
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",2240,980
L0_c94
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",3220,8
	dw	L0_ca8
	dw	L0_dd8
	dw	MK3SOUL_CLT
L0_ca8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",3240,70
	dsb	2
L0_cf0
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",3312,8
	dw	L0_d04
	dw	L0_dd8
	dw	MK3SOUL_CLT
L0_d04
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",3332,210
	dsb	2
L0_dd8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",3544,470
	dsb	2
soul_module
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4016,12
	dw	calla_soul
	dw	L0_1044
	dw	L0_1068
	dw	bakmods
	dw	L0_76c
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4048,4
	dw	L0_7e4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4056,8
	dw	L0_8ac
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4068,4
	dw	L0_c94
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4076,4
	dw	L0_cf0
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4084,8
	dw	L0_76c
	dw	worldtlx1
	dw	L0_7e4
	dw	worldtlx2
	dw	L0_8ac
	dw	worldtlx3
	dw	L0_8ac
	dw	worldtlx4
	dw	L0_c94
	dw	worldtlx5
	dw	L0_cf0
	dw	worldtlx6
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4140,4
	dw	L0_16b8
	dw	soflor_PAL
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4152,4
	dw	scrollx1
	dw	skew_7
L0_1044
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4164,36
L0_1068
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
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4256,4
	dw	floor_code
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4264,4
	dw	shadow_p1p2
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4288,4
dlists_soul_to_tower
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4292,4
	dw	use_worldtly_t
	dw	baklst7_t
	dw	(2+worldtlx7_t)
	dw	baklst6_t
	dw	(2+worldtlx6_t)
	dw	baklst5_t
	dw	(2+worldtlx5_t)
	dw	baklst4_t
	dw	(2+worldtlx4_t)
	dw	baklst3_t
	dw	(2+worldtlx3_t)
	dw	baklst2_t
	dw	(2+worldtlx2_t)
	dw	baklst1_t
	dw	(2+worldtlx1_t)
	dw	objlst_t
	dw	(2+worldtlx_t)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4364,4
	dw	check_only_t
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4372,4
	dw	use_worldtly
	dw	baklst5
	dw	(2+worldtlx5)
	dw	baklst4
	dw	(2+worldtlx4)
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst2
	dw	(2+worldtlx2)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4412,4
	dw	floor_code
	dw	baklst1
	dw	(2+worldtlx1)
	dw	baklst8
	dw	(2+worldtlx1)
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4452,4
L0_1168
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4456,8
	dw	L0_117c
	dw	L0_1420
	dw	MKBALC2z_CLT
L0_117c
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4476,30
	dsb	2
L0_119c
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4508,8
	dw	L0_11b0
	dw	L0_1420
	dw	MKBALC2z_CLT
L0_11b0
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4528,80
L0_1200
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4608,8
	dw	L0_1214
	dw	L0_1420
	dw	MKBALC2z_CLT
L0_1214
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4628,10
	dsb	2
L0_1220
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4640,8
	dw	L0_1234
	dw	L0_1420
	dw	MKBALC2z_CLT
L0_1234
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",4660,430
	dsb	2
L0_13e4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5092,8
	dw	L0_13f8
	dw	L0_1420
	dw	MKBALC2z_CLT
L0_13f8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5112,40
L0_1420
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5152,270
	dsb	2
tower_module
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5424,12
	dw	calla_tower
	dw	L0_15b8
	dw	L0_15dc
	dw	bakmods
	dw	L0_1220
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5456,4
	dw	L0_13e4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5464,4
	dw	L0_1168
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5472,4
	dw	L0_119c
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5480,4
	dw	L0_1200
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5488,8
	dw	L0_1220
	dw	worldtlx1
	dw	L0_13e4
	dw	worldtlx2
	dw	L0_1168
	dw	worldtlx3
	dw	L0_119c
	dw	worldtlx4
	dw	L0_1200
	dw	worldtlx5
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5536,4
	dw	L0_cab8
	dw	BALCO_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5548,4
	dw	scrollx1
	dw	skew_7
L0_15b8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5560,36
L0_15dc
	dw	baklst5
	dw	(2+worldtlx5)
	dw	baklst4
	dw	(2+worldtlx4)
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst2
	dw	(2+worldtlx2)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5628,4
	dw	floor_code
	dw	baklst1
	dw	(2+worldtlx1)
	dw	baklst8
	dw	(2+worldtlx1)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5652,4
	dw	shadow_p1p2
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5676,4
nowall_module
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5680,12
	dw	calla_return
	dw	L0_15b8
	dw	L0_15dc
	dw	bakmods
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5708,4
	dw	L0_13e4
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5716,4
	dw	L0_1168
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5724,4
	dw	L0_119c
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5732,4
	dw	L0_1200
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5740,8
	dw	L0_1220
	dw	worldtlx1
	dw	L0_13e4
	dw	worldtlx2
	dw	L0_1168
	dw	worldtlx3
	dw	L0_119c
	dw	worldtlx4
	dw	L0_1200
	dw	worldtlx5
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5788,4
	dw	L0_cab8
	dw	BALCO_P
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5800,4
	dw	scrollx1
	dw	skew_7
soflor_addr
	dw	L0_16b8
soflor_FLR
L0_16b8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",5816,46080
L0_cab8
	incbin	"c:\tmp\retail\BKGDS\BKGDSOUL.OVL",51896,72960
	end
