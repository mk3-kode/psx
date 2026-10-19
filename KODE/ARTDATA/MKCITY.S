	opt	c+
l2	group
	xdef	BANK_STBREAK1
	xdef	BANK_STBREAK2
	xdef	BANK_STBREAK3
	xdef	BURNING1
	xdef	BURNING2
	xdef	BURNING3
	xdef	BURNING4
	xdef	BURNING5
	xdef	BURNING6
	xdef	BURNING7
	xdef	BURNING8
	xdef	CITY_LARGE01
	xdef	CITY_LARGE02
	xdef	CITY_LARGE03
	xdef	CITY_LARGE04
	xdef	CITY_LARGE05
	xdef	CITY_LARGE06
	xdef	CITY_LARGE07
	xdef	CITY_LARGE08
	xdef	CITY_LARGE09
	xdef	CITY_LARGE10
	xdef	CITY_LARGE11
	xdef	CITY_LARGE12
	xdef	CITY_MEDIUM01
	xdef	CITY_MEDIUM02
	xdef	CITY_MEDIUM03
	xdef	CITY_MEDIUM04
	xdef	CITY_MEDIUM05
	xdef	CITY_MEDIUM06
	xdef	CITY_MEDIUM07
	xdef	CITY_MEDIUM08
	xdef	CITY_MEDIUM09
	xdef	CITY_MEDIUM10
	xdef	CITY_MEDIUM11
	xdef	CITY_MEDIUM12
	xdef	CITY_SMALL01
	xdef	CITY_SMALL02
	xdef	CITY_SMALL03
	xdef	CITY_SMALL04
	xdef	CITY_SMALL05
	xdef	CITY_SMALL06
	xdef	CITY_SMALL07
	xdef	CITY_SMALL08
	xdef	CITY_SMALL09
	xdef	CITY_SMALL10
	xdef	CITY_SMALL11
	xdef	CITY_SMALL12
	xdef	CITY_XPLODE01
	xdef	CITY_XPLODE02
	xdef	CITY_XPLODE03
	xdef	CITY_XPLODE04
	xdef	CITY_XPLODE05
	xdef	CITY_XPLODE06
	xdef	CITY_XPLODE07
	xdef	CITY_XPLODE08
	xdef	CITY_XPLODE09
	xdef	CITY_XPLODE10
	xdef	CITY_XPLODE11
	xdef	CITY_XPLODE12
	xdef	CSTORM01
	xdef	CSTORM03
	xdef	CSTORM05
	xdef	CSTORM07
	xdef	CSTORM09
	xdef	CSTORM11
	xdef	a_burn
	xdef	a_city_crumple
	xdef	a_city_large_rock
	xdef	a_city_med_rock
	xdef	a_city_small_rock
	xdef	a_storm_city
	xdef	bank_anims
	xdef	bank_module
	xdef	city_anims
	xdef	dlists_bank_to_roof
	xdef	roof_module
	xref	BLACK_p
	xref	BURN_P
	xref	CITYFLR_P
	xref	MEDIUM_p
	xref	MKCITY_CLT
	xref	NUSTORM_P
	xref	RED_p
	xref	SCORE_P
	xref	SMALL_p
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
	xref	calla_bank
	xref	calla_city
	xref	calla_return
	xref	check_only_t
	xref	floor_code
	xref	mkbank_CLT
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
	section	.bkgddata_l2
bank_anims
BANK_STBREAK1
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",0,12
	dw	STBREAK_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",16,8
BANK_STBREAK2
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",24,12
	dw	STBREAK_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",40,8
BANK_STBREAK3
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",48,12
	dw	STBREAK_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",64,8
city_anims
a_burn
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",72,40
a_storm_city
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",112,32
CSTORM01
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",144,12
	dw	NUSTORM_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",160,8
CSTORM03
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",168,20
CSTORM05
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",188,20
CSTORM07
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",208,20
CSTORM09
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",228,20
CSTORM11
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",248,20
BURNING1
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",268,12
	dw	BURN_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",284,8
BURNING2
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",292,20
BURNING3
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",312,20
BURNING4
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",332,20
BURNING5
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",352,20
BURNING6
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",372,20
BURNING7
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",392,20
BURNING8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",412,20
CITY_SMALL01
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",432,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",448,8
CITY_SMALL02
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",456,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",472,8
CITY_SMALL03
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",480,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",496,8
CITY_SMALL04
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",504,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",520,8
CITY_SMALL05
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",528,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",544,8
CITY_SMALL06
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",552,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",568,8
CITY_SMALL07
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",576,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",592,8
CITY_SMALL08
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",600,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",616,8
CITY_SMALL09
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",624,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",640,8
CITY_SMALL10
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",648,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",664,8
CITY_SMALL11
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",672,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",688,8
CITY_SMALL12
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",696,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",712,8
CITY_MEDIUM01
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",720,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",736,8
CITY_MEDIUM02
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",744,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",760,8
CITY_MEDIUM03
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",768,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",784,8
CITY_MEDIUM04
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",792,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",808,8
CITY_MEDIUM05
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",816,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",832,8
CITY_MEDIUM06
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",840,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",856,8
CITY_MEDIUM07
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",864,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",880,8
CITY_MEDIUM08
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",888,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",904,8
CITY_MEDIUM09
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",912,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",928,8
CITY_MEDIUM10
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",936,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",952,8
CITY_MEDIUM11
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",960,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",976,8
CITY_MEDIUM12
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",984,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1000,8
CITY_LARGE01
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1008,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1024,8
CITY_LARGE02
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1032,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1048,8
CITY_LARGE03
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1056,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1072,8
CITY_LARGE04
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1080,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1096,8
CITY_LARGE05
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1104,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1120,8
CITY_LARGE06
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1128,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1144,8
CITY_LARGE07
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1152,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1168,8
CITY_LARGE08
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1176,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1192,8
CITY_LARGE09
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1200,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1216,8
CITY_LARGE10
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1224,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1240,8
CITY_LARGE11
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1248,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1264,8
CITY_LARGE12
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1272,12
	dw	MEDIUM_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1288,8
CITY_XPLODE01
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1296,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1312,8
CITY_XPLODE02
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1320,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1336,8
CITY_XPLODE03
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1344,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1360,8
CITY_XPLODE04
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1368,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1384,8
CITY_XPLODE05
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1392,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1408,8
CITY_XPLODE06
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1416,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1432,8
CITY_XPLODE07
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1440,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1456,8
CITY_XPLODE08
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1464,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1480,8
CITY_XPLODE09
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1488,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1504,8
CITY_XPLODE10
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1512,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1528,8
CITY_XPLODE11
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1536,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1552,8
CITY_XPLODE12
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1560,12
	dw	SMALL_p
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1576,8
a_city_small_rock
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1584,56
a_city_med_rock
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1640,56
a_city_large_rock
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1696,56
a_city_crumple
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1752,52
L0_70c
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1804,8
	dw	L0_720
	dw	L0_920
	dw	MKCITY_CLT
L0_720
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1824,40
L0_748
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1864,8
	dw	L0_75c
	dw	L0_920
	dw	MKCITY_CLT
L0_75c
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1884,50
	dsb	2
L0_790
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1936,8
	dw	L0_7a4
	dw	L0_920
	dw	MKCITY_CLT
L0_7a4
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1956,20
L0_7b8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1976,8
	dw	L0_7cc
	dw	L0_920
	dw	MKCITY_CLT
L0_7cc
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",1996,220
L0_8a8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2216,8
	dw	L0_8bc
	dw	L0_920
	dw	MKCITY_CLT
L0_8bc
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2236,100
L0_920
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2336,270
	dsb	2
roof_module
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2608,12
	dw	calla_city
	dw	L0_acc
	dw	L0_af0
	dw	bakmods
	dw	L0_8a8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2640,4
	dw	L0_7b8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2648,4
	dw	L0_790
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2656,8
	dw	L0_748
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2668,4
	dw	L0_70c
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2676,8
	dw	L0_8a8
	dw	worldtlx1
	dw	L0_7b8
	dw	worldtlx2
	dw	L0_790
	dw	worldtlx3
	dw	L0_748
	dw	worldtlx4
	dw	L0_748
	dw	worldtlx5
	dw	L0_70c
	dw	worldtlx6
	dw	L0_70c
	dw	worldtlx7
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2740,4
	dw	L0_12e4
	dw	CITYFLR_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2752,4
	dw	scrollx2
	dw	skew_7
L0_acc
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2764,36
L0_af0
	dw	baklst7
	dw	(2+worldtlx5)
	dw	baklst6
	dw	(2+worldtlx6)
	dw	baklst5
	dw	(2+worldtlx4)
	dw	baklst4
	dw	(2+worldtlx4)
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst2
	dw	(2+worldtlx2)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2848,4
	dw	floor_code
	dw	baklst1
	dw	(2+worldtlx1)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2864,4
	dw	shadow_p1p2
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2888,4
L0_b4c
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2892,8
	dw	L0_b60
	dw	L0_1044
	dw	mkbank_CLT
L0_b60
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",2912,1110
	dsb	2
L0_fb8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4024,8
	dw	L0_fcc
	dw	L0_1044
	dw	mkbank_CLT
L0_fcc
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4044,120
L0_1044
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4164,350
	dsb	2
bank_module
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4516,12
	dw	calla_bank
	dw	L0_11fc
	dw	L0_1220
	dw	bakmods
	dw	L0_b4c
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4548,4
	dw	L0_fb8
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4556,8
	dw	L0_b4c
	dw	worldtlx1
	dw	L0_fb8
	dw	worldtlx2
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4580,4
	dw	L0_12e4
	dw	CITYFLR_P
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4592,4
	dw	scrollx1
	dw	skew_7
L0_11fc
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4604,36
L0_1220
	dw	baklst2
	dw	(2+worldtlx2)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4648,4
	dw	floor_code
	dw	baklst1
	dw	(2+worldtlx1)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4664,4
	dw	shadow_p1p2
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4672,4
	dw	use_next_y
	dw	worldtly
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4700,4
dlists_bank_to_roof
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4704,4
	dw	use_worldtly_t
	dw	baklst2_t
	dw	(2+worldtlx2_t)
	dw	baklst1_t
	dw	(2+worldtlx1_t)
	dw	objlst_t
	dw	(2+worldtlx_t)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4736,4
	dw	check_only_t
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4744,4
	dw	use_worldtly
	dw	baklst7
	dw	(2+worldtlx5)
	dw	baklst6
	dw	(2+worldtlx6)
	dw	baklst5
	dw	(2+worldtlx4)
	dw	baklst4
	dw	(2+worldtlx4)
	dw	baklst3
	dw	(2+worldtlx3)
	dw	baklst2
	dw	(2+worldtlx2)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4800,4
	dw	floor_code
	dw	baklst1
	dw	(2+worldtlx1)
	dw	objlst
	dw	(2+worldtlx)
	dw	objlst2
	dw	(2+worldtlx)
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4832,4
L0_12e4
	incbin	"c:\tmp\retail\BKGDS\BKGDCITY.OVL",4836,52800
	end
