%EA_HW_3_7 Nouh Shaikh
clc; clear; close all;

x =[1,2,3,4,5];
y = [2.2, 2.8, 3.6, 4.5, 5.5];
n = length(x);

Z = [ones(1, n); x; 1./x]'; 
coefs = (Z' * Z) \ (Z' * y'); 

a = coefs(1); b = coefs(2); c = coefs(3);
fprintf('a = %.4f, b = %.4f, c = %.4f\n', a, b, c);

x_fit = linspace(min(x), max(x), 100);
y_fit = a + b * x_fit + c ./ x_fit;

plot(x, y, 'bo', 'MarkerFaceColor', 'b'); hold on;
plot(x_fit, y_fit, 'r-', 'LineWidth', 3);
grid on; xlabel('x'); ylabel('y'); title('Fit for y = a + bx + c/x');
