.data
	myMessage: .asciiz "Hello MIPS Assembly"
	
.text
	li $v0 4		#prepare for printing
	la $a0, myMessage	#load address of myMessage to register $a0
	syscall			#do it
	