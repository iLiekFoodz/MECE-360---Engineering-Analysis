%EA_HW_3_5 Nouh Shaikh
clc; clear; close all;

x = [0.1, 0.2, 0.4, 0.6, 0.9, 1.3, 1.5, 1.7, 1.8];
y = [0.75, 1.25, 1.45, 1.25, 0.85, 0.55, 0.35, 0.28, 0.18];

X_trans = x;
Y_trans = log(y ./ x);

p = polyfit(X_trans, Y_trans, 1);
beta4 = p(1);
alpha4 = exp(p(2));
fprintf('alpha4 = %.4f, beta4 = %.4f\n', alpha4, beta4);

x_fit = linspace(min(x), max(x), 100);
y_fit = alpha4 * x_fit .* exp(beta4 * x_fit);
plot(x, y, 'bo', x_fit, y_fit, 'r-', 'LineWidth', 2);
grid on; xlabel('x'); ylabel('y'); title('Fit for y = \alpha_4 x e^{\beta_4 x}');
