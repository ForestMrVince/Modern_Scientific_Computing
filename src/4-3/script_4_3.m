size_num = 5;
A = sym('a%d%d',size_num);
A_inv = inv(A);
A_1 = A^-1;
equal_result = sum(sum(abs(A_inv - A_1)), 2);
% sum(A, 2)��ʾ A ��������������, sum(A) ��ʾA�����������
% ���Դ˴��ǽ������������������������Ԫ����ͣ�Ϊ����֤��������Ϊ 0 ����
% ��ʵ�����´���Ҳ��ʵ����ͬ��Ч��(��Ψһ)
%    equal_result = norm(A_inv - A_1, 'fro');
% �ο���������: https://blog.csdn.net/zaishuiyifangxym/article/details/81673491
if equal_result == 0
    disp('�����-1�η���inv��������������');
end

B = [16 2 3 13; 5 11 13 8; 9 7 6 12; 4 14 15 1]; % B ��һ�����������
B_sym = sym(B);
B_inv = inv(B_sym);
B_1 = pinv(B_sym);
equal_result = sum(sum(abs(B_inv - B_1)), 2);
if equal_result == 0
    disp('����������pinv��inv��������������');
end

size_row_1 = 3; % ������������뵥������
size_row_2 = 4;
C = sym('b%d%d', [size_row_1, size_row_2]);
C_inv = pinv(C);
C_1 = C^-1;
equal_result = sum(sum(abs(C_inv - C_1)), 2);
if equal_result == 0
    disp('�����-1�η���inv�����������/α��������');
end

D = [16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];% ppt����������
D_sym = sym(D);
D_pinv = pinv(D_sym);
D_1 = D_sym^-1;
equal_result = sum(sum(abs(D_pinv - D_1)), 2);
if equal_result == 0
    disp('��������pinv��"^-1"������α��������');
end