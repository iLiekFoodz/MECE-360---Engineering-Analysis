function [y_int] = Newton_Int_poly(x, f, xx)
n = length(x);
b = f(:); 

for j = 2:n
    for i = n:-1:j
        b(i) = (b(i) - b(i-1)) / (x(i) - x(i-j+1));
    end
end

y_int = b(n) * ones(size(xx));
for i = n-1:-1:1
    y_int = b(i) + (xx - x(i)) .* y_int;
end
end
