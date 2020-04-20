% ����
clc;

% ��һ��
A = [3, 2, 2; 2, 4, 6; 1, 3, 3];
fprintf('A������ʽֵ(��ֵ��): %d\n', det(A));
fprintf('A������ʽֵ(������): %d\n', det(sym(A)));
fprintf('A�ļ�(��ֵ��): %d\n', trace(A));
fprintf('A�ļ�(������): %d\n', trace(sym(A)));
fprintf('A����(��ֵ��): %d\n', rank(A));
fprintf('A����(������): %d\n', rank(sym(A)));
[V, D] = eig(A);
[V_sym, D_sym] = eig(sym(A));
fprintf('A������ֵ(��ֵ��): \n');
disp(D);
fprintf('A������ֵ(������): \n');
disp(D_sym);
fprintf('A����������(��ֵ��): \n');
disp(V);
fprintf('A����������(������): \n');
disp(V_sym);
A_inv = inv(A);
A_syminv = inv(sym(A));
fprintf('A�������(��ֵ��): \n');
disp(A_inv);
fprintf('A�������(������): \n');
disp(A_syminv);

%�ڶ���
A = [1 3 5 7; 2 4 6 8];
[L, A1, M] = svd(A)
[L_sym, A1_sym, M_sym] = svd(sym(A))

%������
A = [-2 0.5 -0.5 0.5; 0 -1.5 0.5 -0.5; 2 0.5 -4.5 0.5; 2 1 -2 -2];
[V, J] = jordan(A)
[V_sym, J_sym] = jordan(sym(A))

% ���������
clear;