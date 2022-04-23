% IOE 511/MATH 562, University of Michigan
% Code written by: Minghao Chen

% Function that computes the gradient of the Rosenbrock function
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = rosen_grad(x)

n=length(x)-1;

g = [400*x(1)^3-x(1)*(400*x(2)-2)-2;
    200*(x(2:n,1)-x(1:n-1,1).^2) + 400*x(2:n,1).^3-x(2:n,1).*(400*x(3:n+1,1)-2)-2;
    200*(x(n+1)-x(n)^2)];

end