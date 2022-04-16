.data
	age: .word 23			#a word needs 32bits since its an integer
	
.text
	li $v0 1		#prepare for printing an integer/word
	lw $a0, age	#load address of myMessage to register $a0
	syscall			#do it