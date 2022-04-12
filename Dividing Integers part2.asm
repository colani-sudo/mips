.data

.text
	addi $t0, $zero, 30
	addi $t1, $zero, 6
	
	#div $s0, $t0, 10		#can divide by 10 which gives 3, instead of t1=5 which gives 3
	div $t0, $t1			#again now we'll use the lo register to store our resultant quotient, 
					#the remainder will go to the hi register
	mflo $s0		#quotient - move from low
	mfhi $s1		#remainder - move from hi
	
	
	#print the quotient 
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	#print the remainder 
	li $v0, 1
	add $a0, $zero, $s1
	syscall