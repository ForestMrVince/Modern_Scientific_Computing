function [B] = polyvalmsym(p, A)
% polyvalmsym 使用符号运算方法计算矩阵多项式, 是函数 polyvalm 的符号运算形式
%   输入: 
%       p: 多项式按降幂排列的系数
%       A: 矩阵
%   输出: 
%       B: 输出的矩阵多项式

E = eye(size(A)); B = zeros(size(A));
n = length(A);
for i = n + 1 : -1 : 1
    B = B + p(i) * E;
    E = E * A;
end
end

