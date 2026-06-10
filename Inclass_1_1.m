clc; clear; close all;

% Example function (Same as lecture and AI)
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Plot function
x = linspace(0,4,100);
y = f(x);

figure
plot(x,y,'-','LineWidth',2)
grid on, hold on

xlabel('x')
ylabel('f(x)')
title('Incremental Search for Root Brackets')

% Add line f(x)=0
plot([0 4],[0 0],'r--')

% As used in the lecture
xb = incsearch(f,0,4,100); % I just rewrote the script and used the incsearch provided


% Displaying the brackets
disp('Bracket Intervals:')
disp(xb)

% Plot brackets on graph
[m,n] = size(xb);

for i = 1:m
    xL = xb(i,1);
    xU = xb(i,2);

    % Plotting bracket endpoints
    plot(xL,f(xL),'ko','MarkerFaceColor','g','MarkerSize',10)
    plot(xU,f(xU),'ko','MarkerFaceColor','m','MarkerSize',10)

    % xline for the brackets  
    xline(xL,'b--','LineWidth',2)
    xline(xU,'m--','LineWidth',2)

    fprintf('Bracket %d: [%.4f , %.4f]\n',i,xL,xU);
end