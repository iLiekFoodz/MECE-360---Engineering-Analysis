clc; clear; close all;
%% Problem #6: Root Finding for ln(x^2) = 0.7
f = @(x) log(x.^2) - 0.7;

%% (a) Graphical Method
figure;
fplot(f, [0.1, 2.5], 'LineWidth', 2);
grid on;
yline(0, 'r--', 'LineWidth', 1.5); % Reference line for root
xlabel('x');
ylabel('f(x)');
title('Graphical Method to Find the Root of ln(x^2) = 0.7');
legend('\ln(x^2) - 0.7', 'f(x) = 0', 'Location', 'best');
hold on;
%% (b) Bisection Method
xL = 0.5;
xU = 2.0;
tol = 1e-5;
max_iter = 100;

fprintf('--- Bisection Method ---\n');
if f(xL) * f(xU) > 0
    error('No root guaranteed in the interval [xL, xU].');
else
    fprintf('%-6s %-10s %-10s %-10s %-10s\n', 'Iter', 'xL', 'xU', 'xR', 'f(xR)');
    for iter = 1:max_iter
        xR = (xL + xU) / 2;
        fxR = f(xR);
        
        fprintf('%-6d %-10.5f %-10.5f %-10.5f %-10.5f\n', iter, xL, xU, xR, fxR);
        
        if abs(fxR) < tol || (xU - xL)/2 < tol
            break;
        end
        
        if f(xL) * fxR < 0
            xU = xR;
        else
            xL = xR;
        end
    end
    fprintf('Estimated positive root (Bisection): %.5f\n\n', xR);
end

%% (c) False-Position Method
xL = 0.5;
xU = 2.0;

fprintf('--- False-Position Method ---\n');
if f(xL) * f(xU) > 0
    error('No root guaranteed in the interval [xL, xU].');
else
    fprintf('%-6s %-10s %-10s %-10s %-10s\n', 'Iter', 'xL', 'xU', 'xR', 'f(xR)');
    xR_old = xL;
    for iter = 1:max_iter
        
        xR = xU - (f(xU) * (xL - xU)) / (f(xL) - f(xU));
        fxR = f(xR);
        
        fprintf('%-6d %-10.5f %-10.5f %-10.5f %-10.5f\n', iter, xL, xU, xR, fxR);
        
        % Check convergence using relative approximate error or absolute function value
        if abs(fxR) < tol || abs(xR - xR_old) < tol
            break;
        end
        xR_old = xR;
        
        if f(xL) * fxR < 0
            xU = xR;
        else
            xL = xR;
        end
    end
    fprintf('Estimated positive root (False-Position): %.5f\n', xR);
end
