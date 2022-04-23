% IOE 511/MATH 562, University of Michigan
% Code written by: Minghao Chen

% Function that: (1) computes the GD step; (2) updates the iterate; and, 
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, d, alpha
%
function [x_new,f_new,g_new,H_new,d,alpha] = GDStep(x,f,g,H,problem,method,options)

% search direction is -g
d = -g;

% determine step size
switch method.options.step_type
    case 'Constant'
        alpha = method.options.constant_step_size;
        x_new = x + alpha*d;
        f_new = problem.compute_f(x_new);
        g_new = problem.compute_g(x_new);
        H_new = problem.compute_H(x_new);

    case 'Backtracking'
       % method.options.alphaMax = 1; % this is the maximum step length
        alpha = method.options.alphaMax;
      % method.options.tau = 1/2; % < 1 reduction factor of alpha
      % c_1 = 1e-4;
        while problem.compute_f(x+alpha*d) > f + method.options.c_1*alpha*g'*d
            alpha = method.options.tau*alpha;
            if alpha < eps
                disp('Error in Line search - alpha close to working precision');
                if problem.compute_f(x + alpha*d) > f
                    x_new = x + alpha*d;
                end
                break
            end
        end
        x_new = x + alpha*d;
        f_new = problem.compute_f(x_new);
        g_new = problem.compute_g(x_new);
        H_new = problem.compute_H(x_new);

        
end
end

