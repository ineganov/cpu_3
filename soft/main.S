.globl _start
 
.org 0

_start:
	li $sp, 255			#init stack pointer
	li $gp, 0x00000000	#init global pointer

	li $v0, 100
	li $v1, -10
	li $t0, -20
	li $t1, 110

	slt  $a0, $v1, $v0
	sltu $a0, $v1, $v0
	slt  $a0, $t0, $v1
	slt  $a0, $v0, $t1

	slti $a1, $v0, 99
	slti $a1, $v0, 101

	slti $a2, $v0, 0
	slti $a2, $v1, -9
	slti $a2, $v1, -10

	sltiu $a3, $v0, 0
	sltiu $a3, $v0, -9
	sltiu $a3, $v1, -10
	
	sw	  $a0, 20
	add   $a0, $v0, $v1
	addu  $a0, $v0, $v1
	sub   $a0, $v0, $v1
	subu  $a0, $v0, $v1
	or    $a0, $v0, $v1
	nor   $a0, $v0, $v1
	lw	  $a0, 20

	li  $t0, 0xFFFFFFF0
	li  $t1, 0x0000001F
	and $t2, $t0, $t1
	xor $t2, $t0, $t1
	or  $t2, $t0, $t1
	nor $t2, $t0, $t1



_stop:			#loop forever
	j _stop


.org 0x100

_interrupt:
	mfc0 $k0, $13
	mfc0 $k1, $14
#	addiu $k1, $k1, -4
	jr $k1
