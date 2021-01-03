% Goal: Implement the Monte Carlo integration technique in the simplest way
% possible, with a uniform distribution over a single-variable function. 
%
% Written by Maxwell Zines
% Written 02/01/2021
% Revision No. 1.0.0
%
%    This code is a "bare-bones" implementation of Monte Carlo integration
% over a user-defined function. For simplicity sake, the lower bound is
% assumed to be 0 since that is the lower limit of the MatLab RNG. The
% MatLab RNG generates a number between 0 and 1 - the random number is
% multiplied by the size of the bound to scale it. 
% ----------------------------------------------------------------------

clear all; clc;

%User function
f = @(x) x^2+1;

%User inputs
n = input('Number of iterations:');
b = input('Upper bound: ');

%init running sum
runningSum = 0;

%iterate
for i=1:n
    x = rand;
    x = x * b;
    runningSum = runningSum + (f(x) * b);
end

runningSum = runningSum / n;

disp('--------');
fprintf('Estimated integral after %i iterations: %f\n', n, runningSum);
