clc; clear; close all;

% Part 1a

x = 5;          
n_terms = 10;   

term_idx = (1:n_terms)';
approx_val = zeros(n_terms, 1);
true_rel_err = zeros(n_terms, 1);
approx_rel_err = zeros(n_terms, 1);

true_val = exp(x);
current_sum = 0;

for i = 1:n_terms
    k = i - 1; 
    term = (x^k) / factorial(k);
    current_sum = current_sum + term;
    approx_val(i) = current_sum;
    
    % True relative error: err = |(e_n - e^x) / e^x|
    true_rel_err(i) = abs((current_sum - true_val) / true_val);
    
    % Approximate relative error: err_rel = |(e_{n+1} - e_n) / e_{n+1}|
    if i > 1
        approx_rel_err(i) = abs((approx_val(i) - approx_val(i-1)) / approx_val(i));
    else
        approx_rel_err(i) = NaN; % No previous term for the first entry
    end
end

ErrorTable = table(term_idx, approx_val, true_rel_err, approx_rel_err, ...
    'VariableNames', {'Num_Terms_n', 'Approximation', 'True_Rel_Err', 'Approx_Rel_Err'});

disp('Maclaurin Series Approximation Table:');
disp(ErrorTable);
