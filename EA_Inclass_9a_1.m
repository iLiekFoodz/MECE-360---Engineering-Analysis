% EA_Inclass_9a
%
%   Initial-value ode solver
    clc;    clear
%
%   set up functions 
    f = @(t,y) 4*exp(0.8*t)-0.5*y;
    y_e = @(t) 4/1.3*(exp(0.8*t)-exp(-0.5*t))+2*exp(-0.5*t);
%
    t1 = linspace(0, 5, 20);
    ye = y_e(t1);
%
    plot(t1,ye,'k--','LineWidth',0.05)
    axis([0 4 0 70])
    xlabel('t','fontsize',15)
    ylabel('y(t)','fontsize',15)
    grid on
    hold on
%
% Euler method 
    n = 6;
    t = linspace(0,5,n);
    y1 = zeros(1,length(t));
    y1(1) = 2;       % initial condition
    h = t(2) - t(1);          % time step
    %
    for i = 2:n
        phi = f(t(i-1),y1(i-1));
        y1(i) = y1(i-1) + h * phi;
    end
    %
    plot(t,y1,'o','LineWidth',1,...
                       'MarkerEdgeColor','b',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',6)
%
% Heun's method 
%   Predcitor + corrector
    y2 = zeros(1,length(t));
    y2(1) = 2;       % initial condition
    %
    for i = 2:n
        phi_p = f(t(i-1),y2(i-1)); 
        y_0 = y2(i-1) + h * phi_p;     % predcitor
        %
        phi = (f(t(i-1),y2(i-1)) + f(t(i),y_0))/2;
        %
        y2(i) = y2(i-1) + h * phi;      % corrector
    end
    %
    plot(t,y2,'o','LineWidth',1,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',6)
%
% Midpoint method 
%   Predcitor + corrector
    y3 = zeros(1,length(t));
    y3(1) = 2;       % initial condition
    %
    for i = 2:n
        phi_p = f(t(i-1),y3(i-1)); 
        y_0 = y3(i-1) + h/2 * phi_p;     % predcitor at the midpoint
        %
        phi = f(t(i-1)+h/2,y_0);
        %
        y3(i) = y3(i-1) + h * phi;      % corrector
    end
    %
    plot(t,y3,'o','LineWidth',1,...
                       'MarkerEdgeColor','m',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',8)
%
% Classical 4th-order Runge-Kutta method 
%   Predcitor + corrector
    y4 = zeros(1,length(t));
    y4(1) = 2;       % initial condition
    %
    for i = 2:n
        k1 = f(t(i-1),y4(i-1)); 
        k2 = f(t(i-1)+h/2,y4(i-1)+k1*h/2); 
        k3 = f(t(i-1)+h/2,y4(i-1)+k2*h/2); 
        k4 = f(t(i-1)+h,y4(i-1)+k3*h); 
        %
        phi = (k1+2*k2+2*k3+k4)/6; 
        %
        y4(i) = y4(i-1) + h * phi;
    end
    %
    plot(t,y4,'s','LineWidth',1,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',10)

% MATLAB ode 45
    y0 = 2;     
    span = linspace(0,5,11);
    
    [t,y5] = ode45(f, span, y0); 
    
    plot(t,y5,'s','LineWidth',1,...
                       'MarkerEdgeColor','b',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',6)
