%% Midterm Exam Problem 6 - Nouh Shaikh
clear; clc; close all;

X =[595, 623, 761, 849, 989, 1076, 1146, 1202, 1382, 1445, 1562];
y = [0.75, 1.13, 2.67, 3.42, 4.39, 4.88, 5.23, 5.48, 6.19, 6.40, 6.77];

x_fit = linspace(min(X), max(X), 200);

figure(1); hold on; grid on;
plot(X, y, 'ko', 'MarkerFaceColor', 'k');
xlabel('x'); ylabel('y'); title('Problem 6');

Z = [ones(length(X), 1), log(X)', (1./X)']; 
coeff = Z \ y'; 

y_matrix_fit = coeff(1) + coeff(2)*log(x_fit) + coeff(3)./x_fit;
plot(x_fit, y_matrix_fit, 'b--', 'LineWidth', 2);

p = polyfit(X, y, 2); 
y_poly_fit = polyval(p, x_fit);
plot(x_fit, y_poly_fit, 'r', 'LineWidth', 0.5); 
legend('Data Points', 'Linear Least Squares Fit', 'Quadratic Polyfit', 'Location', 'best');
