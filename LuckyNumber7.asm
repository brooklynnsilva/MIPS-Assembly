# Class:	CSC225
# Author:	Brooklynn Silva
# Date:		20201026
# Assignment:	5, #2
# Purpose:	Translate the following Python code into assembly:
#		number = int(input('Guess a number from 1-10: '))
#		if number < 7:
#		print('Too low.')
#		elif number > 7:
#		print('Too high.')
#		else:
#		print('You guessed it!')


.text
main:
	# Prompt the user to enter a number between 1 and 10
	la $a0, prompt
	jal PromptInt
	
	# if block
		slti $t1, $v0, 1
		sgt $t2, $v0, 10
		or $t1, $t1, $t2
		# if the number is valid, move on to the if statement
		beqz $t1, too_low 
		# invalid input block -- added my own invalid input response
		la $a0, invalid
		jal PrintString
		b end_if
	# if the number is lower than 7
	too_low:
		slti  $t1, $v0, 7
		# if the number is not less than 7, move on to the elseif statement
		beqz $t1, too_high  
		la $a0, low
		jal PrintString
		b end_if
	# if the number is higher than 7 -- elseif
	too_high:
		sgt $t1, $v0, 7
		beqz $t1, correct
		la $a0, high
		jal PrintString
		b end_if
	# if the user guesses 7 -- else
	correct:
		la $a0, seven
		jal PrintString
		b end_if
	# exit the program when the statement ends
	end_if:
		jal Exit
	

.data
	prompt: 	.asciiz "Guess a number from 1-10: "
	low:		.asciiz "Too low!"
	high:		.asciiz "Too high!"
	seven:		.asciiz "You guessed it!"
	invalid:	.asciiz "That number is out of range."

.include "utils.asm"