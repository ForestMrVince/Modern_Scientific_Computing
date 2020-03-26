function [y] = diff_eq(A, B, y0, U, d)
% diff_eq 求解一般差分方程
% 示例代码段: 见 5-9 ppt 第 7 页
%   输入: 
%       A: y的系数向量
%       B: u的系数向量
%       y0: 初始值向量
%       U: 输入信号的z变换
%       d: 延时
%   输出: 
%       y: 输出的y函数

E = 0; n = length(A) - 1; syms z;
if nargin == 4
    d = 0;
end
m = length(B) - 1; u = iztrans(U); u0 = subs(u, 0 : m-z);
for i = 1 : n
    E = E + A(i) * y0(1 : n + 1 - i) * [z .^ (n + 1 - i : -1 : 1)].';
end
for i = 1 : m
    E = E - B(i) * u0(1 : m + 1 - i) * [z .^ (m + 1 - i : -1 : 1)].';
end
Y = (poly2sym(B, z) * U * z ^(-d) + E)/ploy2sym(A, z);
y = iztrans(Y);
end

