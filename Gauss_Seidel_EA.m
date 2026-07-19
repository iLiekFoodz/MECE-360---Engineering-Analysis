% The Gauss-Seidel method is an iterative technique used to solve a square system of 
% linear equations (Ax = b) but with this one we use an initial guess vector (x0) and this updates 
% each variable sequentially. It immediately uses the newly calculated values within the same 
% iteration step to find the subsequent variables, allowing it to typically converge much faster
% than methods that wait until the end of the loop to update the vector.
function [x] = Gauss_Seidel_EA(A, b, x0)
n = length(b);
x = x0;
iter = 0;
ea = 1;

fprintf('Iteration  |   Error\n');

while ea >= 1e-4 && iter < 50
    iter = iter + 1;
    x_old = x;

    for i = 1:n
        s = 0;
        
        for j = 1:n
            if j ~= i
                s = s + A(i,j) * x(j);
            end
        end
        x(i) = (b(i) - s) / A(i,i);
    end

    ea = max(abs((x - x_old) ./ x));

    fprintf('%3d    %.4e\n', iter, ea);
end
end
