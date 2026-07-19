%% Midterm Exam Problem 5 - Nouh Shaikh
clc; clear; close all;

A = [4, -3, 2; 
    2,  4, -3; 
    0,  2, 3];
b = [16; 12; 46];

[x_gauss, L, U] = Gauss_elimination_EA(A, b);
disp('Gauss x:'); disp(x_gauss);
disp('L:'); disp(L);
disp('U:'); disp(U);

y = L \ b;
x_lu = U \ y;
disp('LU x:'); disp(x_lu);

x0 = [0; 0; 0];
[x_seidel] = Gauss_Seidel_EA(A, b, x0);
disp('Gauss-Seidel x:'); disp(x_seidel);
% So Gauss-Seidel's answer is coming out very off