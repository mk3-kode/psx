;******************************************************************************
; File: heaparea.s
;
; By: David Schwartz
;
; Date: Mar 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Main Heap Area (Overlay Area)
;******************************************************************************/

	opt c+

main_ovl group
	section	.text_main

	xdef	player_heap

;player_heap 	dsb	1140000 	; define heap area
player_heap 	dsb	494500*2 	; define heap area


