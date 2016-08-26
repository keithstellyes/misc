#############################################################################
# Project Euler 002                                                         #
# # By considering the terms in the Fibonacci sequence whose values do not  #
#       exceed four million, find the sum of the even-valued terms          #
# MIPS Assembly targeting MARS                                              #
# AUTHOR: Keith Stellyes                                                    #
# WRITTEN: August 25, 2016                                                  #
# Every 3rd fibonacci number is even, so we don't have to test for each     #
#     value being even by division, which is slow.                          #
#############################################################################

.text
# $a0 is used as fib() arg
# $t0 is the index counter
# $v0 is the return from fib()
# $v1 is the sum
# $a1,$a2 are used as a,b for fib()'s logic
# $a3 is just a temp variable for the swap part of fibonacci
main:
	#Load inital index of 3
	li $t0,3
	main_loop:
		#Copy index into $a0 so it can be worked with by fib()
		move $a0,$t0
		
		#call fib() return will be at $v0
		jal fib
		
		#sum += return of fib
		#$v1+=$v0
		add $v1,$v1,$v0
		
		#up our index by 3
		add $t0,$t0,3
		
		#If sum < 4 million, go back to start of loop
		blt $v1,4000000,main_loop

print:	#Copy final sum as print arg
	move $a0,$v1
	
	# Print the result
	li $v0,1
	syscall
	
	#Exit cleanly.
exit:	li $v0,10
	syscall

fib:
	#set a,b
	li $a1,1
	li $a2,1
	
	fib_loop_begin:	
		#check for counter being done
		beq $a0,2,fib_exit
	
		#swap and add
		move $a3,$a1
		add $a1,$a1,$a2
		move $a2,$a3
		
		#decrement counter
		sub $a0,$a0,1
		
		#back to start of loop
		j fib_loop_begin
	fib_exit:
		move $v0,$a1
		#For a slight performacne boost, instead of jr $ra, we can do the following:
		#   -add the label fib_return: to the left of add $v1,$v1,$v0
		#   -replace jr $ra with j fib_return
		#I chose not to for readability reasons.
		jr $ra
