%EA_HW_3_1&2 Nouh Shaikh
clc; clear; close all;

%% Problem 1:

% 1:
A = [ 2,  3,  1, -1;
      5, -2,  5, -4;
      1, -2,  3, -3;
      3, -8, -1,  1];
b = [1; 5; 3; -1];

fprintf('--- Step 1: Matrix A and Vector b ---\n');
disp('A ='); disp(A);
disp('b ='); disp(b);

% 2:
Aug = [A, b];
fprintf('\n--- Step 2: Augmented Matrix [A|b] ---\n');
disp('Aug ='); disp(Aug);

% 3:
n = size(A, 1);
L = eye(n); 
U_aug = Aug;

for j = 1:n-1
    for i = j+1:n
        multiplier = U_aug(i,j) / U_aug(j,j);
        L(i,j) = multiplier; 
        U_aug(i, j:end) = U_aug(i, j:end) - multiplier * U_aug(j, j:end);
    end
end

U = U_aug(:, 1:n);
b_prime = U_aug(:, end);

fprintf('\n--- Step 3: Upper Triangular Matrix U and Multipliers ---\n');
disp('U ='); disp(U);
disp('L (Multipliers matrix) ='); disp(L);

% 4:
x_back = zeros(n, 1);
for i = n:-1:1
    x_back(i) = (b_prime(i) - U(i, i+1:end) * x_back(i+1:end)) / U(i,i);
end
fprintf('\n--- Step 4: Back Substitution Solution ---\n');
disp('x ='); disp(x_back);

% 5:
A_check = L * U;
fprintf('\n--- Step 5: Verification (A = L * U) ---\n');
disp('L * U ='); disp(A_check);

% 6: 
d = zeros(n, 1);
for i = 1:n
    d(i) = (b(i) - L(i, 1:i-1) * d(1:i-1)) / L(i,i);
end

x_lu = zeros(n, 1);
for i = n:-1:1
    x_lu(i) = (d(i) - U(i, i+1:end) * x_lu(i+1:end)) / U(i,i);
end

fprintf('\n--- Step 6: LU Factorization Solution ---\n');
disp('d ='); disp(d);
disp('x (via LU) ='); disp(x_lu);

% 7:
x_div = A \ b;
fprintf('\n--- Step 7: MATLAB Left Division Solution ---\n');
disp('x (via A \ b) ='); disp(x_div);


%% Problem #2:
fprintf('--- Problem #2: Matrix Inverse via LU ---\n');

I_mat = eye(n);
A_inv = zeros(n, n);

for col = 1:n
    e_i = I_mat(:, col);
    
    d_i = zeros(n, 1);
    for i = 1:n
        d_i(i) = (e_i(i) - L(i, 1:i-1) * d_i(1:i-1)) / L(i,i);
    end
    
    x_i = zeros(n, 1);
    for i = n:-1:1
        x_i(i) = (d_i(i) - U(i, i+1:end) * x_i(i+1:end)) / U(i,i);
    end
    
    A_inv(:, col) = x_i;
end

fprintf('\nComputed Inverse Matrix A^-1:\n');
disp(A_inv);

fprintf('MATLAB Native inv(A) for comparison:\n');
disp(inv(A));

x_from_inv = A_inv * b;

fprintf('\nVerification: Solution vector {x} via A^-1 * b:\n');
disp(x_from_inv);

fprintf('Original solution vector {x} from Problem 1:\n');
disp(x_back);

difference = norm(x_from_inv - x_back);
fprintf('Absolute numerical difference between the two methods: %e\n', difference);
