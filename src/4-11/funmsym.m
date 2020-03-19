function [F] = funmsym(A, fun, x)
% funmsym ����������ķ��ź���
% ����ʾ��: F = funmsym(sym(A), exp(x * cos(x * t)), x)
%   ����: 
%       A: Ŀ�����
%       fun: ��������
%       x: ��������
%   ���: 
%       F: ����ľ�����

[V, T] = jordan(A);
vec = diag(T); v1 = [0, diag(T, 1)', 0]; v2 = find(v1 == 0);
v_n = v2(2:end) - v2(1:end - 1); lam = vec(v2(1:end - 1));
vec(v2(1:end - 1)); m = length(lam); F = sym([]);
for i = 1 : m, k = v2(i) : v2(i) + v_n(i) - 1; J1 = T(k, k);
    fJ = funJ(J1, fun, x); F(k, k) = fJ;
end
F = V * F * inv(V);
function [fJ] = funJ(J, fun, x)
% funJ ���ĺ���
%   ��ϸ˵��: ������
lam = J(1, 1); f1 = fun; fJ = subs(fun, x, lam) * eye(size(J));
H = diag(diag(J, 1), 1); H1 = H;
for i = 2 : length(J), f1 = diff(f1, x); a1 = subs(f1, x, lam);
    fJ = fJ + a1 * H1; H1 = H1 * H / i;
end
