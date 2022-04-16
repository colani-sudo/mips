.data	
	number1: .word 5
	number2: .word 10
.text
	lw $t0, number1($zero)		#get a value from memory and put it in register
	lw $t1, number2($zero)
	
	add $t2, $t0, $t1		#t2 = t0 + t1
	
	li $v0, 1			#prepare to print an integer
	add $a0, $zero, $t2		#a0 = xero + t2
	syscall