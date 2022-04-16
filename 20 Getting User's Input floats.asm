.data
	message:	.asciiz "Enter the value of PI: "
	zeroAsFloat:	.float 0.0
.text
	lwc1 $f4, zeroAsFloat		#load word to coprocessor one - prepares the $f4 register to store a float
	
	#Display message
	li $v0, 4
	la $a0, message
	syscall
	
	#Read User's Input
	li $v0, 6		#code 6 is for printing float types but the actual value is stored in the available $f register
	syscall
	
	#Display
	li $v0, 2			#code 2 for printing floats
	add.s $f12, $f0, $f4
	syscall