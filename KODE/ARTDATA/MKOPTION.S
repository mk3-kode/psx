	opt	c+
options_ovl	group
	xdef	FRAME01
	xdef	POLE01
	xdef	a_credit
	xdef	a_logo
	xdef	a_opt_dragon
	xdef	logobg_CLT
	xdef	optcoin_module
	xdef	optextbg_PAL
	xdef	options_anims
	xdef	options_module
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
	xref	dlists_bogus
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
	section	.text_options
logobg_CLT
L0_0
	dw	L0_4
L0_4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",4,514
	dsb	2
optextbg_PAL
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",520,196
L0_2cc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",716,450
	dsb	2
L0_490
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",1168,466
	dsb	2
L0_664
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",1636,500
L0_858
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",2136,504
L0_a50
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",2640,482
	dsb	2
L0_c34
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",3124,504
L0_e2c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",3628,490
	dsb	2
L0_1018
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",4120,504
L0_1210
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",4624,492
L0_13fc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",5116,508
L0_15f8
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",5624,492
L0_17e4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",6116,490
	dsb	2
L0_19d0
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",6608,476
L0_1bac
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",7084,476
L0_1d88
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",7560,482
	dsb	2
L0_1f6c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",8044,470
	dsb	2
L0_2144
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",8516,500
L0_2338
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",9016,498
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",9516,500
L0_2720
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",10016,474
	dsb	2
L0_28fc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",10492,500
L0_2af0
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",10992,500
L0_2ce4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",11492,504
L0_2edc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",11996,502
	dsb	2
L0_30d4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",12500,496
L0_32c4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",12996,496
L0_34b4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",13492,294
	dsb	2
L0_35dc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",13788,488
L0_37c4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",14276,504
L0_39bc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",14780,498
	dsb	2
L0_3bb0
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",15280,502
	dsb	2
L0_3da8
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",15784,498
	dsb	2
L0_3f9c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",16284,502
	dsb	2
L0_4194
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",16788,502
	dsb	2
L0_438c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",17292,502
	dsb	2
L0_4584
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",17796,506
	dsb	2
L0_4780
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",18304,500
L0_4974
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",18804,486
	dsb	2
L0_4b5c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",19292,246
	dsb	2
L0_4c54
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",19540,494
	dsb	2
L0_4e44
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",20036,502
	dsb	2
L0_503c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",20540,502
	dsb	2
L0_5234
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",21044,506
	dsb	2
L0_5430
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",21552,502
options_anims
	dsb	2
a_opt_dragon
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22056,196
a_logo
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22252,352
a_credit
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22604,84
	dw	L0_2144
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22692,12
	dw	L0_2338
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22708,12
	dw	L0_2720
FRAME01
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22724,12
	dw	L0_2cc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22740,12
	dw	L0_490
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22756,12
	dw	L0_664
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22772,12
	dw	L0_858
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22788,12
	dw	L0_a50
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22804,12
	dw	L0_c34
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22820,12
	dw	L0_e2c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22836,12
	dw	L0_1018
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22852,12
	dw	L0_1210
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22868,12
	dw	L0_13fc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22884,12
	dw	L0_15f8
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22900,12
	dw	L0_17e4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22916,12
	dw	L0_19d0
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22932,12
	dw	L0_1bac
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22948,12
	dw	L0_1d88
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22964,12
	dw	L0_1f6c
POLE01
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22980,12
	dw	L0_28fc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",22996,12
	dw	L0_2af0
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23012,12
	dw	L0_2ce4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23028,12
	dw	L0_2edc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23044,12
	dw	L0_30d4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23060,12
	dw	L0_32c4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23076,12
	dw	L0_34b4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23092,12
	dw	L0_35dc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23108,12
	dw	L0_37c4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23124,12
	dw	L0_39bc
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23140,12
	dw	L0_3bb0
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23156,12
	dw	L0_3da8
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23172,12
	dw	L0_3f9c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23188,12
	dw	L0_4194
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23204,12
	dw	L0_438c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23220,12
	dw	L0_4584
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23236,12
	dw	L0_4780
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23252,12
	dw	L0_4974
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23268,12
	dw	L0_4b5c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23284,12
	dw	L0_4c54
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23300,12
	dw	L0_4e44
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23316,12
	dw	L0_503c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23332,12
	dw	L0_5234
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23348,12
	dw	L0_5430
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",23364,5087
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",28452,5242
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",33696,6014
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",39712,5634
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",45348,5286
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",50636,11561
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",62200,5587
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",67788,5233
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",73024,5347
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",78372,6129
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",84504,5643
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",90148,5306
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",95456,5266
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",100724,5918
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",106644,5321
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",111968,7358
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",119328,7417
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",126748,13241
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",139992,4874
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",144868,3235
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",148104,1439
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",149544,3254
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",152800,4891
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",157692,13270
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",170964,14734
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",185700,7391
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",193092,7038
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",200132,14281
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",214416,4650
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",219068,4905
	dsb	3
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",223976,6203
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",230180,7046
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",237228,7375
	dsb	1
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",244604,5438
	dsb	2
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",250044,10638
	dsb	2
L0_3fa4c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260684,8
	dw	L0_3fa60
	dw	L0_3fa9c
	dw	L0_0
L0_3fa60
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260704,60
L0_3fa9c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260764,60
options_module
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260824,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_bogus
	dw	bakmods
	dw	L0_3fa4c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260856,12
L0_3fb04
	dw	L0_3fb0c
	dw	L0_3fb50
L0_3fb0c
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260876,66
	dsb	2
L0_3fb50
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",260944,130
	dsb	2
L0_3fbd4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",261076,8
	dw	L0_3fbe8
	dw	L0_3fd00
	dw	L0_3fb04
L0_3fbe8
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",261096,280
L0_3fd00
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",261376,50
	dsb	2
optcoin_module
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",261428,12
	dw	calla_return
	dw	no_scroll
	dw	dlists_buyin
	dw	bakmods
	dw	L0_3fbd4
	incbin	"c:\tmp\retail\ATTRACT\MKOPTION.BIN",261460,12
	end
