.data 
	message:	.asciiz "The numbers are equal."
	message1:	.asciiz "The numbers are not equal."
	message2:	.asciiz "\nCongratulations"
.text

	main:
		addi $t0, $zero, 5
		addi $t1, $zero, 8
		
		beq $t0, $t1, numbersEqual
		bne $t0, $t1, numbersNotEqual
		
		b unconditionalBranch
		
		#End program
		li $v0, 10
		syscall
	numbersEqual:
		li $v0, 4 
		la $a0, message
		syscall
	
	numbersNotEqual:
		li $v0, 4 
		la $a0, message1
		syscall
		
	unconditionalBranch:
		li $v0, 4 
		la $a0, message2
		syscall
			
