# AUTHOR: Keith Stellyes
# WRITTEN: August 27, 2016
# This is just a simple echo example.
# It requests input, then repeats it.

# This also demonstrates allocation of memory

.text
	li $a0,400   #allocate 400 bytes (100 chars)
	li $v0,9     #set syscall to allocate memory
	syscall
	
	
	la $a0,($v0) #set the target address for the read string 
	li $a1,100   #set max number of chars to read 
	li $v0,8     #set syscall to read string
	syscall
	
	li $v0,4     #set syscall to print string
	syscall
	
exit:	li $v0,10    #exit cleanly with EXIT_SUCCESS
	syscall
	