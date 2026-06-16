% Part 1d
clc; clear; close all;

x = 5;              
max_terms = 10;     
terms_range = 1:max_terms;
approximations = zeros(1, max_terms);
exact_value = exp(x);

% Computing approximation for each choice of n
for n = terms_range
    approximations(n) = exp_function_n(x, n);
end

% Plotting results
figure;
plot(terms_range, approximations, '-b^', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
hold on;
yline(exact_value, 'r--', 'Exact Value (e^x)', 'LineWidth', 1.5);

% Plot stuff
grid on;
xlabel('Number of Terms (n)');
ylabel('Function Value');
title(['Effect of Number of Terms (n) on Approximating e^{', num2str(x), '}']);
legend('Maclaurin Approximation', 'Exact Value', 'Location', 'best');
