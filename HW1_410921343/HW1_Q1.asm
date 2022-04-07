	.data 
    		n:.asciiz "Enter a number:\n"
    		io1error: .asciiz "The number you entered is either less than 1. Try again."
    		io2error: .asciiz "The number you entered is greater than 40. Try again."
    		spc: .asciiz " "
	.text
		main:
			# prompt for a fibonacci number n
			li $v0, 4
        		la $a0, n
        		syscall
        	
        		#save user input of type integer to $v0
        		li $v0, 5			
        		syscall
        	
        		#assign user value to argument1 ($a1) and maximum value to $a2
        		add $t1, $zero, $v0
        		addi $t2, $zero, 40
        	
        		# if $t1 is less than zero, save 0 to $s0 else save 1
        		slt $s0, $zero, $t1
        		beq $s0, $zero, err1
        	
        		# if $t1 is greater than 40, save 0 to $s0 else save 1
        		sge $s0, $t2, $t1
        		beq $s0, $zero, err2
        	
        		move $a1 $t1
        	
        		subi $a1, $a1, 4
        	
        		jal fib
        	
       		fib:
       			move $t3, $a1
       			li $t0,0 #previous
        		li $t1, 1 #Current
        		li $t2, 0 #Next

        		move $a0, $t0
        		li $v0, 1
        		syscall
        		li $v0,4
        		la $a0,spc
        		syscall

        		move $a0,$t1
       			li $v0,1
        		syscall
        		loop:
        		add $t2,$t1,$t0			#add previous value $t0 to current value $t1 and save it to $t2

        		li $v0,4
        		la $a0,spc
        		syscall

        		move $a0,$t2
        		li $v0,1
        		syscall

        		move $t0,$t1
        		move $t1,$t2

        		slt $t5,$t4,$t3
        		beq $t5,$zero,end

        		addi $t4,$t4,1

        		j loop
        
        	err1:
        		li $v0, 4
        		la $a0, io1error
        		syscall
        	
        		jal end
        	err2:
        		li $v0, 4
        		la $a0, io2error
        		syscall
        	
        		jal end
        	end:
       			li $v0, 10
        		syscall