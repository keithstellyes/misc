#############################################################################
# Project Euler 001                                                         #
# # The sum of all multiples of 3 and 5 less than 1000                      #
# MIPS Assembly targeting MARS                                              #
# By Keith Stellyes                                                         #
# August 25, 2016                                                           #
# I give a very in-depth explanation in the Java implementation's comments. #
#############################################################################


.text
	li $a0,999
	# compute arithmetic series of 3,..<1000
	# and save result in $a1
	div $a1,$a0,3
	add $a2,$a1,1
	mul $a1,$a1,$a2
	mul $a1,$a1,3
	div $a1,$a1,2
	
	# compute arithmetic series of 3,..<1000
	# and save result in $a2
	div $a2,$a0,5
	add $a3,$a2,1
	mul $a2,$a2,$a3
	mul $a2,$a2,5
	div $a2,$a2,2
	
	#add the two series, freeing up $a2 for final series
	add $a1,$a1,$a2
	
	div $a2,$a0,15
	add $a3,$a2,1
	mul $a2,$a2,$a3
	mul $a2,$a2,15
	div $a2,$a2,2	
	
	#subtract the 15's series
	sub $a0,$a1,$a2
	
	# Set the system call to print the final integer
	li $v0,1
	syscall
	
	#set system call to cleanly exit (i.e. signal everything went a-ok)
	li $v0,10 
	syscall 
