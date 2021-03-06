"""
Goal: Demonstrate various MatPlotLib features for 3D function plots

Written by Maxwell Zines
Written 05/01/2021
Revision No. 1.0.0

    This code is a demonstration of various MatPlotLib features which can
be implemented in a Numerical Analysis script. This script is the second in
a small sub-collection within the Numerical Methods repository. This script
covers 3D plotting.
"""

import matplotlib.pyplot as plt
from matplotlib import cm
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
plt.title('f(x,y) = x^2 + y^2')
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
plt.title('g(x,y) = sin(x) + sin(y)')
plt.clabel(CS, inline=True, fontsize=8)
plt.show()

# CONTOUR - COLOUR MAP
#-----------------------------------------------------------------------------
x = y = np.arange(-3, 3, .25)
x, y = np.meshgrid(x, y)
def h(x, y):
    return (x ** 2) - (y ** 2)
CS = plt.contourf(x, y, h(x, y), cmap = cm.PuBu_r)
plt.title('h(x,y) = x^2 - y^2')
cbar = plt.colorbar(CS)
plt.show()
