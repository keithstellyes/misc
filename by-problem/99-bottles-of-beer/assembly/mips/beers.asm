##################################
# 99 bottles of beer on the wall #
# By Keith Stellyes :)           #
# August 24, 2016                #
# Submitted to Rosetta Code      #
##################################

#It is simple, a loop that goes as follows:

#if accumulator is not 1:
#PRINT INTEGER: accumulator
#PRINT lyrica
#PRINT INTEGER: accumulator
#PRINT lyricb
#PRINT INTEGER: accumulator
#PRINT lyricc
#DECREMENT accumulator

#else:
#PRINT FINAL LYRICS

.data
	lyrica: .asciiz " bottles of beer on the wall, "
	lyricb: " bottles of beer.\nTake one down and pass it around, "
	lyricc: " bottles of beer on the wall. \n\n"
	
	#normally, I don't like going past 80 columns, but that was done here.
	# there's an argument to be had for breaking this up. I chose not to 
	# for simpler instructions.
	final_lyrics: "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."

.text	
	#lw $a0,accumulator #load address of accumulator into $a0 (or is it getting val?)
	li $a1,99 #set the inital value of the counter to 99
	
loop:	
	###99
	li $v0, 1 #specify print integer system service
	move $a0,$a1
	syscall #print that integer
	
	### bottles of beer on the wall,
	la $a0,lyrica
	li $v0,4
	syscall
	
	###99
	li $v0, 1 #specify print integer system service
	move $a0,$a1
	syscall #print that integer	
	
	### bottles of beer.\n Take one down and pass it around,
	la $a0,lyricb
	li $v0,4
	syscall
	
	###99
	li $v0, 1 #specify print integer system service
	move $a0,$a1
	syscall #print that integer
	
	### "bottles of beer on the wall. \n\n"
	la $a0,lyricc
	li $v0,4
	syscall
	
	#decrement counter, if at 1, print the final and exit.
	subi $a1,$a1,1
	bne $a1,1,loop

### PRINT FINAL LYRIC, THEN TERMINATE.
final:  la $a0,final_lyrics
	li $v0,4
	syscall

	li $v0,10
	syscall
