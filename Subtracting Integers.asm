.data	
	number1: .word 20
	number2: .word 10
.text
	lw $s0, number1			#s0 = 20
	lw $s1, number2			#s1 = 10
	
	sub $t0, $s0, $s1		#t0 = 20 - 10
	
	li $v0, 1			#prepare to print an integer
	move $a0, $t0			#a0 = t0
	syscall				#do it
	