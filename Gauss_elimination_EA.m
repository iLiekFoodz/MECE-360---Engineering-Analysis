% The Gauss elimination method is an algorithmic procedure used to solve a system of linear 
% equations written in matrix form as (Ax = b) and the process is divided
% into two primary phases Forward Elimination and Backward Substitution.
function [x, L, U] = Gauss_elimination_EA(A,b)
n = length(b);
L = eye(n);
U = A;
% a)
for k = 1:n-1
    for i = k+1:n
        factor = U(i,k) / U(k,k);
        L(i,k) = factor;               % c) 
        U(i,:) = U(i,:) - factor * U(k,:); % b) 
        b(i) = b(i) - factor * b(k);   
    end
end

x = zeros(n, 1); % d) 
for i = n:-1:1
    x(i) = (b(i) - U(i, i+1:end) * x(i+1:end)) / U(i,i);
end
end
