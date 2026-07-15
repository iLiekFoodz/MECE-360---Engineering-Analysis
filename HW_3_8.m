%EA_HW_3_8 Nouh Shaikh
clc; clear; close all;

% Data definition
x = [0, 1.8, 5, 6, 8.2, 9.2, 12];
y = [26, 16.415, 5.375, 3.5, 2.015, 2.54, 8];
xx = linspace(0, 12, 200);

% 1:
plot(x, y, 'ko'); hold on;

% 3:
y6 = Newton_Int_poly(x, y, xx);
y37_6 = Newton_Int_poly(x, y, 3.7);
plot(xx, y6, 'r-', 'LineWidth', 0.5);      
plot(3.7, y37_6, 'bs');                     
hold on

% 4:
y3 = Newton_Int_poly(x(1:4), y(1:4), xx);
y37_3 = Newton_Int_poly(x(1:4), y(1:4), 3.7);
plot(xx, y3, 'k-', 'LineWidth', 1);      
plot(3.7, y37_3, 'rd');                     
grid on; hold on;

