.data
	
.text
	main:
		#use $a registers to pass data to functions
		addi $a1, $zero, 50
		addi $a2, $zero, 100
		jal addNumbers
		
		#print number on screen
		li $v0, 1
		add $a0, $zero, $v1		#pass the argument $v1 from the addNumbers funtion to print the sum
		syscall
		
		#Tell the system that the program is done/ stops the program
		li $v0, 10
		syscall
	
	addNumbers:
		add $v1, $a1, $a2
		
		jr $ra			#jumps to register/the procedure that called it (the return address)
	