clc; clear; close all;
% EA_Inclass_2_1
% Root-finding by Fixed point method

cd = 0.25; g = 9.81; v = 36; t = 4;

fm =@(m) sqrt(g*m/cd).*tanh(sqrt(g*cd./m)*t)-v;

% Make the plot f(m)
m = linspace(60,180,100);
fm_x = fm(m);

plot(m,fm_x, 'LineWidth', 1.5)
axis([60 180 -4 1])
xlabel('Mass of Jumper, m (kg)', 'FontSize',14)
ylabel('f(m)', 'FontSize', 14)
grid on
hold on
plot([40 180], [0 0], 'r--')

%% Inclass activity #2_fixed point
%   Fixed point method (We guess)
    
    m1_old = 60;  %(Kg)   
    m1 = m1_old;
    
    for i = 1:100
        m1 = v^2*cd/g/(tanh(sqrt(g*cd./m1)*t))^2;
        
        err = abs((m1 - m1_old)/m1);
        
        f_rm = fm(m1);
        
        plot(m1, f_rm, 'o','LineWidth',1,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',6)
        pause
        if err < 1e-4, break, end
    end

    xb = incsearch(fm,40,200,20);

    [m,n] = size(xb);

    for i = 1:m

    xL = xb(i,1);   xU = xb(i,2);
    FL = fm(xL);     fU = fm(xU);

    xr_old = xL;
    iter = 0;
        
    fprintf('   iter     xr        err \n')

while (1)
    xr = (xL + xU)/2;
    FR = fm(xr);
    
    iter = iter + 1;
    
    err = abs((xr - xr_old)/xr);
    
    fprintf('%5d %10.3f %10.5f \n',iter, xr, err)
    if err < 1e-4 || iter > 20, break, end
    
    xr_old = xr;
    if sign(FR*FL) > 0
        xL = xr;
    else
        xU = xr;
    end
end
    plot(xr, FR, 'o','LineWidth',2,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','w',...
                       'MarkerSize',10)
        
    end
hold off 