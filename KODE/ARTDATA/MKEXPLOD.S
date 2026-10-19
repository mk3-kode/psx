	opt	c+
EXPLODE	group
	xdef	PUFF1
	xdef	a_dave_explode
	xdef	a_puff
	xdef	explode_fx_anims
	xref	BLACK_p
	xref	PUFF_P
	xref	RED_p
	xref	SCORE_P
	xref	WHITE_p
	xref	XPLODZ_P
	xref	bpal_black_P
	xref	bpal_blue_P
	xref	bpal_flash1_P
	xref	bpal_flash2_P
	xref	bpal_flash3_P
	xref	bpal_red_P
	xref	bpal_white_P
	section	.explodedata
explode_fx_anims
	incbin	"c:\tmp\retail\MK3.EXE",604524,8
a_puff
	incbin	"c:\tmp\retail\MK3.EXE",604532,24
a_dave_explode
	incbin	"c:\tmp\retail\MK3.EXE",604556,72
PUFF1
	incbin	"c:\tmp\retail\MK3.EXE",604628,12
	dw	PUFF_P
	incbin	"c:\tmp\retail\MK3.EXE",604644,68
	dw	XPLODZ_P
	incbin	"c:\tmp\retail\MK3.EXE",604716,639
	dsb	1
	incbin	"c:\tmp\retail\MK3.EXE",605356,1759
	dsb	1
	incbin	"c:\tmp\retail\MK3.EXE",607116,1261
	dsb	3
	incbin	"c:\tmp\retail\MK3.EXE",608380,439
	dsb	1
	incbin	"c:\tmp\retail\MK3.EXE",608820,2507
	dsb	1
	incbin	"c:\tmp\retail\MK3.EXE",611328,3806
	dsb	2
	incbin	"c:\tmp\retail\MK3.EXE",615136,398
	dsb	2
	incbin	"c:\tmp\retail\MK3.EXE",615536,331
	dsb	1
	incbin	"c:\tmp\retail\MK3.EXE",615868,346
	dsb	2
	incbin	"c:\tmp\retail\MK3.EXE",616216,271
	end
