#################################
# Fizz Buzz                     #
# MIPS Assembly targetings MARS #
# By Keith Stellyes             #
# August 24, 2016               #
#################################

# $a0 left alone for printing strings :)
# $a1 stores our counter
# $a2 is 1 if not evenly divisible

.data
	fizz: .asciiz "Fizz\n"
	buzz: .asciiz "Buzz\n"
	fizzbuzz: .asciiz "FizzBuzz\n"
	newline: .asciiz "\n"

.text
loop:
	beq $a1,100,exit
	add $a1,$a1,1
	
	#test for counter mod 15 ("FIZZBUZZ")
	div $a2,$a1,15
	mfhi $a2
	bnez $a2,loop_not_fb #jump past the fizzbuzz print logic if NOT MOD 15
	
#### PRINT FIZZBUZZ: ####
	li $v0,4 #set syscall arg to PRINT_STRING
	la $a0,fizzbuzz #set the PRINT_STRING arg to fizzbuzz
	syscall #call PRINT_STRING
	j loop #return to start
#### END PRINT FIZZBUZZ ####
	
loop_not_fb:	
	div $a2,$a1,3 #divide $a1 (our counter) by 3 and store remainder in HI
	mfhi $a2 #retrieve remainder (result of MOD)
	bnez $a2, loop_not_f #jump past the fizz print logic if NOT MOD 3
	
#### PRINT FIZZ ####
	li $v0,4 
	la $a0,fizz
	syscall
	j loop
#### END PRINT FIZZ ####

loop_not_f:
	div $a2,$a1,5
	mfhi $a2
	bnez $a2,loop_not_b

#### PRINT BUZZ ####
	li $v0,4 
	la $a0,buzz
	syscall
	j loop
#### END PRINT BUZZ ####

loop_not_b:
	#### PRINT THE INTEGER ####
	li $v0,1 #set syscall arg to PRINT_INTEGER
	move $a0,$a1 #set PRINT_INTEGER arg to contents of $a1
	syscall #call PRINT_INTEGER
	
	### PRINT THE NEWLINE CHAR ###
	li $v0,4 #set syscall arg to PRINT_STRING
	la $a0,newline
	syscall
	
	j loop #return to beginning

exit:
	li $v0,10
	syscall
