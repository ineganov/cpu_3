.globl _start
 
.org 0

_start:
	li $sp, 255			#init stack pointer
	li $gp, 0x00000000	#init global pointer

	li $v0, 5
	li $v1, 7
	addu $a0, $v1, $v0
	subu $a1, $v1, $v0
	
	.set noreorder
	j _target
	lwl $t0, 13
	.set reorder
	
	li $t0, 100
	li $t1, 200

_target:
	sll $a2, $a0, 1
	sll $a3, $a0, 2


_stop:			#loop forever
	j _stop


.org 0x100

_interrupt:
	mfc0 $k0, $13
	mfc0 $k1, $14
#	addiu $k1, $k1, -4
	jr $k1
