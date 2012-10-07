#.org 0

.global _start

_start:
	li $sp, 0x80000000 #init stack pointer

	li $a1, 1
	li $a0, 0xF
	li $t0, 0x80000000
	sll $a0, $a0, 16
	srl $v0, $a0, 8
	sllv $v1, $a0, $a1
	sra $t1, $t0, 2
	srav $t2, $t0, $a1

		
_stop:
	j _stop



