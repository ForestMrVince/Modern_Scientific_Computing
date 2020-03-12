function [F, A, B] = fseries(f, x, varargin)
% Fourier 级数展开函数
%   输入: 
%       f: 原函数
%       x: 自变量
%       varargin: 可变数量参数表, 没有给定则使用默认值
%           p: 展开的项数, 默认值: 6
%           a: 给定区间下界, 默认值: -pi
%           b: 给定区间上界, 默认值: pi
%   输出: 
%       F: 原函数 f 的 Fourier 展开
%       A: an, n = 0:p 构成的向量
%       B: bn, n = 1:p 构成的向量

[p, a, b] = default_vals({6, -pi, pi}, varargin{:});
L = (b - a)/2; if (a + b) ~= 0, f = subs(f, x, x + L + a); end
A = int(f, x, -L, L) / L; B = []; F = A / 2;
for n = 1:p
    an = int(f * cos(n * pi * x / L), x, -L, L) / L; A = [A, an];
    bn = int(f * sin(n * pi * x / L), x, -L, L) / L; B = [B, bn];
    F = F + an * cos(n * pi * x / L) + bn * sin(n * pi * x / L);
end
if (a + b) ~= 0, F = subs(F, x, x - L - a); end
end

