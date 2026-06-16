clc; clear; close all;
% HW_1_5

L = 350;          % cm
E = 42000;        % kN/cm^2
I = 35000;        % cm^4 
w = 6;            % kN/cm

C = -w / (48 * E * I);

y_func = @(x) C * (2*x.^4 - 3*L*x.^3 + L^3*x);
dydx_func = @(x) C * (8*x.^3 - 9*L*x.^2 + L^3); % derived func (a)

% x vector from 0 to L
x = linspace(0, L, 1000);
y = y_func(x);
dydx = dydx_func(x);

%% (c) Finding roots using the provided Roots_Cubic_Equation func
a_coeff = -9 * L / 8;
b_coeff = 0;
c_coeff = L^3 / 8;

roots_all = Roots_Cubic_Equation(a_coeff, b_coeff, c_coeff);

x_max_def = roots_all(roots_all >= 0 & roots_all <= L);
y_max_def = y_func(x_max_def);
dydx_max_def = dydx_func(x_max_def);

fprintf('--- (c) Cubic Roots Method ---\n');
fprintf('Roots found: %s\n', num2str(roots_all));
fprintf('Valid root (Location of Max Deflection): %.4f cm\n\n', x_max_def);

%% (d) Incremental Search to locate a bracket
dx = 1; 
x_bracket = 0:dx:L;
bracket_found = [];

for i = 1:(length(x_bracket)-1)
    if dydx_func(x_bracket(i)) * dydx_func(x_bracket(i+1)) < 0
        bracket_found = [x_bracket(i), x_bracket(i+1)];
        break;
    end
end

fprintf('--- (d) Incremental Search ---\n');
fprintf('Bracket located between: [%.1f, %.1f]\n\n', bracket_found(1), bracket_found(2));

%% (e) Bisection Method
xr = Bisection_roots(dydx_func, bracket_found(1), bracket_found(2));

fprintf('--- (e) Bisection Method ---\n');
fprintf('Root found via Bisection: %.4f cm\n', xr);

%% (b) Plotting Graphics

figure(1);
plot(x, y, 'b-', 'LineWidth', 1.5); hold on;
plot(x_max_def, y_max_def, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
title('Beam Deflection y vs Position x');
xlabel('Position x (cm)');
ylabel('Deflection y (cm)');
grid on;
legend('Deflection curve', 'Maximum Deflection', 'Location', 'best');
hold on;

figure(2);
plot(x, dydx, 'g-', 'LineWidth', 1.5); hold on;
plot(x_max_def, dydx_max_def, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
title('Derivative dydx vs Position x');
xlabel('Position x (cm)');
ylabel('dydx');
grid on;
legend('dydx curve', 'Root (dydx = 0)', 'Location', 'best');
hold on;
% func code for the br methord
function xr = Bisection_roots(func, xL, xU)
    maxit = 100;
    es = 1e-6;
    iter = 0;
    xl = xL; xu = xU; xr = xl;
    
    while iter < maxit
        xr_old = xr;
        xr = (xl + xu) / 2;
        iter = iter + 1;
        
        if xr ~= 0
            ea = abs((xr - xr_old) / xr) * 100;
        end
        
        test = func(xl) * func(xr);
        if test < 0
            xu = xr;
        elseif test > 0
            xl = xr;
        else
            ea = 0;
        end
        
        if ea < es, break; end
    end
end

