function [B] = polyvalmsym(p, A)
% polyvalmsym ʹ�÷������㷽������������ʽ, �Ǻ��� polyvalm �ķ���������ʽ
%   ����: 
%       p: ����ʽ���������е�ϵ��
%       A: ����
%   ���: 
%       B: ����ľ������ʽ

E = eye(size(A)); B = zeros(size(A));
n = length(A);
for i = n + 1 : -1 : 1
    B = B + p(i) * E;
    E = E * A;
end
end

