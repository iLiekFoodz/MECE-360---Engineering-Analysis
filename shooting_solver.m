clc; clear; close all;


x0 = 0; 
xf = 1;
y0 = 1;

% 4.3 
za_guess = -1; 
za_correct = fzero(@residual, za_guess);

[x, y_sol] = ode45(@dydx, [x0 xf], [y0; za_correct]);

% 4.4 Make a plot of the solution of y vs x
plot(x, y_sol(:,1), 'b-', 'LineWidth', 2)
grid on
xlabel('x', 'fontsize', 15)
ylabel('y(x)', 'fontsize', 15)
title('Solution of Non-linear BVP using Shooting Method')

fprintf('Found correct initial slope y2(0) = %.5f\n', za_correct);
