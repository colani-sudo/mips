		##int fib(int n){		# n in through $a0
		##	if(n<= 1)
		##		return n;
		##	else
		##		return fib(n-1) + fib(n-2);
		##}
		.data 
			fibonacci:.asciiz "Enter a fibonacci number\n"
			comma:.asciiz ","
			ok : .asciiz "All good"
		.text
		
		main:
			li 	$v0, 4		#Prompt the user to enter a number
			la 	$a0, fibonacci	#argument register
			syscall
			
			li 	$v0,5		#capture fibonacci argument number from keyboard
			la	$a0, ($v0)
			move	$t2, $a0	#save the $a0 in $t2
			syscall
			
			#validate input
			#jal	validate
			addi 	$t0, $zero, 0
			addi	$t1, $zero, 40
			
			blt 	$t2, $t0, end
			bgt	$t2, $t1, end
			
			
			#print the first two values
			#jal 	first_values
			
			la 	$t1, fib
			syscall
			#exit program
			jal 	end
			
		fib:	
			move	$s0, $t1	#store captured argument
			#printv#print#print#print#print#print#print
			li 	$v0, 1		#placeholder to print
			lw	$a0, 0($s0)	#load argument to print
			syscall
			#print#print#print#print#print#print#print
			jr 	$ra
			bgt	$v0, $zero, recurse
			jal 	end
			
		recurse:
			sub 	$sp, $sp, -12
			sw	$ra, 0($sp)	#save the return address
			
			sw	$v0, 4($sp)	#save
			add	$a0, $v0, -1	#n-1
			jal	fib
			syscall
			
			lw 	$a0, 4($sp)	#restore
			sw	$v0, 8($sp)	#save return value fib(n-1)
			
			add	$a0, $a0, -2	#n-2
			jal	fib
			
			sw	$t0, 8($sp)	#restore return value fib(n-1)
			add 	$v0, $t0, $v0	#the return value
			#syscall
			
			li $v0, 1			#code to print integers
			move $a0, $t0			#move age number to agument to print
			syscall
			
			lw	$ra, 0($sp)	#restore return address
			add 	$sp, $sp, 12	#return back the stack
			jr	$ra		#return
		
		#validate input
		validate:
			addi 	$t0, $zero, 0
			addi	$t1, $zero, 40
			blt 	$t7, $t0, end
			
			bgt	$t7, $t0, end
			
		#	j	proceed
			j	end
			
		first_values:
			li 	$v0, 1		#placeholder to print
			li	$a0, 0		#load argument to print
			syscall
			
			li 	$v0, 4		#Print comma
			la 	$a0, comma	#argument register
			syscall
			
			li 	$v0, 1		#placeholder to print
			li	$a0, 1		#load argument to print
			syscall
			
			li 	$v0, 4		#Print comma
			la 	$a0, comma	#argument register
			syscall
			
		#proceed: 
		#	li 	$v0, 4		#Print comma
		#	la 	$a0, ok		#argument register
		#	syscall
			
		end:   
			li 	$v0, 10		#exit program
			syscall
			
