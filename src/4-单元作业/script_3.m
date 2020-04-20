% 清屏
clc;

% 第一题
A = [3, 2, 2; 2, 4, 6; 1, 3, 3];
fprintf('A的行列式值(数值解): %d\n', det(A));
fprintf('A的行列式值(解析解): %d\n', det(sym(A)));
fprintf('A的迹(数值解): %d\n', trace(A));
fprintf('A的迹(解析解): %d\n', trace(sym(A)));
fprintf('A的秩(数值解): %d\n', rank(A));
fprintf('A的秩(解析解): %d\n', rank(sym(A)));
[V, D] = eig(A);
[V_sym, D_sym] = eig(sym(A));
fprintf('A的特征值(数值解): \n');
disp(D);
fprintf('A的特征值(解析解): \n');
disp(D_sym);
fprintf('A的特征向量(数值解): \n');
disp(V);
fprintf('A的特征向量(解析解): \n');
disp(V_sym);
A_inv = inv(A);
A_syminv = inv(sym(A));
fprintf('A的逆矩阵(数值解): \n');
disp(A_inv);
fprintf('A的逆矩阵(解析解): \n');
disp(A_syminv);

%第二题
A = [1 3 5 7; 2 4 6 8];
[L, A1, M] = svd(A)
[L_sym, A1_sym, M_sym] = svd(sym(A))

%第三题
A = [-2 0.5 -0.5 0.5; 0 -1.5 0.5 -0.5; 2 0.5 -4.5 0.5; 2 1 -2 -2];
[V, J] = jordan(A)
[V_sym, J_sym] = jordan(sym(A))

% 清除工作区
clear;