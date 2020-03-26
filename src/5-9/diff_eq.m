function [y] = diff_eq(A, B, y0, U, d)
% diff_eq ���һ���ַ���
% ʾ�������: �� 5-9 ppt �� 7 ҳ
%   ����: 
%       A: y��ϵ������
%       B: u��ϵ������
%       y0: ��ʼֵ����
%       U: �����źŵ�z�任
%       d: ��ʱ
%   ���: 
%       y: �����y����

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

