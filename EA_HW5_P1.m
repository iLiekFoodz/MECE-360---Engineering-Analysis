clc; clear; close all;
% Nouh Shaikh EA_HW5_P1

f = @(x) 1 - x.*exp(-x) + 2*x.^2.*sin(1.5*x);

a = 0;
b = 2;

exact_val = integral(f, a, b);
fprintf('Exact Integral Value: %.6f\n\n', exact_val);

%% 1) Composite Trapezoidal Rule (n = 7, 17, 37)
fprintf('Composite Trapezoidal Rule: \n');
fprintf('%-5s | %-20s\n', 'n', 'Approximate Value');
for n = [7, 17, 37]
    h = (b - a) / n;
    x = linspace(a, b, n + 1);
    y = f(x);
    I_trap = (h / 2) * (y(1) + 2 * sum(y(2:end-1)) + y(end));
    fprintf('%-5d | %-20.6f\n', n, I_trap);
end
fprintf('\n');

%% 2) Composite Simpson''s 1/3 Rule (n = 7, 37)
fprintf('Composite Simpson''s 1/3 Rule \n');
fprintf('%-5s | %-20s\n', 'n', 'Approximate Value');
for n = [7, 37]
    h = (b - a) / n;
    x = linspace(a, b, n + 1);
    y = f(x);

    sum_even = 0;
    sum_odd = 0;
    for i = 2:n
        if mod(i, 2) == 0
            sum_even = sum_even + y(i);  
        else
            sum_odd = sum_odd + y(i);    
        end
    end
    I_simp = (h / 3) * (y(1) + 4*sum_even + 2*sum_odd + y(end));
    fprintf('%-5d | %-20.6f\n', n, I_simp);
end
