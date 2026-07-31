function shooting_method_solver()
clc; clear; close all;

% Define boundary conditions and domain
x0 = 0; xf = 1;
y0 = 1; yf_target = 0.5;

% 4.3 Use fzero to find the correct initial slope za = y2(0)
% Initial guess for the slope is set to -1
za_guess = -1; 
za_correct = fzero(@(za) residual(za, x0, xf, y0, yf_target), za_guess);

% Integrate one final time using the correct initial slope
[x, y_sol] = ode45(@dydx, [x0 xf], [y0; za_correct]);

% 4.4 Plot the final solution of y vs x
plot(x, y_sol(:,1), 'b-', 'LineWidth', 2)
grid on
xlabel('x', 'fontsize', 14)
ylabel('y(x)', 'fontsize', 14)
title('Solution of Non-linear BVP using Shooting Method')

% Print the found initial slope to the command window
fprintf('Correct initial slope y''(0) = %.5f\n', za_correct);
end

% 4.2 Function defining the two first-order ODEs
function dy = dydx(x, y)
dy = zeros(2,1);
dy(1) = y(2);                  % dy1/dx = y2
dy(2) = -2*y(2) + x * y(1)^2;  % dy2/dx = -2*y2 + x*y1^2
end

% 4.3 Residual function tracking the boundary error at x = 1
% Returns 0 when the boundary target condition is perfectly met
function r = residual(za, x0, xf, y0, yf_target)
[~, y] = ode45(@dydx, [x0 xf], [y0; za]);
yf_calculated = y(end, 1);     % Calculated y1 value at x = 1
r = yf_calculated - yf_target; % Error difference
end
