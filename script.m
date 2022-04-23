% IOE 511/MATH 562, University of Michigan
% Code written by: Minghao Chen

% Script to run code

% close all figures, clear all variables from workspace and clear command
% window
% close all
clear all
clc

format long

% set problem (minimal requirement: name of problem)
problem.name = 'Function3';
problem.x0 = [1;zeros(999,1)];
problem.n = length(problem.x0);
problem.memory = 10;


% set method (minimal requirement: name of method)
method.name = 'BFGS'; % option: GradientDescent, Newton, BFGS, L-BFGS
method.options.step_type = 'Backtracking'; % option: Constant, Backtracking, Modified Backtracking (Newton)
method.options.constant_step_size = 1e-3;

% set options
options.term_tol = 1e-6;
options.max_iterations = 1e4;

% run method and return x^* and f^*
[x,f,k,delta] = optSolver(problem,method,options);

% plot the difference between fx and fx v.s. iterations^*
figure(1)
fdelta = delta(delta~=0)-f;
plot(log10(fdelta));
xlabel("iterations");
ylabel("log(f(x_k)-f^*)");
box off
hold on