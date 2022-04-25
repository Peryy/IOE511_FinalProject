% IOE 511/MATH 562, University of Michigan
% Code written by: Minghao Chen

% Problem Number: 1
% Problem Name: quad_10_10
% Problem Description: A randomly generated convex quadratic function; the 
%                      random seed is set so that the results are 
%                      reproducable. Dimension n = 10; Condition number
%                      kappa = 10

% function that computes the gradient of the quad_10_10 function
function [g] = quad_1000_1000_grad(x,q,Q)



% compute function value
g = Q*x + q;

end