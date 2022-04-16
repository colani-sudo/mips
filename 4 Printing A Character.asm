.data
	myCharacter: .byte 'm'		#a byte needs only 8 bits since its a character
	
.text
	li $v0 4		#prepare for printing
	la $a0, myCharacter	#load address of myCharacter to register $a0
	syscall			#do it