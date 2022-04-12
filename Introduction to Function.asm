.data
	message: .asciiz "Hi MIPS Assembly.\nMy name is King.\n"
.text
	main:
		jal displayMessage
		#once the function is done you can add some more code
		addi $s0, $zero, 5
		
		#print number on screen
		li $v0, 1
		add $a0, $zero, $s0
		syscall
		
		#Tell the system that the program is done/ stops the program
		li $v0, 10
		syscall
	
	displayMessage:
		li $v0, 4 		#display the text on screen
		la $a0, message
		syscall
		
		jr $ra			#jumps to register/the procedure that called it (the return address)
		
		