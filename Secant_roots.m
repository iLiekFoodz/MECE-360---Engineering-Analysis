%Midterm Exam Problem 1 - Nouh Shaikh
function [xr] = Secant_roots(func, x1, x2)
iter = 0;
ea = 1; 


while ea >= 1e-4 && iter < 25
    iter = iter + 1;

    xr = x2 - (func(x2) * (x2 - x1)) / (func(x2) - func(x1));

    ea = abs((xr - x2) / xr);

    fprintf('Iter: %d, xr = %.4f, Error = %.4e\n', iter, xr, ea);

    x1 = x2;
    x2 = xr;
end
end
