.data
	newLine: .asciiz "\n"
.text
	#$s registers are caller saved, cannot be modified by caller
	#$t registers are callee saved
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
		addi $sp, $sp, -8		#Allocate a memory space of 4 bytes on the stack
		sw   $s0, 0($sp)		#Store the number in s0 in the first 4 bytes of the allocated space 0($sp)
		sw   $ra, 4($sp)		#store the return register for tracking the value on stack
		
		addi $s0, $s0, 30
		
		#Nested procedure
		jal printTheValue
		
		#load value from memory
		lw $s0, 0($sp)			#retrieve the value from stack
		lw $ra, 4($sp)			#retrieve the return address from stack
		addi $sp, $sp, 4		#free the allocated memory
		
		jr $ra
	
	printTheValue:
		#Print new value in function
		li $v0, 1
		move $a0, $s0
		syscall
		
		jr $ra