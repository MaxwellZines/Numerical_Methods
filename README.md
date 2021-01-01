# Numerical Methods

Maxwell Zines and Elias Martin

We are building this repository as free, open-source reference material for students taking an undergraduate-level introductory Numerical Analysis course. Because it is intended as reference material instead of serious scientific computing, many of the processes (iterating, input-gathering...) are written to emphasize clarity over computing cost or efficiency. We have tried to include as many comments as possible without "getting in the way" or "breaking the flow" of the actual code. **We highly encourage any curious individual to mess around with the code - break it, test it, build it better, fork it!**

Also remember that this introductory code base is exactly that: *introductory*. There are many fantastic resources online that go into elaborate detail about each of these algorithms, including proofs of convergence speed. You should absolutely seek further knowledge into each of these topics, including information about conditions under which each may fail to converge on an answer. Numerical Analysis can be a very technical subject - technicalities and formalities have their place, but we have tried to avoid it here wherever possible.

The following folders are included in this repository:

----

### CS Preliminary

A collection of programs that demonstrate how computers store numbers and detect/correct errors in transmitted data. It is important to understand how floating-point numbers are represented in computer memory because this knowledge can provide insight into the cause of rounding errors and so-called 'catastrophic cancellation'. 
  - ECC_FEC
    - Forward Error Correction by parity checking
      - Show how a FEC scheme called 'parity checking' can detect and correct errors in transmitted data
  - Binary Multiplication
    - Booth's Algorithm
      - Demonstrate Booth's Algorithm of binary multiplication, including printing the result at each iteration to show how values are shifted.

### ODEs

A collection numerical solutions of Ordinary Differential Equations (ODEs) 
  - Runge_Kutta_Methods
    - Euler (RK1) method
      - Demonstrate the Euler / Runge-Kutta order 1 method, and plot the calculated result against the symbolic solution of the ODE-IVP.

### Root Finding

  A suite for root-finding algorithms
  - Bisection 
    - Bisection Method
      - Demonstrate the bisection method of root finding, and discuss how the algorithm depends on results of the Intermediate-Value Theorem.
  - Newton_and_Secant_Methods
    - Secant Method
      - Demonstrate the secant method of root finding
      - A thought: the secant method is functionally very similar to Newton's method, but it uses the secant instead of the analytical derivative. You could modify this code to run as Newton's method instead. Perhaps with a clever use of the *syms* and *diff()* functions...
    
### Numerical Integration

  A suite for numerical integration schemes
  - Trapezoid_Methods
    - Uniform Trapezoid Method
      - Demonstrate the uniform trapezoid method of numerical integration
  - Simpsons_Rules
    - Simpson's Rules
      - Demonstrate Simpson's 1/3, 3/8, and 1/3 composite rules.
  - Riemann Sums
    - Riemann's LP, RP, and MP rules
      - Calculate left-point, right-point, and mid-point Riemann sums

----

## Works cited

The Kincaid and Cheney text on Numerical Computing was the main reference source for this repository. It would serve as an excellent companion to the code presented here. It is cited formally as:

Cheney, Ward, and David Kincaid. *Numerical Mathematics and Computing*. 7th ed., Brooks/Cole, 2008. 

Furthermore, we have used algorithms or ideas from the following books (and they are cited in the comment of the respective code where appropriate):

Constanda, Christian. *Differential Equations: A Primer for Scientists and Engineers*. 2nd ed., Springer, 2017.
  - An excellent development of Euler's Method of ODE-IVPs
  
Beltrami, Edward. *Mathematics for Dynamic Modelling*. 2nd ed., Academic Press, 1998.
  - Used to derive many of the "real-world examples" presented in this repository.
