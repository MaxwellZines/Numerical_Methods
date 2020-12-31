# Goal: Demonstrate Booth's Algorithm
#
# Written by Maxwell Zines
# Written 29/12/2020
# Revision No. 1.0.0
#
#    This code demonstrates Booth's Algorithm. The user is asked to
# input two numbers, which are read in as ascii and converted to binary.
# The program formats the output of the program aling each step. 
# ----------------------------------------------------------------------


.data
promptOne: .asciiz "\nFirst number: \n"
promptTwo: .asciiz "\nSecond number: \n"
digitbuffer: .space 20
errorMessage: .asciiz "\nERROR: at least one of your inputs is invalid. "
Dashes: .asciiz "---------------------------------"
NLChar: .asciiz "\n"
SChar: .asciiz "  "
XChar: .asciiz "x "
expectedValue: .asciiz "\nExpected value:                                   "
returnedValue: .asciiz "\nReturned value: "

.text

#STEP 1: ACCEPT USER INPUTS AND CONVERT THEM TO APPROPRIATE FORMT:

UserInputOne:
#Accept user input 1:
	la $a0, promptOne
  	li $v0, 4 #print
  	syscall

  	li $v0, 8 #load string
  	la $a0, digitbuffer
  	li $a1, 12
  	syscall
  	
  	j ASCIIChecks

#Interpret user input:
ASCIIChecks:
	lb $t1, ($a0)	
	beq $t1, $0, AssignValue # Null terminator indicates end of string
	beq $t1, 10, AssignValue # Newline indicates end of string
	beq $t1, 45, NegativeCase # Negative bar - indicates negative value
	blt $t1, 48, ErrorHandler # n < 0
 	bgt $t1, 57, ErrorHandler # n > 9
	j ASCIIArithmetic
	
ASCIIArithmetic:
	sub $t1, $t1, 48 # Find true value
	mul $t0, $t0, 10 # Prepare for char by shifting all current chars to the right by multiplying 10^n.
	add $t0, $t0, $t1 # Put t1 in the running sum
	addi $a0, $a0, 1 # Read next character in a0
	j ASCIIChecks

NegativeCase:
	li $t9, 1 # Set negative flag
	addi $a0, $a0, 1 # Read next character in a0
	j ASCIIChecks

AssignValue:
	beq $t2, 1, AssignValueTwo # Check value two flag
	beq $t9, 1, AssignNegativeValue  # Check negative flag
	move $s1, $t0 # Put UI1 in s1
	li $t0, 0 #Reset t0
	j UserInputTwo
	
AssignNegativeValue:	
	mul $s1, $t0, -1 # Put inverse of unsigned UI1 in S1
	mul $t9, $t9, 0 # Reset t9 negative flag
	j UserInputTwo
	
AssignValueTwo:
	beq $t9, 1, AssignNegativeValueTwo 
	move $s2, $t0 # Put UI2 in s2
	j IntermediatePrint
	
AssignNegativeValueTwo:
	mul $s2, $t0, -1 # Put inverse of unsigned UI2 in S2
	j IntermediatePrint

UserInputTwo:
#Accept user input 2:
	addi $t2, $t2, 1 #Set secong number flag
	mul $t0, $t0, 0 #
	
	la $a0, promptTwo
  	li $v0, 4 #print
  	syscall

  	li $v0, 8 #load string
  	la $a0, digitbuffer
  	li $a1, 12
  	syscall
  	
  	j ASCIIChecks


#STEP 2: Print the user values as specified:
#
#    UI1
#  x UI2
#  -----

IntermediatePrint:

	la $a0, SChar #Print a few spaces
	li $v0, 4
	syscall
	add $a0, $s1, $zero # Print UI1
	li $v0, 35 # In binary
	syscall
	la $a0, NLChar #Print a few spaces
	li $v0, 4
	syscall
	
	la $a0, XChar # Print Multiplication symbol
	li $v0, 4
	syscall
	add $a0, $s2, $zero # Print U2
	li $v0, 35 # In binary
	syscall
	la $a0, NLChar # New line
	li $v0, 4
	syscall
	
	la $a0, Dashes #Print the dashes
	li $v0, 4
	syscall
	la $a0, NLChar #Print a few spaces
	li $v0, 4
	syscall
	syscall #2 lines
	
	j Booth
	
# STEP 3: BOOTH'S ALGORITHM ITERATION

Booth:
	li $t0, 0 # Clear values from Step 1
	li $t1, 0
	li $t2, 0
	li $t9, 0

	add $t1, $s2, $zero # Put UI2 in t1; lower 32 bits
	sll $t2, $s2, 31 #Transferring LSB and hidden bit of s2 to t2, along with next step
	srl $t2, $t2, 30 # Determine LSB of UI2
	
	li $t8, 0 # Create a loop counter
	
	j ValueTest
	
ValueTest:
	beq $t8, 32, FinalPrint #Exit on 32 iterations
	beq $t2, 0, Shift # 00 bit case
	beq $t2, 1, Add # 01 bit case
	beq $t2, 2, Subtract # 10 bit case
	beq $t2, 3, Shift # 11 bit case

   
Shift:
	srl $t1, $t1, 1 # Neccesary for next step
	sll $t3, $t0, 31 # Record LSB of top 32
	or $t1, $t3, $t1 # OR the LSB into the bottom 32
	sra $t0, $t0, 1 # Shift upper 32, arithmetic quantifier preserves sign.

	sll $t4, $t1, 31 # Similar process as above, this time for determining lower 32
	srl $t4, $t4, 30 
	sra $t2, $t2, 1 
	or $t2, $t2, $t4 
	
	addi $t8, $t8, 1 # Add one to step counter
	
	# Print current iteration: 
	add $a0, $t0, $zero # Print top 32
	li $v0, 35 
	syscall
	
	la $a0, SChar #Print a few spaces
	li $v0, 4
	syscall
	
	add $a0, $t1, $zero #Print bottom 32
	li $v0, 35 
	syscall
	
	la $a0, NLChar #Print new line
	li $v0, 4
	syscall
	
	j ValueTest

Add:
	addu $t0, $t0, $s1 # Add S1 bit (UI1) into t0
	j Shift

Subtract:
	sub $t0, $t0, $s1 # Sub S1 bit (UI1) to t0
	j Shift

FinalPrint:


	la $a0, expectedValue # Prints everything once more
	li $v0, 4
	syscall
	mul $s4, $s1, $s2
	add $a0, $s4, $zero
	li $v0, 35
	syscall
	
	la $a0, returnedValue
	li $v0, 4
	syscall
	
	add $a0, $t0, $zero # Print top 32
	li $v0, 35 
	syscall
	
	la $a0, SChar #Print a few spaces
	li $v0, 4
	syscall
	
	add $a0, $t1, $zero #Print bottom 32
	li $v0, 35 
	syscall
	
	la $a0, NLChar #Print new line
	li $v0, 4
	syscall
	
	j Exit
	
ErrorHandler:
	la $a0, errorMessage #Print general error message
	li $v0, 4
	syscall

Exit:
	#Run off
