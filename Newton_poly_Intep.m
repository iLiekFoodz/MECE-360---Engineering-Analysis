function [fi,b] = Newton_poly_Intep(x,f,xi)


    n = length(x);  % number of data points
    %
    b = zeros(n,n);
    %
    % first column
    b(:,1) = f(:);
    %
    % set up other elements in the matrix
    for j = 2:n
        for i = 1:n-j+1
            b(i,j)=(b(i+1,j-1) - b(i,j-1))/(x(i+j-1) - x(i)); 
        end
    end
    %disp(b)
% interpolation for xi
    %xi = 2;
    %
    fi = f(1);
    xk = 1;
    for k = 2:n
        xk = xk.*(xi - x(k-1)); 
        fi = fi + b(1,k).*xk;
    end
%     %
%     plot(xi,fi,'bs')
%     %
%     hold off
end