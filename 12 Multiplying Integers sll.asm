	.data
	
	.text
		#sll allow you to shift the bits to the left
		addi $s0, $zero, 4		#save this number
		sll $t0, $s0, 2			#raise 4 or s0 to the power of 2
		
		#print out
		li $v0, 1
		add $a0, $zero, $t0
		syscall