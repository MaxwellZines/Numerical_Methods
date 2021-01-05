"""
Goal: Demonstrate various MatPlotLib features for 3D function plots

Written by Maxwell Zines
Written 03/01/2021
Revision No. 1.0.0

    This code is a demonstration of various MatPlotLib features which can
be implemented in a Numerical Analysis script. This script is the second in
a small sub-collection within the Numerical Methods repository. This script
covers 3D plotting.
    IF YOU HAVE NOT YET EXPLORED THE FIRST TUTORIAL AND YOU ARE UNFAMILAR WITH
MATPLOTLIB, it would be worth your time to do so. This script contains many
fewer comments on basic PyPlot functions.
"""

import matplotlib.pyplot as plt
import numpy as np

# BASIC CONTOUR PLOT:
#-----------------------------------------------------------------------------
# First, we define a 3D function to plot. I chose x^2 + y^2 because we should
# have a good idea of what this contour will look like if we did everything 
# correctly! We should see a series of concentric circles. 
x = y = np.arange(-5, 5, .25)
x, y = np.meshgrid(x, y)
def f(x,y):
    return (x ** 2) + (y ** 2)
CS = plt.contour(x, y, f(x,y), 5) #Play around with this number!
plt.clabel(CS, inline=True, fontsize=8)
plt.show()

# CONTOUR - DIFFERENTIATE POSITIVE AND NEGATIVE
#-----------------------------------------------------------------------------
# This contour plot will use different line styles or positive and negative
# values in the contour, making it easier to differentiate.
x = y = np.arange(-2 * np.pi, 2 * np.pi, np.pi/25)
x, y = np.meshgrid(x, y)
def g(x,y):
    return (np.sin(x) + np.sin(y))
CS = plt.contour(x, y, g(x,y), 6, colors = 'k')
plt.clabel(CS, inline=True, fontsize=8)
plt.show()

