.data
	PI: .float 3.14		
	
.text
	li $v0 2		#prepare for printing a float
	lwc1  $f12, PI		#load address of PI from ram to load word core processor 1
	syscall			#do it