function approx = exp_function_n(x, n)
approx = 0;
for k = 0:(n-1)
    approx = approx + (x^k) / factorial(k);
end
end
