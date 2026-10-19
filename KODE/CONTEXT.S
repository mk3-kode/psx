;#******************************************************************************
;# File: context.s
;#
;# By: David Schwartz
;#
;# Date: August 1994
;#
;# (C) Williams Entertainment
;#
;# Mortal Kombat III CONTEXT SWITCHING ROUTINES
;#******************************************************************************/
	
	opt c+

; THESE EQUATES MUST MATCH THE CONTEXT STRUCT IN mkstruct.h
c_wakeup = 0
c_stackptr = 4
c_frameptr = 8
c_globalptr = 12
c_s0 = 16
c_s1 = 20
c_s2 = 24
c_s3 = 28
c_s4 = 32
c_s5 = 36
c_s6 = 40
c_s7 = 44

	xref	EnterCriticalSection
	xref	ExitCriticalSection

	section	.text

	global  context_init_main

;###############################################################################
;# Function: void context_init_main(ADDRESS *main_context)
;#
;# By: David Schwartz
;#
;# Parameters: a0 = ADDRESS *main_context
;#
;# Description: This routine initialize the variables in the main context
;###############################################################################
context_init_main:
	sw	ra,c_wakeup(a0)
	sw	sp,c_stackptr(a0)
	sw	fp,c_frameptr(a0)
	sw	gp,c_globalptr(a0)
	sw	s0,c_s0(a0)
	sw	s1,c_s1(a0)
	sw	s2,c_s2(a0)
	sw	s3,c_s3(a0)
	sw	s4,c_s4(a0)
	sw	s5,c_s5(a0)
	sw	s6,c_s6(a0)
	sw	s7,c_s7(a0)
	j	ra
	nop

	global 	context_kill_switch

;###############################################################################
;# Function: void context_kill_switch(ADDRESS *restore_context)
;#
;# By: David Schwartz
;#
;# Parameters: a0 = ADDRESS *restore_context
;#
;# Description: This routine performs a context switch back to the main 
;#			   process.  It is usually called from the process_kill_context routine.
;###############################################################################
context_kill_switch:
	move	s0,a0				; stick in a reg that must be preserved during calls
	nop
	jal	EnterCriticalSection
	nop
	lw	gp,c_globalptr(s0)
	lw	fp,c_frameptr(s0)
	lw	sp,c_stackptr(s0)
	nop
	jal	ExitCriticalSection
	nop

	move	a0,s0
	nop

	lw	ra,c_wakeup(a0)
	lw	s0,c_s0(a0)
	lw	s1,c_s1(a0)
	lw	s2,c_s2(a0)
	lw	s3,c_s3(a0)
	lw	s4,c_s4(a0)
	lw	s5,c_s5(a0)
	lw	s6,c_s6(a0)
	lw	s7,c_s7(a0)
	j	ra
	nop

	global context_switch

;###############################################################################
;# Function: void context_switch(ADDRESS *restore_context,ADDRESS *save_context)
;#
;# By: David Schwartz
;#
;# Parameters: a0 = ADDRESS *restore_context
;#			  a1 = ADDRESS *save_context
;#
;# Description: This routine performs a context switch back to the restore.  It saves the current
;#			   context into the save context and then restores the context from the restore context.
;###############################################################################
context_switch:
	sw	ra,c_wakeup(a1)							; save the current context 
	sw	sp,c_stackptr(a1)
	sw	fp,c_frameptr(a1)
	sw	gp,c_globalptr(a1)
	sw	s0,c_s0(a1)
	sw	s1,c_s1(a1)
	sw	s2,c_s2(a1)
	sw	s3,c_s3(a1)
	sw	s4,c_s4(a1)
	sw	s5,c_s5(a1)
	sw	s6,c_s6(a1)
	sw	s7,c_s7(a1)

	move	s0,a0				; stick in a reg that must be preserved during calls
	nop
	jal	EnterCriticalSection
	nop
	lw	gp,c_globalptr(s0)
	lw	fp,c_frameptr(s0)
	lw	sp,c_stackptr(s0)
	nop
	jal	ExitCriticalSection
	nop

	move	a0,s0
	nop

	lw	ra,c_wakeup(a0)					; restore the new context 
	lw	s0,c_s0(a0)
	lw	s1,c_s1(a0)
	lw	s2,c_s2(a0)
	lw	s3,c_s3(a0)
	lw	s4,c_s4(a0)
	lw	s5,c_s5(a0)
	lw	s6,c_s6(a0)
	lw	s7,c_s7(a0)
	j  	ra
	nop

	global context_jump
;###############################################################################
;# Function: void context_jump(ADDRESS *jmp_context)
;#
;# By: David Schwartz
;#
;# Parameters: a0 = context that has jump info set
;#
;# Description: This routine makes a jump from one routine to another, in the process
;#				it resets the stack
;###############################################################################
context_jump:
	move	s0,a0				; stick in a reg that must be preserved during calls
	nop
	jal	EnterCriticalSection
	nop
	lw	gp,c_globalptr(s0)
	lw	fp,c_stackptr(s0)
	lw	sp,c_stackptr(s0)
	nop
	jal	ExitCriticalSection
	nop
	lw	ra,c_wakeup(s0)					; restore the new context 
	nop
	j  	ra
	nop


	global FlushCacheRam
;###############################################################################
;#
;###############################################################################
FlushCacheRam:
	dw	$27BDFFE8
	dw	$AFBF0010
	dw	$AFA10014
	dw	$40026000
	dw	$00000000
	dw	$00000000
	dw	$00000000
	dw	$00403021
	dw	$2401FFFC
	dw	$00220824
	dw	$40816000
	dw	$00000000
	dw	$00000000
	dw	$04110001
	dw	$23E20030
	dw	$3C01A000
	dw	$00411025
	dw	$0040F809
	dw	$00000000
	dw	$40866000
	dw	$00000000
	dw	$00000000
	dw	$8FBF0010
	dw	$8FA10014
	dw	$27BD0018
	dw	$03E00008
	dw	$00000000
flush_cache_body:
	dw	$3C03FFFE
	dw	$34630130
	dw	$8C650000
	dw	$2401FB7C
	dw	$00250824
	dw	$34210804
	dw	$AC610000
	dw	$40046000
	dw	$3C010001
	dw	$00240825
	dw	$40816000
	dw	$00000000
	dw	$00000000
	dw	$34010000
	dw	$34020F80
	dw	$AC200000
	dw	$AC200010
	dw	$AC200020
	dw	$AC200030
	dw	$AC200040
	dw	$AC200050
	dw	$AC200060
	dw	$AC200070
	dw	$1422FFF7
	dw	$24210080
	dw	$3C01FFFE
	dw	$3421FFFF
	dw	$00240824
	dw	$40846000
	dw	$00000000
	dw	$00000000
	dw	$AC650000
	dw	$00000000
	dw	$00000000
	dw	$00000000
	dw	$00000000
	dw	$03E00008
	dw	$00000000
