clc; clear; close all;

% In_class_1b
g = 9.81;      % Acceleration due to gravity (m/s^2)
cd = 0.25;     % Drag coefficient (kg/m)
t = 4;         % Time (s)
v_target = 36; % Target velocity (m/s)

f = @(m) sqrt((g .* m) ./ cd) .* tanh(sqrt((g .* cd) ./ m) .* t) - v_target;

%% a) use the function file 'incsearch.m' to find a bracket.
m_min = 50; 
m_max = 200; 
ns = 100;

xb = incsearch(f, m_min, m_max, ns);

if isempty(xb)
    error('No brackets found. Please widen the mass search boundaries.');
end

xL = xb(1,1);
xU = xb(1,2);

%% b) use the false position method to find the mass, m
FL = f(xL);
FU = f(xU);
xr_old = xL;
max_iter = 50;
es = 1e-4; 

fprintf('\nFalse Position Method Convergence:\n')
fprintf(' iter        Mass (m)        Rel Error \n')

for iter = 1:max_iter
    xr = xU - (FU * (xL - xU)) / (FL - FU);
    FR = f(xr);
    
    err = abs((xr - xr_old) / xr);
    fprintf('%5d %15.4f %15.5f \n', iter, xr, err);
    
    if err < es || abs(FR) < 1e-6
        break;
    end
    
 xr_old = xr;
    if sign(FR * FL) > 0
        xL = xr;
        FL = FR; 
    else
        xU = xr;
        FU = FR; 
    end
end

%% c) Make a plot of the function and the root.
m_plot = linspace(m_min, m_max, 1000);
y_plot = f(m_plot);

figure;
plot(m_plot, y_plot, '-', 'LineWidth', 2, 'DisplayName', 'f(m)');
grid on;
hold on;

plot([m_min m_max], [0 0], 'r--', 'DisplayName', 'f(m) = 0');

plot(xr, FR, 'o', 'LineWidth', 2, ...
    'MarkerEdgeColor', 'k', ...
    'MarkerFaceColor', 'g', ...
    'MarkerSize', 10, ...
    'DisplayName', sprintf('Root (m = %.2f kg)', xr));

xlabel('Mass, m (kg)');
ylabel('Function Value, f(m)');
title('Inclass activity #1b - False Position');
legend('Location', 'best');

%% b) find the mass 
fprintf('\nCalculated Bungee Jumper Mass: %.3f kg\n', xr);