% Goal: Demonstrate Simpson's Rules. Compare results of some frequently-
% used Simpson's Rule schemes, including the so-called "1/3" and "3/8" 
% rules.
%
% Written by Maxwell Zines
% Written 29/12/2020
% Revision No. 1.0.0
%
%    This code applies Simpson's rule, and a number of different derivative
% methods, to a user-defined function. The results of each are compared.
% ----------------------------------------------------------------------

%data
clear all; clc;

%User inputs
%The integral of 4/(1+x^2) wrt x from 0 to 1 is equal to pi. Great for
%checking the accuracy of each method and comparing :)
UserFunc = @(x) 4/(1+x^2);
a = input('Lower bound: ');
b = input('Upper bound: ');

% Calculate the "1/3" (traditional) Simpson's Rule 
% The Formula for this is given as F(x)|(a,b) = h/3(f(a)+4f(a+h)+f(b))
h = (b - a)/2;
SimpsonOneThird = (h/3)*(UserFunc(a)+(4*UserFunc(a+h))+UserFunc(b));

% Calculate the "3/8" Simpson's Rule 
% The Formula for this is given as F(x)|(a,b) = 3h/8(f(a)+3f(2a+b/3)+3f(a+2b/3)+f(b))
h = (b - a)/3;
SimpsonThreeEighth = ((3*h)/8)*(UserFunc(a)+(3*UserFunc((2*a+b)/3))+(3*UserFunc((a+(2*b))/3))+UserFunc(b));

% Calculate the 1/3 Simpson's Rule over two equal subintervals, making use
% of the fact that F(x)|(a,b)=F(x)|(a,c)+F(x)|(c,b).
h = (b - a)/4;
c = h * 2; %Midpoint
SimpsonOneThird2 = (h/3)*(UserFunc(a)+4*UserFunc((a+c)/2)+2*UserFunc(c)+4*UserFunc((b+c)/2)+UserFunc(b));

%Print the results
disp('--------')
fprintf('Simpson''s 1/3 Rule: %f\n', SimpsonOneThird);
fprintf('Simpson''s 3/8 Rule: %f\n', SimpsonThreeEighth);
fprintf('Simpson''s 1/3 Rule, two sets of subintervals: %f\n', SimpsonOneThird2);
