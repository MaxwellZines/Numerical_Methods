% Goal: Implement the Monte Carlo integration technique to approximate pi.
%
% Written by Maxwell Zines
% Written 02/01/2021
% Revision No. 1.0.0
%
%    This code demonstrates how Monte Carlo Integration over a circular
% region could be used to estimate the value of pi. NOTE that a better,
% more "truly random" random number generator would be of use here, and n
% must be very large (>10000) to see any significant convergence towards
% pi.
%    Rounding may prove to be a significant challenge for this code.
% ----------------------------------------------------------------------

n = input('Number of iterations: ');
runningSum = 0;

for i=1:n
    
    x = rand;
    y = rand;  
    
    incircle = (x^2) + (y^2);
    if incircle <= 1
        runningSum = runningSum + 1;
    end
end

pi = 4 * (runningSum / n);

disp('--------');
fprintf('Using %i iterations, pi approximation: %f\n', n, pi);
