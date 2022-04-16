.data
	myArray:	.space 12		#can store upto 3 integers
	newLine:	.asciiz "\n"
.text
	main:
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $s2, $zero, 12
	
	#Index = $t0
	addi $t0, $zero, 0
	sw $s0, myArray($t0)
	
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
	#Clear $t0 to 0
	addi $t0, $zero, 0
	
	while:
		beq $t0, 12, exit		#branch if the index (array index) is equal to 12
		
		lw $t6, myArray($t0)		#load the first array index t0 to t6
		
		addi $t0, $t0, 4		#add 4 every time we loop to our offset so to terminate the program
		
		#Prints current number
		li $v0, 1
		move $a0, $t6
		syscall
		
		#Prints a new line
		li $v0, 4
		la $a0, newLine
		syscall
		
		j while
	exit:
		#End of program
		li $v0, 10
		syscall
		