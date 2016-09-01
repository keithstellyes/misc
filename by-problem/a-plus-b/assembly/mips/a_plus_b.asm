##################################
# A+B function                   #
# August 24, 2016                #
# Submitted to Rosetta Code      #
##################################
.data
	in_str: .asciiz "Integer:\n"
.text

# In MIPS Assembly, functions (procedures will work as follows):
# jal LABEL jumps to a label, unlike a normal jump, it stores the
#     return address in $ra. Arguments by convention are stored in $a0-$a3
#     often times, the return is frequently in $v0. $a0-$a3 and $t0-$t9 are 
#     used as arguments and are not preserved across procedural calls.
#     They must be stored in the stack when recursion is required.$sp is used
#     as the stack pointer to allow for recursive calls. This example uses 
#     the stack pointer for demonstration purposes of this, but isn't necessary.
#     Good resource: http://www.cs.nott.ac.uk/~psztxa/g51csa/l10-hand.pdf

main:	jal read_int_procedure
	move $t0,$v0
	jal read_int_procedure
	move $t1,$v0
	jal addition_procedure
	jal print_int
	j exit

addition_procedure:
	#arguments are in $t0 and $t1, returns sum in $a0
	### push a,b onto stack ###
	addi $sp,$sp,-8  #decrease stack pointer
	sw $t0,0($sp) #push a
	sw $t1,4($sp) #push b
	
	add $v0,$a0,$a1
	
	### pop a,b from stack ### 
	lw $t0, 0($sp) # pop a
	lw $t0, 4($sp) # pop b
	addi $sp,$sp,8 #increase stack pointer
	jr $ra

print_int:
	li $v0,1
	syscall
	jr $ra
			
read_int_procedure:
	li $v0,4 #print message
	la $a0,in_str
	syscall
	
	li $v0,5 #store integer
	syscall
	jr $ra #return to origin

exit: 
	li $v0, 10
	syscall
