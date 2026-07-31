clc; clear; close all;
% Problem 2 - Final Exam

f = @(t,y) -1.5*y + 7*exp(-0.4*t);

axis([0 1.5 1 5])
xlabel('t','fontsize',15)
ylabel('y(t)','fontsize',15)
grid on
hold on

% h = 0.3 over time span 0 to 1.5 requires 6 points
n = 6;
t = linspace(0,1.5,n);
h = t(2) - t(1); 

% Midpoint method
y3 = zeros(1,length(t));
y3(1) = 3; 

for i = 2:n
    phi_p = f(t(i-1),y3(i-1));
    y_0 = y3(i-1) + h/2 * phi_p; 
    
    phi = f(t(i-1)+h/2,y_0);
    y3(i) = y3(i-1) + h * phi; 
end

plot(t,y3,'o-','LineWidth',1,...
    'MarkerEdgeColor','m',...
    'MarkerFaceColor','w',...
    'MarkerSize',8)

% Ralston method
y4 = zeros(1,length(t));
y4(1) = 3; 

for i = 2:n
    k1 = f(t(i-1),y4(i-1));
    k2 = f(t(i-1)+0.75*h, y4(i-1)+0.75*k1*h);
    
    phi = (1/3)*k1 + (2/3)*k2;
    y4(i) = y4(i-1) + h * phi;
end

plot(t,y4,'s-','LineWidth',1,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'MarkerSize',6)

% MATLAB ode45
y0 = 3; 
span = linspace(0,1.5,11);

[t_ode,y5] = ode45(f, span, y0);

plot(t_ode,y5,'d--','LineWidth',1,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','w',...
    'MarkerSize',6)
legend('Midpoint Method', 'Ralston Method', 'ode45', 'Location', 'best')

fprintf('  t       Midpoint       Ralston\n');
for i = 1:n
    fprintf('%.2f     %.5f       %.5f\n', t(i), y3(i), y4(i));
end
 % Reducing the step size h quadratically minimizes the global truncation error for both second-order methods, 
 % with the Ralston method delivering slightly higher accuracy than the Midpoint Method due to its optimized coefficients.