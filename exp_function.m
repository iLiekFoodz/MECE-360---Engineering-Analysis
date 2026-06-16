% Part 1c
function approx = exp_function(x)
tolerance = 1e-6;
approx = 0;
k = 0;

while true
    term = (x^k) / factorial(k);
    next_approx = approx + term;
    
    if k > 0
        err_rel = abs((next_approx - approx) / next_approx);
        if err_rel < tolerance
            approx = next_approx;
            break;
        end
    end
    approx = next_approx;
    k = k + 1;
end
end
