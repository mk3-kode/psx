	opt	c+

	section	.text

	xdef	_stacksize,_ramsize,_heapsize

_stacksize	dw	$00000700
_ramsize	dw	$00200000
_heapsize	dw	$00000100

	end
