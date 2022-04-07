.data
	myCharacter: .byte 'm'
	
.text
	li $v0 4		#prepare for printing
	la $a0, myCharacter	#load address of myCharacter to register $a0
	syscall			#do it