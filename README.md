# Numerical Methods
I am building this repository as free, open-source reference material for students taking an undergraduate-level introductory Numerical Analysis course. Because it is intended as reference material instead of serious scientific comuting, many of the processes (iterating, input-gathering...) are written to emphasize clarity over computing cost or efficiency. I have tried to include as many comments as possible without "getting in the way" or "breaking the flow" of the actual code.

The following folders are included in this repository:

## CS Preliminary

A collection of programs that demonstrate how computers store numbers and detect/correct errors in transmitted data. It is important to understand how floating-point numbers are represented in computer memory because this knowledge can provide insight into the cause of rounding errors and so-called 'catastrophic cancellation'. 
  - MATLAB
    - Forward Error Correction by parity checking
      - Show how a FEC scheme called 'parity checking' can detect and correct errors in transmitted data

## ODEs

A collection numerical solutions of Ordinary Differential Equations (ODEs) 
  - MATLAB
    - Euler (RK1) method
      - Demonstrate the Euler / Runge-Kutta order 1 method, and plot the calculated result against the symbolic solution of the ODE-IVP.

## Root Finding

  A suite for root-finding algorithms
  - MATLAB 
    - Bisection Method
      - Demonstrate the bisection method of root finding, and discuss how the algorithm depends on results of the Intermediate-Value Theorem.
    - Secant Method
      - Demonstrate the secant method of root finding
      - A thought: the secant method is functionally very similar to Newton's method, but it uses the secant instead of the analytical derivative. You could modify this code to run as Newton's method instead. Perhaps with a clever use of the *syms* and *diff()* functions...
    
## Numerical Integration

  A suite for numerical integration schemes
  - MATLAB
    - Uniform Trapezoid Method
      - Demonstrate the uniform trapezoid method of numerical integration
