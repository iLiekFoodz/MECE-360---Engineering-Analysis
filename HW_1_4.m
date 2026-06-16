%HW_1_4
clc; clear; close all;

t = -5:0.05:50;

v = rocket_velocity(t);

figure;
plot(t, v, 'b-', 'LineWidth', 2);
grid on;

xlabel('Time, t');
ylabel('Velocity, v(t)');
title('Rocket Velocity vs Time');
