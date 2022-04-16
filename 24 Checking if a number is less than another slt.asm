.data
	message:	.asciiz "The number is less than the other."
.text
	main:
	addi $t0, $zero, 1
	addi $t1, $zero, 200
	
	slt $s0, $t0, $t1		#set less than - store 1 in $s0 if $t0 is less than $t1 or store 0 if not
	bne $s0, $zero, printMessage
	
	#Tell the system this end of program
	li $v0, 10
	syscall
	
	printMessage:
		li $v0, 4
		la $a0, message
		syscall
		
	