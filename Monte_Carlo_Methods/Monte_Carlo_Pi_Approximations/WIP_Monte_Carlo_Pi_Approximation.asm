# Goal: Generate an approximation for pi using Monte Carlo integration
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
Iterations: .asciiz "\nNumber of iterations: \n"
Dashes: .asciiz "---------------------------------"
PiValue: .asciiz "\nApproximated pi value: "
#Floats - MARS does not have a direct li.s facility
One: .float 1.0
Four: .float 4.0


.text

# Accept user input for iteration count
IterationCount:
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
	add.s $f12, $f12, $f2 #Add 1 to final (1.0  already in $f2)
	j IterationTest
	
FinalResult:
	#Div Running sum by total and multiply by 4
	mtc1 $s1, $f2 #Convert itaration count to float; store in f2
	div.s $f12, $f12, $f2 #Divide running sum by iteration count
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
# floats
# Floats increment by 2 in MIPS ASM to accommodate doubles
# $f0: I
# $f2: x per iteration
# $f4: y per iteration
# $f12: O
