.globl _start

_start:
	li $sp, 255			#init stack pointer
	li $gp, 0x00000000	#init global pointer

	li $a0, 0x01020304
	sw $a0,  4
	
	sh $a0,  8
	sh $a0,  10

	sb $a0, 12
	sb $a0, 13
	sb $a0, 14
	sb $a0, 15
	
	lw  $a1, 28
	lh  $a2, 28
	lh  $a3, 30
	lhu  $k0, 28
	lhu  $k1, 30
	nop

	lb  $t0, 28	
	lb  $t1, 29
	lb  $t2, 30
	lb  $t3, 31
	lbu  $t4, 28	
	lbu  $t5, 29
	lbu  $t6, 30
	lbu  $t7, 31

	li $v0, 42
	sw $v0, 0 #write main return value to leds

_stop:			#loop forever
	j _stop


		#jal main #jump to main
