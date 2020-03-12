function [I] = path_integral(F, vars, t, a, b)
% path_integral ����һ��͵ڶ������߻��ֵĺ���, ֧�ֶ�ά����ά���ߵĻ���
%   ����: 
%       F:�������� (�� F Ϊ����ʱ, Ϊ��һ�����߻���; �� F Ϊ����ʱ, Ϊ�ڶ������߻���)
%       vars: ���ߵĲ�������
%       t: �������̵Ĳ���
%       a: ������ʼ��
%       b: ������ֹ��
%   ���: 
%       I: ���ֽ��

if length(F) == 1
    I = int(F * sqrt(sum(diff(vars, t) .^ 2)), t, a, b);
else
    F = F(:).'; vars = vars(:); I = int(F * diff(vars, t), t, a, b);
end
end

