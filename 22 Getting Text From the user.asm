.data
	message: .asciiz "Hello, "
	userInput: .space 20			#reserves space for 20 characters
.text
	main:
		#Getting user's input as text
		li $v0, 8			#code 8 is for accepting input as text
		la $a0, userInput
		li $a1, 20
		syscall
		
		#Displays hello
		li $v0, 4
		la $a0, message
		syscall
		
		#Display the name
		li $v0, 4
		la $a0, userInput
		syscall
	
	
	#Tell the system this is the end of main
	li $v0, 10
	syscall
	