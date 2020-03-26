function [Y] = partfrac(varargin)
% partfrac 部分分数展开的符号运算
% 示例代码段: 
% syms s; f=(s^3+2*s^2+3*s+4)/(s^6+11*s^5+48*s^4+106*s^3+125*s^2+75*s+18);
% G1=partfrac(f) %或者G1 = partfrac(f, s)
%   输入: 
%       f: 目标有理函数
%       s: 声明函数中的变量
%   输出: 
%       Y: 部分分式展开结果

Y = feval(symengine, 'partfrac', varargin{:});
end