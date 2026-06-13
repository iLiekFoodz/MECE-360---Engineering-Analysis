function [x] = Roots_Cubic_Equation(a,b,c)
%
%   This file to determine roots of a cubic equation
%       x^3 + a x^2 + b x + c = 0
%
    % find Q and R
    Q = (a^2 - 3*b)/9
    R = (2*a^3 - 9*a*b + 27*c)/54
%
%   Two possible cases
%   Case (a) R^2 > Q^3: three roots
%   Case (b) R^2 < Q^3: one real root
    if R^2 < Q^3         % Case (a) three roots
        theta = acos(R/sqrt(Q^3));
        %
        %   Three real roots
        x1 = -2*sqrt(Q)*cos(theta/3) - a /3;
        x2 = -2*sqrt(Q)*cos((theta + 2*pi)/3) - a /3;
        x3 = -2*sqrt(Q)*cos((theta - 2*pi)/3) - a /3;
        x = sort([x1, x2, x3]);
    else    
        % Case (b): one real root
        A = - sign(R)*(abs(R) + sqrt(R^2 - Q^3))^(1/3); 
        if A == 0
            B = 0;
        else
            B = Q / A;    
        end
        x1 = (A+B) - a/3;
        x = [x1 0 0];        
    end
end