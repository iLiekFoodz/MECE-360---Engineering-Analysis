clc; clear; close all;
% Problem 3 - Final Exam

x0 = 0;
xf = 1;

y0 = 1;          % y(0)
za_guess = -1;   

za = fzero(@residual, za_guess);

[x,y] = ode45(@dydx,[x0 xf],[y0; za]);


fprintf('Initial slope y''(0) = %.6f\n',za);
fprintf('y(1) = %.6f\n',y(end,1));

figure
plot(x,y(:,1),'b-','LineWidth',2)
grid on

xlabel('x','FontSize',12)
ylabel('y(x)','FontSize',12)
