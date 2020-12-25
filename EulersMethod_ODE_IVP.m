% Demonstrate Euler (RK-1) numerical method for solving ODE-IVPs
%
% Written by Maxwell Zines
% Written 24/12/2020
% Revision No. 1.0.0
%
%    This code demonstrates a simple implementation of 
% the Euler (Runge-Kutta first-order) method for solving
% ODE-IVPs. ODE-IVP is an ordinary differential equation 
% with given initial value.
%
%    A more thorough description of the Euler Method can
% be found at the bottom of this document. 
% ----------------------------------------------------------------------

%INITIALISE THE CODE:
clear all; clc;

%USER ENTERS f'(x) and f(x) HERE 
func = @(x,y)y; %f'(x) (evaluated by euler's method)
exactSol = @(x)exp(x)+1; %f(x), to graph the result against exact solution

% Prompt for interval and step count
a = input('Lower interval of evaluation: ');
b = input('Upper interval of evaluation: ');
n = input('Number of iterations: ');
yInit = input('Initial value of y: ');

h =((b-a)/n);
x = a:h:b;
y = zeros(size(x));
n = numel(y);  % the number of y values
y(1) = yInit;
    
for i=1:n-1
    y(i+1) = (y(i)+ h*func(x(i),y(i)));
    x(i+1) = (x(i) + h);
end


%Display results in a meaningful way
plot (x,y), grid on;
hold on;
fplot(exactSol, [0 4])
hold off;