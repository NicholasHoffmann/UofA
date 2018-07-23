% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course : ENCMP 100
% Assignment: 1A
% Name: Nicholas Hoffmann
% CCID: nrhoffma
% U of A ID: 1509630
% 
% Acknowledgements:
%
% Description:
% This program will show some basic matrix manipulations.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

% Creating a matrix named A
A = [15,99;3,-2];
disp('Matrix A:');
disp(A);

% Creating a matrix named B
B = [2,3;-4,11];
disp('Matrix B:');
disp(B);

% The retrieval of the second row of matrix A
disp('Row 2 in matrix A:');
disp(A(2,:));

% The retrieval of first column in matrix B
disp('Column 1 in matrix B:');
disp(B(:,1));

% The summing of each column in A
disp('Sum of matrix A:');
disp(sum(A(:,:)));

% The adding of matrix A and B
disp('Adding matrices A and B:');
disp(A+B);

% The array multiplication of matrix A and B
disp('Array multiplication of A and B:');
disp(A.*B);

% The matrix multiplication of matrix A and B
disp('Matrix multiplication of A and B:');
disp(A*B);

% The matrix multiplication of matrix B and A
disp('Matrix multiplication of B and A:');
disp(B*A);