# Goal: Generate an approximation for pi using Monte Carlo integration
#
# Written by Maxwell Zines
# Written 11/01/2020
# Revision No. 1.0.0
#
# This code implements a Monte-Carlo based pi approximation in MIPS ASM.
# --------------------------------------------------------------------------


.data
#Strings
Iterations: .asciiz "\nNumber of iterations: \n"
Dashes: .asciiz "---------------------------------"
PiValue: .asciiz "\nApproximated pi value: "
#Floats - MARS does not have a direct li.s facility
One: .float 1.0
Four: .float 4.0


.text

# Accept user input for iteration count
UserInput:
	la $a0, Iterations
  	li $v0, 4 #print iteration prompt
  	syscall

  	li $v0, 5 #accept integer input
  	syscall
  	move $s0, $v0 # syscall 5 puts input in $f0
  	li $a0, 0 #reset $a0
  	
IterationTest:
	#Break on iteration count complete
	beq $s0, $s1, FinalResult
	addi $s1, $s1, 1 #Iteration count ++

RandomNumberGenerator:
	#RNG x
	li $v0, 43 #syscall 43 generates random float
  	syscall
  	mov.s $f2, $f0 # Move x to f2
  	#RNG y
  	syscall
  	mov.s $f4, $f0 # Move y to f4
  
Square:
	mul.s $f2, $f2, $f2 #x^2
	mul.s $f4, $f4, $f4 #y^2
	add.s $f4, $f2, $f4 #x^2+y^2
	l.s $f2, One
	c.lt.s $f4, $f2
	bc1f IterationTest #Jump if f(x,y) not in circle

ItIncrement:
	addi $s2, $s2, 1 #Add 1 to final
	j IterationTest
	
FinalResult:
	#Div Running sum by total and multiply by 4
	mtc1 $s0, $f0 #Convert iteration count to float; store in f0
	mtc1 $s2, $f2 #Convert running sum to float; store in f2
	div.s $f12, $f2, $f0 #Divide running sum by iteration count
	l.s $f2, Four
	mul.s $f12, $f12, $f2 #Multiply result by 4 (algorithm converges to pi/4)
	
	#Print output
	la $a0, Dashes
  	li $v0, 4 #print string
  	syscall
  	la $a0, PiValue
  	syscall
  	li $v0, 2
  	syscall

# --------------------------------------------------------------------------
# REGISTER LIST:
# saved temporaries
# $s0: Desired iteration count
# $s1: iteration count (comparator)
# $s2: Running sum count
# floats
# Floats increment by 2 in MIPS ASM to accommodate doubles
# $f0: I, iteration count
# $f2: x per iteration, running sum
# $f4: y per iteration
# $f12: O (standard)
