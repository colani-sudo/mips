.data	
	
.text
	#three ways of doing multiplication in mips
	#mul -takes 3 registers
	#mult -takes 2 registers
	#sll - is not that effecient
	
	addi $s0, $zero, 10
	addi $s1, $zero, 4
	
	mul $t0, $s0, $s1		#t0 = s0 * s1, note that here you can multiply numbers that are 16 bits long only
	
	li $v0, 1			#prepare to print an integer
	add $a0, $zero, $t0		#a0 = xero + t0
	syscall
	