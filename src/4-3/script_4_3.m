% 1、方阵的-1次方和inv求解出的逆矩阵相等；（前提是该方阵不是奇异矩阵，因为奇异矩阵使用符号化后求解结果失败；直接对奇异矩阵求-1次方，所得结果说明，该操作其实是在尝试求逆矩阵而非伪逆矩阵）
% 2、当矩阵不是奇异矩阵时，pinv和inv结果相等；

size_num = 5;
A = sym('a%d%d',size_num);
A_inv = inv(A);
A_1 = A^-1;
equal_result = sum(sum(abs(A_inv - A_1)), 2);
% sum(A, 2)表示 A 矩阵的所有行求和, sum(A) 表示A的所有列求和
% 所以此处是将两个运算结果相减，并将所有元素求和，为的是证明相减结果为 0 矩阵
% 其实用以下代码也可实现相同的效果(不唯一)
%    equal_result = norm(A_inv - A_1, 'fro');
% 参考资料来自: https://blog.csdn.net/zaishuiyifangxym/article/details/81673491
if equal_result == 0
    disp('方阵的-1次方和inv求解出的逆矩阵相等');
end

B = [16 2 3 13; 5 11 13 8; 9 7 6 12; 4 14 15 1]; % B 是一个非奇异矩阵
B_sym = sym(B);
B_inv = inv(B_sym);
B_1 = pinv(B_sym);
equal_result = sum(sum(abs(B_inv - B_1)), 2);
if equal_result == 0
    disp('非奇异矩阵的pinv和inv求解出的逆矩阵相等');
end

size_row_1 = 3; % 后两个代码段请单独运行
size_row_2 = 4;
C = sym('b%d%d', [size_row_1, size_row_2]);
C_inv = pinv(C);
C_1 = C^-1;
equal_result = sum(sum(abs(C_inv - C_1)), 2);
if equal_result == 0
    disp('矩阵的-1次方和inv求解出的逆矩阵/伪逆矩阵相等');
end

D = [16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];% ppt里的奇异矩阵
D_sym = sym(D);
D_pinv = pinv(D_sym);
D_1 = D_sym^-1;
equal_result = sum(sum(abs(D_pinv - D_1)), 2);
if equal_result == 0
    disp('奇异矩阵的pinv和"^-1"求解出的伪逆矩阵相等');
end
