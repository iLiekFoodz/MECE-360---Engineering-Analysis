function dy = dydx(x, y)
    dy = zeros(2,1);

    dy(1) = y(2);                 % y1' = y2
    dy(2) = -2*y(2) + x*y(1)^2;   % y2' = -2y2 + xy1^2
end