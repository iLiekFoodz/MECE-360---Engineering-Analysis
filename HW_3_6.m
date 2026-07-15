%EA_HW_3_6 Nouh Shaikh
clc; clear; close all;

x = [3,4,5,7,8,9,11,12];
y = [1.6, 3.6, 4.4, 3.4, 2.2, 2.8, 3.8, 4.6];
n = length(x);

Z = [x.^3; x.^2; x; ones(1, n)]'; 
a = (Z' * Z) \ (Z' * y'); 
fprintf('Coefficients (a3 to a0): %.4f, %.4f, %.4f, %.4f\n', a);

y_pred = Z * a;
Sr = sum((y' - y_pred).^2);
St = sum((y - mean(y)).^2);
r2 = 1 - (Sr / St);
syx = sqrt(Sr / (n - 4)); 
fprintf('r^2 = %.4f, s_y/x = %.4f\n', r2, syx);

x_fit = linspace(min(x), max(x), 100);
y_fit = polyval(a, x_fit);
plot(x, y, 'bo', x_fit, y_fit, 'r-', 'LineWidth', 3);
grid on; xlabel('x'); ylabel('y'); title('Cubic Polynomial Fit:');
