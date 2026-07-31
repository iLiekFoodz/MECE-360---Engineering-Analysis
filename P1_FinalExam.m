clc, clear, close all;
% Problem 1.4 - Final Exam

a = -2;
b = 4;

f = @(x) 1 - x - 4*x.^3 + 2*x.^5;

n_val = [5, 10, 20];

fprintf('Composite Trapezoidal Rule:\n');


for k = 1:length(n_val)

    n = n_val(k);
    h = (b - a)/n;

    x = a:h:b;
    y = f(x);

    % Composite Trapezoidal Rule
    I = h * (0.5*y(1) + sum(y(2:n)) + 0.5*y(n+1));

    fprintf('n = %2d, Integral = %.8f\n', n, I);

end