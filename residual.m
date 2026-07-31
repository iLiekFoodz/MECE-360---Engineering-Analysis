function r = residual(za)

    x0 = 0;
    xf = 1;

    y0 = 1;
    yf_target = 0.5;
    [~,y] = ode45(@dydx,[x0 xf],[y0; za]);
    yf_calculated = y(end,1);
    r = yf_calculated - yf_target;

end