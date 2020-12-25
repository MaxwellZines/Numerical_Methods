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
% ----------------------------------------------------------------------

%USER ENTERS f'(x) and exact f(x) HERE:
func = @(x,y)2*x; %f'(x), to be evaluated by euler's method
exactSol = @(x,y)x^2+0; %f(x), to graph the result against exact solution

%INITIALISE THE CODE:
clear all; clc;

% Prompt for interval and step count
a = input('Lower interval of evaluation: ');
b = input('Upper interval of evaluation: ');
n = input('Number of iterations: ');
yInit = input('Initial value of y: ');

%Calculate step size and create a vector of x+h(n)
h =((b-a)/n);
x = a:h:b;

%Make null vectors to put y (E.M.) and g (exact) values
y = zeros(size(x));
g = zeros(size(x));

%Set index size and initial value
n = numel(y);
y(1) = yInit;

%Iterate Euler's Method
for i=1:n-1
    y(i+1) = (y(i)+ h*func(x(i),y(i)));
    x(i+1) = (x(i) + h);
end

%Iterate exact solution at same points
for i=1:n
    g(i)=exactSol(i-1);
end

%Plot E.M. and Exact solutions against each other
plot(x,y,x,g);
hold off;