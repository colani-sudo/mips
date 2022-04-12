	.data
	
	.text
		addi $t0, $zero, 2000
		addi $t1, $zero, 10
		
		mult $t0, $t1 				#results are in low and high registers
		
		mflo $s0				#move from low - moves the product of mult to $s0
		
		#display the number to the screen
		li $v0, 1
		add $a0, $zero, $s0
		syscall					#do it