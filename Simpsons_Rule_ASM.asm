# Goal: Implement some Simpson's rules in ASM
#
# Written by Maxwell Zines
# Written 06/01/2020
# Revision No. 1.0.0
#
#    This code implements some Simpson's rules in MIPS ASM. Due to the
# simplicity of implementing an x^2 function in mips, this is the function
# I have chosed but this can be changed with effort.
# --------------------------------------------------------------------------


.data
#Strings
LBprompt: .asciiz "\nLower bound: \n"
UBprompt: .asciiz "\nSecond number: \n"
Dashes: .asciiz "---------------------------------\n"
OneThirdVal: .asciiz "\nSimpson's 1/3 rule calculated value: "
returnedValue: .asciiz "\nReturned value: "
#Floats - MARS does not have a direct li.s facility
Two: .float 2.0 
Three: .float 3.0
Four: .float 4.0


.text

# Accept user input for lower bound
LowerBound:
	la $a0, LBprompt
  	li $v0, 4 #print string
  	syscall

  	li $v0, 6 #accept float input
  	syscall
  	mov.s $f2, $f0 # syscall 6 puts input in $f0

# Accept user input for upper bound
UpperBound:
	la $a0, UBprompt
  	li $v0, 4 #print string
  	syscall
  	
  	li $v0, 6 #accept float input
  	syscall
  	mov.s $f4, $f0 # syscall 6 puts input in $f0
  	
  	la $a0, Dashes
  	li $v0, 4 #print Dashes to separate I/O
  	syscall
  	
# Simpsons 1/3 rule, x^2
# S(f(x)) = h/3(f(a)+4f(a+h)+f(b))
# --------------------------------------------------------------------------
StepSizeCalc:
	l.s $f30, Two #Load the divisor
	sub.s $f6, $f4, $f2 #(b-a)
	div.s $f6, $f6, $f30 # (b-a)/2
	# We will store this in a different reguster to make use of the (b-a)
	# value for the 1/3 calculation.
	
CalculateValues:
	mul.s $f8, $f2, $f2 #a^2
	add.s $f10, $f2, $f6 #a+h
	mul.s $f10, $f10, $f10 #(a+h)^2
	l.s $f30, Four
	mul.s $f10, $f10, $f30 #f(a+h)*4
	mul.s $f12, $f4, $f4 #b^2
	
FinalValue:
	add.s $f14, $f8, $f10 #a^2 + 4(a+h)^2
	add.s $f14, $f14, $f12# += b^2
	l.s $f30, Three
	div.s $f16, $f6, $f30 #h/3
	mul.s $f12, $f14, $f16 #Multiply into $f12, standard float out in MIPS 
	
	la $a0, OneThirdVal
  	li $v0, 4 #print string
  	syscall
	
  	li $v0, 2
  	syscall
  	
# Register list:
# --------------------------------------------------------------------------
# $f2: lower bound (a)
# $f4: upper bound (b)
# $f6: (b-a) 
# $f8: f(a) = a^2
# $f10: f(a+h) = (a+h)^2
# $f12: f(b) = b^2 / Standard output for MIPS
# $f14: final values (to F12)
# $f16: (h/n) bias
# $f30: float value