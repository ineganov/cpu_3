#.org 0

.global _start

_start:
	li $sp, 0x80000000 #init stack pointer

	li $t0, 0b001
	sw $t0, 0x00000000 #write to leds
	li $a0, 8333333	   #half-second delay @50 MHz
	jal f_delay

	li $t0, 0b010
	sw $t0, 0x00000000 #write to leds
	li $a0, 8333333	   #half-second delay @50 MHz
	jal f_delay

	li $t0, 0b100
	sw $t0, 0x00000000 #write to leds
	li $a0, 8333333	   #half-second delay @50 MHz
	jal f_delay

	li $t0, 0b10000001
	sw $t0, 0x00000000 #write to leds
	
	jal f_init_dspl

	li $a0, 'H'
	jal f_symbol

	li $a0, 'e'
	jal f_symbol

	li $a0, 'l'
	jal f_symbol

	li $a0, 'l'
	jal f_symbol

	li $a0, 'o'
	jal f_symbol

	li $a0, ','
	jal f_symbol

	#---- SET DDRAM ADDR
	li $a0, 0b11000000	 #second line. Use 0b10000000 for the first.
	jal f_write_cmd
	li $a0, 2000 
	jal f_delay	#wait 120us


	li $a0, 'W'
	jal f_symbol

	li $a0, 'o'
	jal f_symbol

	li $a0, 'r'
	jal f_symbol

	li $a0, 'l'
	jal f_symbol

	li $a0, 'd'
	jal f_symbol

	li $a0, '('
	jal f_symbol

	li $a0, 'M'
	jal f_symbol

	li $a0, 'I'
	jal f_symbol

	li $a0, 'P'
	jal f_symbol

	li $a0, 'S'
	jal f_symbol

	li $a0, ')'
	jal f_symbol

	li $t0, 0b11000011
	sw $t0, 0x00000000 #write to leds
		
_stop:
	j _stop



