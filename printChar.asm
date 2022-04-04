	.data
		prompt: .asciiz "Enter your age: "
		message: .asciiz "\nYour age is "
	
	.text
	#Prompt the user to enter age.
	li $v0, 4		#To accept string input from the user
	la $a0, prompt		#argument register
	syscall
	
	#Get users age
	li $v0, 5		#To accept integer input from the user
	syscall
	
	#to store the result while the user enters
	move $t0, $v0
	
	#display the message
	li $v0, 4			#code to display text
	la $a0, message			#to load arguments
	syscall
	
	#Print or show the age
	li $v0, 1			#code to print integers
	move $a0, $t0			#move age number to agument to print
	syscall
	
