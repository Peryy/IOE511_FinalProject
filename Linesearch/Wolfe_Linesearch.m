% IOE 511/MATH 562, University of Michigan

% Function for Wolfe Line Search 

function [alpha] = Wolfe_Linesearch(x,d,problem,options)
alpha = options.alphaInit;
c_1 = options.c_1;
c_2 = options.c_2;
alpha_low = options.alpha_low;
alpha_high = options.alpha_high;
while 1
    f_new = problem.compute_f(x+alpha*d);
    if f_new <= problem.compute_f(x) + c_1 * problem.compute_g(x)' * d
        g_new = problem.compute_g(x+alpha*d);
        if g_new' * d >= c_2 * problem.compute_g(x)' * d
            break
        end
    end
   
    if f_new <= problem.compute_f(x) + c_1 * problem.compute_g(x)' * d
        alpha_low = alpha;
    else
        alpha_high = alpha;
    end
    
    alpha = c * alpha_low + (1 - c) * alpha_high;  
end

end