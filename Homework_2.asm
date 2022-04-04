.data 
N:.asciiz "Enter N upto Loop:\n"
Space:.asciiz " "
.text
main:
li $v0,4
la $a0,N
syscall

li $v0,5			#user input code
syscall

move $t3, $v0

li $t0,0 #previous
li $t1, 1 #Current
li $t2, 0 #Next

move $a0, $t0
li $v0, 1
syscall
li $v0,4
la $a0,Space
syscall

move $a0,$t1
li $v0,1
syscall
loop:
add $t2,$t1,$t0			#add previous value $t0 to current value $t1 and save it to $t2

li $v0,4
la $a0,Space
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
end:
li $v0,10
syscall








