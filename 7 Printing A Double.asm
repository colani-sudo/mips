.data
	myDouble: .double 7.104		#a double is 64 bits so we need two registers to hold it
	zeroDouble: .double 0.0
.text
	ldc1 $f2, myDouble		# we need to load the address from ram to load double core processor 1 
	ldc1  $f0, zeroDouble		#load address of xeroDouble from ram to load double core processor 1
					#use only even number registers for doubles
	
	li 	$v0, 3 			#prepare to print a double
	add.d	$f12, $f2, $f0		#pass the arguments of doubles to be printed to $f12
	syscall				#do it