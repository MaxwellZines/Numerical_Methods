% Goal: Calculate left-point, right-point, and mid-point Riemann sums
%
% Written by Maxwell Zines
% Written 29/12/2020
% Revision No. 1.0.0
%
%    This code takes a user function and, given a number of intervals,
% calculates the left-point, right-point, and mid-point Riemann sums.
% ----------------------------------------------------------------------

clear all; clc;

%User enters function here:
f = @(x,y)2*x; %f'(x), to be evaluated by euler's method

% Prompt for interval and step count
a = input('Lower interval of evaluation: ');
b = input('Upper interval of evaluation: ');
n = input('Number of intervals: ');

%Calculate step size
h =((b-a)/n);

%Left-point sum
LPS = 0;
for i=0:n-1
    RecVolume = (f(a+(h*i)))* h;
    LPS = LPS + RecVolume;
end

%Right-point sum
RPS = 0;
for i=1:n
    RecVolume = (f(a+(h*i)))* h;
    RPS = RPS + RecVolume;
end

%Mid-point sum
MPS = 0;
for i=1:n
    RecVolume = (f(a+(h*i)-(h/2)))* h;
    MPS = MPS + RecVolume;
end

%Print Results
disp('--------')
fprintf('Left-point sum: %f\n', LPS);
fprintf('Right-point sum: %f\n', RPS);
fprintf('Mid-point sum: %f\n', MPS);