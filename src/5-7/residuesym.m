function [r, p, m] = residuesym(f, a, b)
% residuesym 计算极点与留数
% 示例代码段: 
% >> syms z; f=sin(z+pi/3)*exp(-2*z)/(z^3*(z-1)); F1=limit(diff(f*z^3,z,2)/prod(1:2),z,0), F2=limit(f*(z-1),z,1); [r,p,m]=residuesym(f)
%   输入:
%       f: 目标函数
%       a: 与函数poles相同
%       b: 与函数poles相同
%   输出: 
%       r: 留数向量
%       p: 极点向量
%       f: 极点重数向量

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