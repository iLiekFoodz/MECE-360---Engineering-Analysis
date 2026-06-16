clear; clc; close all;
% HW 1 Problem 2: Fractal Generation Script

% Case (a):
%m = 2; n = 1; 
% Case (b):
m = 100; n = 200;

% Step 1: Initialize figure and set hold on
figure;
hold on;

% Step 2: Start a for loop to iterate over i = 1:100000
for i = 1:100000
    
    % Step 3: Compute a random number
    q = 3 * rand(1);
    
    % Steps 4-8: If-Else structures based on the value of q
    if q < 1
        % Step 5
        m = m / 2;
        n = n / 2;
    elseif q < 2
        % Step 7
        m = m / 2;
        n = (300 + n) / 2;
    else
        % Step 8
        m = (300 + m) / 2;
        n = (300 + n) / 2;
    end
    
    % Steps 9-11: Plot logic and termination check
    if i < 100000
        % Step 10: Plot a point at the coordinate (m, n)
        plot(m, n, 'b.', 'MarkerSize', 1);
    else
        % Step 11: Terminate loop (handled automatically by the loop ending)
        break; 
    end
end

% Step 12: Set hold off
hold off;

title(sprintf('Fractal Generation (Initial: m=%d, n=%d)', m, n));
xlabel('m');
ylabel('n');
grid on;
