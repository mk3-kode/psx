	opt c+

	section	.text
	xdef	check_start
	xdef	check_end
check_start dw sect(.text)

	section	.data
check_end		dw sect(.data)

l0	group
	section .text

	xdef	level_loadaddr
level_loadaddr	dw group(l0)

p0	group
	section	.text

	xdef	palette_loadaddr
palette_loadaddr	dw $80010000				;-DHS- this is a hack because we could
																			; not figure out why the damn linker wouldnt
																			; put the correct address when we used group(p0)

f0 group
 	section	.text

	xdef	fightint_loadaddr
fightint_loadaddr dw group(f0)

main_ovl group
	section .text

	xdef pheap_loadaddr
pheap_loadaddr	dw	group(main_ovl)
	