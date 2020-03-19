function [F] = funmsym(A, fun, x)
% funmsym 计算矩阵函数的符号函数
% 调用示例: F = funmsym(sym(A), exp(x * cos(x * t)), x)
%   输入: 
%       A: 目标矩阵
%       fun: 代换函数
%       x: 代换变量
%   输出: 
%       F: 输出的矩阵函数

[V, T] = jordan(A);
vec = diag(T); v1 = [0, diag(T, 1)', 0]; v2 = find(v1 == 0);
v_n = v2(2:end) - v2(1:end - 1); lam = vec(v2(1:end - 1));
vec(v2(1:end - 1)); m = length(lam); F = sym([]);
for i = 1 : m, k = v2(i) : v2(i) + v_n(i) - 1; J1 = T(k, k);
    fJ = funJ(J1, fun, x); F(k, k) = fJ;
end
F = V * F * inv(V);
function [fJ] = funJ(J, fun, x)
% funJ 核心函数
%   详细说明: 待更新
lam = J(1, 1); f1 = fun; fJ = subs(fun, x, lam) * eye(size(J));
H = diag(diag(J, 1), 1); H1 = H;
for i = 2 : length(J), f1 = diff(f1, x); a1 = subs(f1, x, lam);
    fJ = fJ + a1 * H1; H1 = H1 * H / i;
end
