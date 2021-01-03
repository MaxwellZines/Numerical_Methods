# -*- coding: utf-8 -*-
"""
Goal: Create a basic implementation of Monte Carlo pi approximation that 
includes a matplotlib plot of the region and RNG points.

Written by Maxwell Zines
Written 03/01/2021
Revision No. 1.0.0

    This code is a demonstration of one particular Monte Carlo pi approximator.
Two random numbers, x and y, are generated on x,y ∈ (-1,1). A running sum
keeps count of the number of points within the circle against the number of 
points total. Convergence to pi/4 is expected, and the final result is 
multiplied by 4 to produce a result that is expected to converge to pi.
    This code uses the following extensions: random.
"""

from random import random

n = input("Number of iterations: ");
n = int(n)

def f(x,y):
    return (x*x)+(y*y)

runningSum = 0

for i in range (n):
    x = random()
    y = random()
    
    negativeFlag = random()
    if negativeFlag <= .250:
        x = x
        y = y
    elif negativeFlag <= .500:
        x = x * -1
    elif negativeFlag <= .750:
        y = y * -1
    else:
        x = x * -1
        y = y * -1
    
    if (f(x,y) <= 1):
        runningSum += 1

piApprox = 4 * (runningSum / n)

print("--------")
print("Approximation: ", piApprox, " after ", n, " iterations.")