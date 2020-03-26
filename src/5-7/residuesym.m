function [r, p, m] = residuesym(f, a, b)
% residuesym ���㼫��������
% ʾ�������: 
% >> syms z; f=sin(z+pi/3)*exp(-2*z)/(z^3*(z-1)); F1=limit(diff(f*z^3,z,2)/prod(1:2),z,0), F2=limit(f*(z-1),z,1); [r,p,m]=residuesym(f)
%   ����:
%       f: Ŀ�꺯��
%       a: �뺯��poles��ͬ
%       b: �뺯��poles��ͬ
%   ���: 
%       r: ��������
%       p: ��������
%       f: ������������

z = symvar(f);
if nargin == 1
    [p, m] = poles(f);
else
    [p, m] = poles(f, a, b);
end
for k = 1 : length(p)
    r(k) = limit(diff(f * (z - p(k)) ^ m(k), z, m(k) - 1)...
    / factorial(m(k) - 1), z, p(k));
end
end