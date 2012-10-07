.global f_delay
.global f_write_cmd
.global f_write_data
.global f_symbol
.global f_init_dspl


f_delay:	#delay function requires delay in clock_cycle*3 to be in $a0
	sw $ra, 0($sp)
	addi $sp, $sp, 4

	__delay_loop:
	addi $a0, $a0, -1
	bne $zero, $a0, __delay_loop
		
	lw $ra, -4($sp);
	addi $sp, $sp, -4
	jr $ra



f_write_cmd:	#write_cmd function (byte = $a0; RS = 0)
	sw $ra, 0($sp)
	addi $sp, $sp, 4

	lui $t0, 0b0
	andi $a0, $a0, 0xFF
	or $t0, $t0, $a0
	sw $t0, 0x00000004

	___wcmd_check_complete:	
	lw $t1, 0x00000004
	bgez $t1, ___wcmd_check_complete

	lw $ra, -4($sp);
	addi $sp, $sp, -4
	jr $ra



f_write_data:	#write_data function (byte = $a0; RS = 1)
	sw $ra, 0($sp)
	addi $sp, $sp, 4

	lui $t0, 0b1
	andi $a0, $a0, 0xFF
	or $t0, $t0, $a0
	sw $t0, 0x00000004

	___rcmd_check_complete:	
	lw $t1, 0x00000004
	bgez $t1, ___rcmd_check_complete

	lw $ra, -4($sp);
	addi $sp, $sp, -4
	jr $ra

f_symbol: #print symbol on display. Symbol's in $a0.
	sw $ra, 0($sp)
	addi $sp, $sp, 4

	jal f_write_data
	li $a0, 2000 
	jal f_delay	#wait 120us

	lw $ra, -4($sp);
	addi $sp, $sp, -4
	jr $ra

f_init_dspl: #display init function. No params.
	sw $ra, 0($sp)
	addi $sp, $sp, 4

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
	
	lw $ra, -4($sp);
	addi $sp, $sp, -4
	jr $ra

