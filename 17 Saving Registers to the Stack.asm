.data
	newLine: .asciiz "\n"
.text

	main:
		addi $s0, $zero, 10
		
		jal increaseMyRegister		#this function only uses a copy of the original value
		
		#print a newline
		li $v0, 4 		#display the text on screen
		la $a0, newLine
		syscall
		
		#print old value
		li $v0, 1
		move $a0, $s0		#note that the value printed here does not change
		syscall
		
		#Tell the system that the program is done/ stops the program
		li $v0, 10
		syscall
	
	increaseMyRegister:
		#store value into memory
		addi $sp, $sp, -4		#Allocate a memory space of 4 bytes on the stack
		sw   $s0, 0($sp)		#Store the number in s0 in the first 4 bytes of the allocated space 0($sp)
		
		addi $s0, $s0, 30
		
		#Print new value in function
		li $v0, 1
		move $a0, $s0
		syscall
		
		#load value from memory
		lw $s0, 0($sp)			#retrieve the value from stack
		addi $sp, $sp, 4		#free the allocated memory
		
		jr $ra
		