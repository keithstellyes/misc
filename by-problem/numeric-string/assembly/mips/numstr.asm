##################################
# Test if a string is numeric    #
# AUTHOR: Keith Stellyes         #
# WRITTEN: August 28, 2016       #
# Submitted to Rosetta Code      #
##################################

# Determine if a string is numeric
# This does not check for hexadecimal
# It just goes by an "allowed ascii values" system
# 0th char must be - (ASCII:45) or in the range 0...9 (ASCII:48...57)
#     any chars after must be in the range of 0...9  or a . (ASCII:46)
#         #but if it is a . we must check if the has_period flag is raised.
#              if it is, then return false

# $a0 char val
# $a1 address pointer
# $a2 PERIOD_HIT_FLAG
# $a3 HAS_DIGITS_FLAG

.data 
			### CHANGE THIS STRING TO TEST DIFFERENT ONES... ###
	string: .asciiz "-.1234"  
	s_false: .asciiz "False"
	s_true: .asciiz "True"
.text
main:
	set_up: #test for 0th char == 45 or 46 or 48...57
		la $a1,string
		lb $a0,($a1)
		beq $a0,45,loop # == '-'
		beq $a0,46,loop # == '.'
		blt $a0,48,exit_false # isn't below the ascii range for chars '0'...'9'
		bgt $a0,57,exit_false # isn't above the ascii range for chars '0'...'9'
	loop:
		addi $a1,$a1,1
		lb $a0,($a1)
		beqz $a0,exit_true # test for \0 null char
		beq $a0,46,period_test #test for a duplicate period
		blt $a0,48,exit_false  #test for 
		bgt $a0,57,exit_false
		la $a3,1 #set the HAS_DIGITS flag. This line is only reached because the
			 #    tests for period and - both jump back to start. 
		j loop
	
exit_true:
	beqz $a3,exit_false
	la $a0,s_true
	la $v0,4
	syscall

	li $v0,10
	syscall	

exit_false:
	la $a0,s_false
	la $v0,4
	syscall
	
	li $v0,10
	syscall
	
period_test:
	beq $a2,1,exit_false
	li $a2,1
	j loop

	