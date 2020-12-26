% Goal: Demonstrate the uniform trapezoidal method for approximating
% definite integrals.
%
% Written by Maxwell Zines
% Written 25/12/2020
% Revision No. 1.0.0
%
%    This code demonstrates the uniform trapezoidal method for
% approximating definite integrals. This technique is usually demonstrated
% in an introductory calculus class, but many numerical methods classes
% will reiterate and include a rigorous discussion on error.
% ----------------------------------------------------------------------

clear all; clc;

%USER ENTERS FUNCTION TO INTEGRATE HERE:
f = @(x) x^2;

%Prompt user for bounds and subinterval count:
a = input('Enter the lower bound of integration: ');
b = input('Enter the upper bound of integration: ');
n = input('Enter the number of subintervals (1 subint. = 1 trapezoid): ');
disp('--------');

%Calculate step size:
h = ((b - a)/ n);

% Add values f(a) and f(b) to the running sum:
runningSum = f(a) + f(b);

% Add 2 times every intermediate y value, if n>1:
if n>2
    for i=1:(n-1)
        xVal = a+(h*i);
        runningSum = runningSum + (2 * f(xVal));
    end
end


%Multiply the sum by h/2 (recall the area formula for a right trapezoid)
intApprox = (h/2) * runningSum;

fprintf('Integral approximation: %f\n', intApprox);
fprintf('Using %i subinterval(s) from %f to %f\n', n, a, b);
