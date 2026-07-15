%EA_HW_3_3 Nouh Shaikh
clc; clear; close all;

A3 = [ 0.8, -0.4,  0.0;
    -0.4,  0.8, -0.4;
    0.0, -0.4,  0.8];
b3 = [41; 25; 105];
n3 = length(b3);
tol = 1e-4; 

fprintf('--- Problem #3: Tridiagonal & Iterative ---\n');

%% 3.1: 

diag_b = diag(A3);                  
diag_a = [0; diag(A3, -1)];         
diag_c = [diag(A3, 1); 0];          

c_prime = zeros(n3, 1);
d_prime = zeros(n3, 1);

c_prime(1) = diag_c(1) / diag_b(1);
d_prime(1) = b3(1) / diag_b(1);

for i = 2:n3
    denom = diag_b(i) - diag_a(i) * c_prime(i-1);
    c_prime(i) = diag_c(i) / denom;
    d_prime(i) = (b3(i) - diag_a(i) * d_prime(i-1)) / denom;
end

x_thomas = zeros(n3, 1);
x_thomas(n3) = d_prime(n3);
for i = n3-1:-1:1
    x_thomas(i) = d_prime(i) - c_prime(i) * x_thomas(i+1);
end

fprintf('3.1: Solution via Custom Tridiagonal Solver:\n');
disp(x_thomas);


%% 3.2:
x_gs = zeros(n3, 1); 
max_iter = 1000;
iter_gs = 0;

for k = 1:max_iter
    x_old = x_gs;
    for i = 1:n3
        
        sum_terms = b3(i) - A3(i, :) * x_gs + A3(i, i) * x_gs(i);
        x_gs(i) = sum_terms / A3(i, i);
    end

    iter_gs = iter_gs + 1;
    rel_err = max(abs((x_gs - x_old) ./ x_gs));
    if rel_err < tol
        break;
    end
end

fprintf('3.2: Solution via Gauss-Seidel Method:\n');
fprintf('Iterations to converge: %d\n', iter_gs);
disp(x_gs);


%% 3.3: 
x_sor = zeros(n3, 1); 
lambda = 1.2;
iter_sor = 0;

for k = 1:max_iter
    x_old = x_sor;
    for i = 1:n3
        sum_terms = b3(i) - A3(i, :) * x_sor + A3(i, i) * x_sor(i);
        x_gs_predicted = sum_terms / A3(i, i);
        x_sor(i) = lambda * x_gs_predicted + (1 - lambda) * x_old(i);
    end

    iter_sor = iter_sor + 1;
    rel_err = max(abs((x_sor - x_old) ./ x_sor));
    if rel_err < tol
        break;
    end
end

fprintf('3.3: Solution via Overrelaxation (SOR, lambda = 1.2):\n');
fprintf('Iterations to converge: %d\n', iter_sor);
disp(x_sor);
