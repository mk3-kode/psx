	opt	c+
f0	group
f1	group
f2	group
f3	group
f9	group
	xdef	FINFITE1
	xdef	FINHER1
	xdef	FINHIM1
	xdef	MERCY_13
	xdef	fight_fx_anims
	xdef	misc_anims
	xdef	smstar
	xref	BLACK_p
	xref	FITEYEL_P
	xref	MERCY_P
	xref	MKFIGHT_P
	xref	MRFLASH_P
	xref	RED_p
	xref	SCORE_P
	xref	WHITE_p
	xref	bpal_black_P
	xref	bpal_blue_P
	xref	bpal_flash1_P
	xref	bpal_flash2_P
	xref	bpal_flash3_P
	xref	bpal_red_P
	xref	bpal_white_P
	section	.fightintdata
FINFITE1
fight_fx_anims
L0_0
	incbin	"c:\tmp\retail\MK3.EXE",54228,12
	dw	MKFIGHT_P
	incbin	"c:\tmp\retail\MK3.EXE",54244,2575
	section	.finhimdata
FINHIM1
	dw	(L2_10-L0_0)
	incbin	"c:\tmp\retail\MK3.EXE",56824,8
	dw	MKFIGHT_P
L2_10
	incbin	"c:\tmp\retail\MK3.EXE",56836,4099
	section	.finherdata
FINHER1
	dw	(L1_10-L0_0)
	incbin	"c:\tmp\retail\MK3.EXE",60940,8
	dw	MKFIGHT_P
L1_10
	incbin	"c:\tmp\retail\MK3.EXE",60952,4153
	section	.mercydata
MERCY_13
	dw	(L3_10-L0_0)
	incbin	"c:\tmp\retail\MK3.EXE",65112,8
	dw	MERCY_P
L3_10
	incbin	"c:\tmp\retail\MK3.EXE",65124,1429
	section	.starsymboldata
L4_0
	incbin	"c:\tmp\retail\MK3.EXE",66556,14
misc_anims
	dsb	2
smstar
	incbin	"c:\tmp\retail\MK3.EXE",66572,12
	dw	L4_0
	incbin	"c:\tmp\retail\MK3.EXE",66588,8
	end
