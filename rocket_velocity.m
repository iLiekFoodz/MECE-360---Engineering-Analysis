function v = rocket_velocity(t)
    
    v = zeros(size(t));
    
    
    idx1 = (t >= 0) & (t < 8);
    v(idx1) = 10 * t(idx1).^2 - 5;
    
    idx2 = (t >= 8) & (t < 16);
    v(idx2) = 624 - 3 * t(idx2);
    
    idx3 = (t >= 16) & (t < 26);
    v(idx3) = 36 * t(idx3) + 12 * (t(idx3) - 16).^2;
    
    
    idx4 = (t > 26);
    v(idx4) = 2136 * exp(-0.1 * (t(idx4) - 26));
end
