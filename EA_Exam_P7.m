%% Midterm Exam Problem 7  - Nouh Shaikh
clear; clc; close all;

x = [-1, -0.5, 0, 0.5, 1];
f = [0.0385, 0.1379, 1, 0.1379, 0.0385];
xi = linspace(-1, 1, 500);

figure;
plot(x, f, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8); 
hold on;
xlabel('x');
ylabel('y (or f)');
title('Comparison of Interpolation Methods');
grid on;

% 2.2) Newton Interpolating Polynomial (4th order)
[f_newton, ~] = Newton_poly_Intep(x, f, xi);
plot(xi, f_newton, 'b--', 'LineWidth', 1);

% 2.3) Cubic Spline Interpolation
f_spline = interp1(x, f, xi, 'spline');
plot(xi, f_spline, 'r-.', 'LineWidth', 1);

% 2.4) PCHIP 
f_pchip = interp1(x, f, xi, 'pchip');
plot(xi, f_pchip, 'k-', 'LineWidth', 2);

% 2.5) LEGEND!!!!!!!!
legend('Data Points', '4th Order Newton Poly', 'Cubic Spline', 'PCHIP', 'Location', 'best');
hold off;
