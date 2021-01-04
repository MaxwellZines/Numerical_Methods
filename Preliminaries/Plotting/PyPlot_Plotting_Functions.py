"""
Goal: Demonstrate various MatPlotLib features for 2D function plots

Written by Maxwell Zines
Written 03/01/2021
Revision No. 1.0.0

    This code is a demonstration of various MatPlotLib features which can
be implemented in a Numerical Analysis script. This script is the first in
a small sub-collection within the Numerical Methods repository. This script
covers 2D plotting, and subsequent scripts will cover 3D-plotting and shading.
"""

# Before we can use the MatPlotLib PyPlot library, we need to import it. We 
# will also import numpy, a library with a number of helpful math functions.
import matplotlib.pyplot as plt
import numpy as np

# Note that you can run through these plottine examples one at a time. To do
# so, put a """ ... """ around each of the sections you DO NOT want pyplot to
# generate. For example, the following three foo-bar lines will not be run:
"""
foo(bar)
FOO(BAR)
plot(bar, foo(bar))
"""

# BASIC SCATTER PLOT:
#-----------------------------------------------------------------------------
# Now that we have imported MatPlotLib, let's start by plotting some points
# on a scatter plot. To do this, we will need to define some points.
x = [0, 1, 2, 3, 4, 5]
y = [0, 1, 4, 9, 16, 25]
# With our points defined, we feed them in to PyPlot.
plt.plot(x, y, 'ro') 
# 'ro' indicates that we want red dots. To connect the points, try 'r-'
# You can also adjust the colour. Try 'bo' and 'b-' to plot data in blue.
plt.axis([0, 6, 0, 30])
plt.title('Plot 1: Plotting Points on a Scatter Plot')
plt.show()

# TWO FUNCTION PLOT:
#-----------------------------------------------------------------------------
# First, let's define two functions to plot
def f(x):
    return np.sin(x)
def g(x):
    return 2 * np.cos(x)
# Now, without defining a range or sample interval, let's see how it handles
# these functions:
plt.plot(x, f(x), 'ro', x, g(x), 'g^') 
plt.title('Plot 2: f(x) = sin(x) and g(x) = 2cos(x), no defined interval')
plt.show()
# On the previous plot, the points are too sparse to give a good view of the
# behaviour of each function. Let's define a better interval and increase our
# sample density significantly. In this case, lets look at the function on 
# [0, 2π] with 100 subintervals.
x = np.arange(0., 2 * np.pi, np.pi / 100)
plt.plot(x, f(x), 'r-', x, g(x), 'g-')
plt.title('Plot 3: f(x) = sin(x) and g(x) = 2cos(x), interval [0, 2π]')
plt.show()

# CATEGORICAL PLOT
#-----------------------------------------------------------------------------
# A bar chart could be useful for comparing relative error. Let's start by
# defining some random error values for RK methods of ODE-IVPs:
errors = [1 * 10**(-3), 5 * 10**(-4), 1 * 10**(-4)]
methods = ['Euler','Runge Kutta 2','Runge Kutta 4']
plt.title('Plot 4: f(x) = Relative error in Runge-Kutta methods')
plt.bar(methods, errors)
