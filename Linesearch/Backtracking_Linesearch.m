% IOE 511/MATH 562, University of Michigan

% Function for Backtracking Line Search 

function [alpha] = Backtracking_Linesearch(x,f,g,d,problem,options)
alphaMax = options.alphaMax; % this is the maximum step length
alpha = alphaMax;
tau = options.tau; % < 1 reduction factor of alpha
c_1 = options.c_1;
while problem.compute_f(x+alpha*d) > f + c_1*alpha*g'*d
    alpha = tau*alpha;
    if alpha < eps
        disp('Error in Line search - alpha close to working precision');
        if problem.compute_f(x + alpha*d) > f
             break
        end
    end
end

end