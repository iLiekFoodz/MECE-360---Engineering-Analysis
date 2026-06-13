clc; clear; close all;

% In_class_1a
f = @(x) sin(10*x) + cos(3*x); 

x = linspace(3, 6, 1000); 
y = f(x);
figure;
plot(x, y, '-', 'LineWidth', 2);
grid on, hold on;

plot([3 6], [0 0], 'r--'); 
grid on, hold on;

xb = incsearch(f, 3, 6, 100);  
[m, n] = size(xb);

% Execute bisection method for each bracket
for i = 1:m
    xL = xb(i,1);
    xU = xb(i,2);
    FL = f(xL);
    
    xr_old = xL; 
    iter = 0;    
    
    fprintf('Root %d Convergence:\n', i)
    fprintf(' iter        xr         err \n')
    
    while (1)
        xr = (xL + xU)/2;
        FR = f(xr);
        iter = iter + 1;
        
        err = abs((xr - xr_old)/xr);
        fprintf('%5d %10.4f %10.5f \n', iter, xr, err)
        
       
        if err < 1e-4 || iter > 20
            break; 
        end
        
        xr_old = xr;
        if sign(FR*FL) > 0
            xL = xr;
        else
            xU = xr;
        end
    end
    
    % Plotting the roots on the curve
    plot(xr, FR, 'o', 'LineWidth', 2, ...
        'MarkerEdgeColor', 'r', ...
        'MarkerFaceColor', 'w', ...
        'MarkerSize', 10);
end
 xlabel('x')
 ylabel('y') 
 title('Bisection Method - Incalass 1a')