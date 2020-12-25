% Goal: Demonstrate the Secant Method for nonlinear equation
% root-finding.
%
% Written by Maxwell Zines
% Written 24/12/2020
% Revision No. 1.0.0
%
%    This code demonstrates Secant method of root-finding by
% running the algorithm on a user-defined function.
% ----------------------------------------------------------------------

clear all; clc;

%USER ENTERS FUNCTION HERE:
f = @(x) x^2-10;

e = input('Specify a maximum error (e): ');
n = input('Specify a maximum number of iterations (n): ');
x0 = input('Enter lower interval bound: ');
x1 = input('Enter upper interval bound: ');
pf = input('Would you like to print the result of each iteration? [1/y, 0/n]: ');
disp('--------------');
% The program will run until the specified number of iterations is
% exceeded or the calculated error is smaller than specified value e,
% whichever happens first.

if x1 < x0
    temp = x0;
    x0 = x1;
    x1 = temp;
    clear temp;
    % Simple MATLAB calls exist for this purpose. Play around with this!
end

%While loop setup
error = abs(x1 - x0);
stepCount = 0;

%While loop iterates through algorithm
while error > e && stepCount < n
    difference = ((x1-x0)/(f(x1)-f(x0)));
    xn = x1 - (difference * f(x1));
    x0 = x1;
    x1 = xn;
    if pf == 1
        fprintf('Iteration %i. Num: %f\n', stepCount, xn);
    end
    error = abs(x1-x0);
    stepCount = stepCount + 1;
end
disp('--------------');
fprintf('Calculated root: %f\n', xn);
fprintf('Calculated error: %f\n', error);
fprintf('Iterations: %i\n', stepCount);
