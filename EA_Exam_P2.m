%% Midterm Exam Problem 2 - Nouh Shaikh

% Bisection roots method was used by the file provided on brightspace. 
% Secant roots was used from the previous problem. 
clear; clc; close all;

func_1 = @(x) 1.5 * x.^3 .* sin(0.4 * x.^2) - 3 * exp(-x + 3) + 2 * x .* log(x);

xb = [];  
x = 1e-5; 
dx = 0.1;

while x + dx <= 5
    if func_1(x) * func_1(x + dx) < 0
        xb = [xb; x, x + dx]; 
    end
    x = x + dx;
end

fprintf('Matrix of Brackets (xb):\n'); disp(xb);
num_roots = size(xb, 1);

figure(1); hold on; grid on; xlabel('x'); ylabel('f(x)'); title('Figure 1: Bisection');
fplot(func_1, [1, 5], 'b', 'LineWidth', 1.5);
fplot(@(x) 0, [1, 5], 'r--', 'LineWidth', 0.5);

roots_bisection = zeros(num_roots, 1);
for i = 1:num_roots
    roots_bisection(i) = Bisection_roots(func_1, xb(i,1), xb(i,2));
    plot(roots_bisection(i), 0, 'or', 'MarkerSize', 8);
end
fprintf('Roots via Bisection:\n'); disp(roots_bisection);

figure(2); hold on; grid on; xlabel('x'); ylabel('f(x)'); title('Figure 2: fzero');
fplot(func_1, [1, 5], 'b', 'LineWidth', 1.5);
fplot(@(x) 0, [1, 5], 'r--', 'LineWidth', 0.5);

roots_fzero = zeros(num_roots, 1);
for i = 1:num_roots
    roots_fzero(i) = fzero(func_1, (xb(i,1) + xb(i,2)) / 2);
    plot(roots_fzero(i), 0, 'ks', 'MarkerFaceColor', 'k', 'MarkerSize', 5);
end
fprintf('Roots via fzero:\n'); disp(roots_fzero);

figure(3); hold on; grid on; xlabel('x'); ylabel('f(x)'); title('Figure 3: Secant');
fplot(func_1, [1, 5], 'b', 'LineWidth', 1.5);
fplot(@(x) 0, [1, 5], 'r--', 'LineWidth', 0.5);

roots_secant = zeros(num_roots, 1);
for i = 1:num_roots
    roots_secant(i) = Secant_roots(func_1, xb(i,1), xb(i,2));
    plot(roots_secant(i), 0, 'bd', 'MarkerFaceColor', 'b', 'MarkerSize', 5);
end
fprintf('Roots via Secant:\n'); disp(roots_secant);