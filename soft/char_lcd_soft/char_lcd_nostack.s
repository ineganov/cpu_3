.org 0


_start:
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

	#LCD INIT SEQUENCE

	#--1
	#wait 40ms
	li $a0, 666666
	jal f_delay

	#--2
	li $a0, 0b00110000
	jal f_write_cmd

	#wait 5ms
	li $a0, 83333
	jal f_delay

	#--3
	li $a0, 0b00110000
	jal f_write_cmd

	#wait 100us
	li $a0, 2000
	jal f_delay

	#--4
	li $a0, 0b00110000
	jal f_write_cmd

	#wait 100us
	li $a0, 2000
	jal f_delay


	#--5 ---- ACTUAL MODE SET
	li $a0, 0b00111000
	jal f_write_cmd
	#wait 100us
	li $a0, 2000
	jal f_delay

	#--6 ---- DISPLAY OFF
	li $a0, 0b00001000
	jal f_write_cmd
	#wait 100us
	li $a0, 2000
	jal f_delay

	#--7 ---- DISPLAY CLEAR
	li $a0, 0b00000001
	jal f_write_cmd
	#wait 2ms
	li $a0, 33333
	jal f_delay

	#--8 ---- ENTRY MODE SET
	li $a0, 0b00000110
	jal f_write_cmd
	#wait 100us
	li $a0, 2000
	jal f_delay

	#--9 ---- DISPLAY ON
	li $a0, 0b00001111
	jal f_write_cmd
	#wait 100us
	li $a0, 2000
	jal f_delay

	#--9 ---- RETURN HOME
	li $a0, 0b00000010
	jal f_write_cmd
	#wait 2ms
	li $a0, 33333
	jal f_delay

	li $a0, 'H'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'e'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'l'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'l'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'o'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, ','
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	#---- SET DDRAM ADDR
	li $a0, 0b11000000	 #second line. Use 0b10000000 for the first.
	jal f_write_cmd
	li $a0, 2000 
	jal f_delay	#wait 120us


	li $a0, 'W'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'o'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'r'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'l'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $a0, 'd'
	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	li $t0, 0b11000011
	sw $t0, 0x00000000 #write to leds
		
_stop:
	j _stop




f_delay:	#delay function requires delay in clock_cycle*3 to be in $a0
	addi $a0, $a0, -1
	bne $zero, $a0, f_delay
	jr $ra

f_write_cmd:	#write_cmd function (byte = $a0; RS = 0)
	lui $t0, 0b0
	andi $a0, $a0, 0xFF
	or $t0, $t0, $a0
	sw $t0, 0x00000004

	___wcmd_check_complete:	
	lw $t1, 0x00000004
	bgez $t1, ___wcmd_check_complete

	jr $ra

f_write_data:	#write_data function (byte = $a0; RS = 1)
	lui $t0, 0b1
	andi $a0, $a0, 0xFF
	or $t0, $t0, $a0
	sw $t0, 0x00000004

	___rcmd_check_complete:	
	lw $t1, 0x00000004
	bgez $t1, ___rcmd_check_complete

	jr $ra

