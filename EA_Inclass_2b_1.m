clc; clear; close all;

% Inclass_2b_1
% Secant Method with two guessing

% Example:
   f = @(x) x.^3 - 6*x.^2 + 11*x - 6;
   f_p = @(x) 3*x.^2 - 12*x + 11; %First order derv
%
    x = linspace(0,4, 200);
    y = f(x);
    %
    plot(x,y,'-', 'Linewidth', 2)
    grid on
    hold on
    %
    % add a red line at f = 0
    plot([0 4], [0 0], 'r--')

    
%% Newton Raphson Method
    
    x1 = 3.2;
    x2 = 3.1;
    xr = x1;
    xr_old = xr;
    iter = 0;
        %
    fprintf('   iter     xr        err \n')

while (1)

    %Calculate f1 and f2          

    FR1 = f(x1);
    FR2 = f(x2);
    

    % calculate f_p(xr) by the slope of a linear line 
    Fp = (FR2 - FR1)/(x2 - x1);

    iter = iter + 1;

    %Algorithm: Update the new guess

    xr = x1 - FR1/Fp; 
    FR = f(xr);

%% Plot the iteration process

plot(x1, FR1, 'o','LineWidth',2,...
                       'MarkerEdgeColor','g',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',7)

plot(x2, FR2, 'o','LineWidth',2,...
                       'MarkerEdgeColor','g',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',7)
plot([x1 x2], [FR1 FR2], 'b-', 'LineWidth',2)

pause
plot(xr, FR, 'o','LineWidth',2,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',6)

    % calculate the relative erro
    err = abs((xr - xr_old)/xr);
    %

    fprintf('%5d %10.6f %10.5f \n',iter, xr, err)

    if err < 1e-4 || iter > 20, break, end
    %
    xr_old = xr;
    x1 = x2; 
    x2 = xr;
end 