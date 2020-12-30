% Goal: Demonstrate the bisection method for root-finding
%
% Written by Maxwell Zines
% Written 24/12/2020
% Revision No. 1.0.0
%
%    This code demonstrates bisection method for root-finding by
% applying it on a user defined function over a specified interval.
%    The bisection method is dependent on the intermediate value theorem.
% Suppose f(a) < 0 and f(b) > 0, and f is continuous on [a,b]... Then there
% must be some f(c)=0 for c ? (a,b). This is the root.
% ----------------------------------------------------------------------

%data
clear all; clc;

% User inputs
% Algorithm will run until error is below specified value or maximum number
% of iterations is reached, whichever happens first.
UserFunc = @(x) x^2-9;
n = input('Maximum number of iterations: ');
e = input('Maximum error: ');
a = input('Lower bound: ');
b = input('Upper bound: ');

%Test if interval is valid - again, this draws heavily on results of the
%intermediate value theorem. This check, however, will fail to find invalid
%intervals when an odd number of roots exist on the interval.
if sign(UserFunc(a)) == sign(UserFunc(b))
    disp('Error:');
    disp('On this interval, input function has either no root or at least two.')
    return;
end

%The initial error is the entire interval 
error = abs(b - a);

for i=1:n
    %Break if error condition has been met
    if error < e
        break;
    end
    
    %Convergence of this algorithm is (b-a)/(2^n).
    error = error / 2;
    
    %Determine middlepoint(bisection) of the interval
    c = a + error;
    
    %"Keep" whichever of the two half-intervals contains the root
    if sign(UserFunc(a)) == sign(UserFunc(c))
        a = c;
    else 
        b = c;
    end
end

%Display the results
disp('------')
fprintf('Calculated root: %f\n', c);
fprintf('Calculated error: %f\n', error);
fprintf('Iteration count: %i\n', i);
