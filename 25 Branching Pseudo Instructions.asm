.data 
	message:	.asciiz "Hi, just print"
.text
	main:
		addi $s0, $zero, 10
		addi $s1, $zero, 14
		
		bgt $s0, $s1, display1			#branch if s0 is greater than s1
		blt $s0, $s1, display2			#branch if s0 is less than s1
		bgtz $s0, display2			#branch id s0 is greater than zero
		
	#End program
	li $v0, 10
	syscall
		
	display1:
		li $v0, 4
		la $a0, message
		syscall
	
	display2:
		li $v0, 4
		la $a0, message
		syscall
	