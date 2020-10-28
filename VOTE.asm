# Class:	CSC225
# Author:	Brooklynn Silva
# Assignment:	 5, #1
# Purpose:	Translate the following Python code into assembly:
# 		age = int(input('How old are you? '))
# 		if age >= 18:
# 		print('Have you registered to vote?')
# Date:		20201026

.text
main:
	# Prompt the user to enter their age
	la $a0, prompt
	jal PromptInt
	
	# Boolean determines if the user age is greater than or equal to 18
		sge $t1, $v0, 18
		beqz $t1, else
	# if boolean is true: ask the user if they have registered to vote	
		la $a0, response
		jal PrintString
		b end
	#else, not old enough to vote
	else:
		la $a0, response2 # added my own twist on the assigment
		jal PrintString
		b end
		
	end:
		jal Exit


.data
	prompt: 	.asciiz "How old are you? "
	response: 	.asciiz "Have you registered to vote?"
	response2: 	.asciiz "You'll be old enough to vote soon enough!"


.include "utils.asm"

	
		
			
	