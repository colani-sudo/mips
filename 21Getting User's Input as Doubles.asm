.data
	prompt:		.asciiz "Enter the value of e: "
.text
	#Display message to the user
	li $v0, 4
	la $a0, prompt
	syscall
	
	#Get the double from the user
	li $v0, 7			#code 7 is for reading double from the user
	syscall
	
	#Display the user's input
	li $v0, 3			#code 3 is for printing doubles
	add.d $f12, $f0, $f10		#f0 is for the exact value and f10 is for the appending 0.0
	syscall
	