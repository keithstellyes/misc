# AUTHOR: Keith Stellyes
# WRITTEN: August 26, 2016 (at midnight...)

# This targets MARS implementation and may not work on other implementations
.data
	take_a_guess: .asciiz "Make a guess:"
	good_job: .asciiz "Well guessed!"

.text
	#retrieve system time as a seed
	li $v0,30
	syscall
	
	#use the high order time stored in $a1 as the seed arg
	move $a1,$a0

	#set the seed
	li $v0,40
	syscall
	
	#generate number 0-9 (random int syscall generates a number where):
	# 0 <= $v0 <= $a1
	li $a1,10
	li $v0,42
	syscall
	
	#increment the randomly generated number and store in $v1
	add $v1,$a0,1
	
loop:	jal print_take_a_guess
	jal read_int
	
	#go back to beginning of loop if user hasn't guessed right,
	#    else, just "fall through" to exit_procedure
	bne $v0,$v1,loop
	
exit_procedure:
	#set syscall to print_string, then set good_job string as arg
	li $v0,4
	la $a0,good_job
	syscall
	
	#exit program
	li $v0,10
	syscall
	
print_take_a_guess:
	li $v0,4
	la $a0,take_a_guess
	syscall
	jr $ra
	
read_int:
	li $v0,5
	syscall
	jr $ra