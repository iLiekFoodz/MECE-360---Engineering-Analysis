%EA_HW_3_4 Nouh Shaikh
clc; clear; close all;

x = [0; 2; 4; 6; 9; 11; 12; 15; 17; 19];
y = [5; 6; 7; 6; 9; 8; 8; 10; 12; 12];

p1 = polyfit(x, y, 1);
r_yx = corrcoef(x, y);
fprintf('y = %.3fx + %.3f (r = %.3f)\n', p1(1), p1(2), r_yx(1,2));

p2 = polyfit(y, x, 1);
r_xy = corrcoef(y, x);
fprintf('x = %.3fy + %.3f (r = %.3f)\n', p2(1), p2(2), r_xy(1,2));

subplot(1,2,1); plot(x, y, 'bo', x, polyval(p1, x), 'r-'); title('y vs x');
subplot(1,2,2); plot(y, x, 'go', y, polyval(p2, y), 'm-'); title('x vs y');
