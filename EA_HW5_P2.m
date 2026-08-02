clc; clear; close all;
% Nouh Shaikh EA_HW5_P2

% dy/dt = f(t,y)
f = @(t, y) y * t^3 - 1.5 * y;

t0 = 0;
tf = 2;
y0 = 1;

%% (a) Analytical Solution
t_exact = linspace(t0, tf, 200);
y_exact = exp(0.25 * t_exact.^4 - 1.5 * t_exact);

%% (b) Euler's Method (h = 0.5 and h = 0.25)
% h = 0.5
h1 = 0.5;
t_euler1 = t0:h1:tf;
y_euler1 = zeros(size(t_euler1));
y_euler1(1) = y0;
for i = 1:(length(t_euler1)-1)
    y_euler1(i+1) = y_euler1(i) + f(t_euler1(i), y_euler1(i)) * h1;
end

h2 = 0.25;
t_euler2 = t0:h2:tf;
y_euler2 = zeros(size(t_euler2));
y_euler2(1) = y0;
for i = 1:(length(t_euler2)-1)
    y_euler2(i+1) = y_euler2(i) + f(t_euler2(i), y_euler2(i)) * h2;
end

%% (c) Midpoint Method (h = 0.5)
h_mid = 0.5;
t_mid = t0:h_mid:tf;
y_mid = zeros(size(t_mid));
y_mid(1) = y0;
for i = 1:(length(t_mid)-1)
    y_mid_half = y_mid(i) + f(t_mid(i), y_mid(i)) * (h_mid / 2);
    t_half = t_mid(i) + (h_mid / 2);
    y_mid(i+1) = y_mid(i) + f(t_half, y_mid_half) * h_mid;
end

%% (d) Fourth-Order RK Method (h = 0.5)
h_rk4 = 0.5;
t_rk4 = t0:h_rk4:tf;
y_rk4 = zeros(size(t_rk4));
y_rk4(1) = y0;
for i = 1:(length(t_rk4)-1)
    k1 = f(t_rk4(i), y_rk4(i));
    k2 = f(t_rk4(i) + h_rk4/2, y_rk4(i) + k1*h_rk4/2);
    k3 = f(t_rk4(i) + h_rk4/2, y_rk4(i) + k2*h_rk4/2);
    k4 = f(t_rk4(i) + h_rk4, y_rk4(i) + k3*h_rk4);
    y_rk4(i+1) = y_rk4(i) + (h_rk4 / 6) * (k1 + 2*k2 + 2*k3 + k4);
end

%% (e) ODE45
[t_ode45, y_ode45] = ode45(f, [t0, tf], y0);

figure('Color', 'w');
plot(t_exact, y_exact, 'k-', 'LineWidth', 2); hold on;
plot(t_euler1, y_euler1, 'ro--', 'LineWidth', 1.2, 'MarkerFaceColor', 'r');
plot(t_euler2, y_euler2, 'b*--', 'LineWidth', 1.2);
plot(t_mid, y_mid, 'md-.', 'LineWidth', 1.2, 'MarkerFaceColor', 'm');
plot(t_rk4, y_rk4, 'gs-', 'LineWidth', 1.5, 'MarkerFaceColor', 'g');
plot(t_ode45, y_ode45, 'cx', 'MarkerSize', 8, 'LineWidth', 1.5);
xlabel('t'), ylabel('y');
title('Comparison of Numerical Methods for solving IVP');
legend('Analytical', 'Euler (h=0.5)', 'Euler (h=0.25)', ...
    'Midpoint (h=0.5)', 'RK4 (h=0.5)', 'ode45', 'Location', 'NorthWest');
grid on;
