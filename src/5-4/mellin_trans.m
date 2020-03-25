function [F] = mellin_trans(f, z, varargin)
% mellin_trans 数值Mellin变换
% 示例代码段: 
% >> syms t z; syms a positive,f=log(z)/(t+a);M=int(f*t^(z-1),t,0,inf)
% >> f=@(x)sin(3*x.^0.8)./(x+2).^1.5;z=0:0.05:1; F=mellin_trans(f,z); plot(z,F)
%   输入:
%       f: 目标函数
%       z: z的采样点向量
%   输出: 
%       F: z的采样点向量对应的F函数值

f1 = @(x)f(x) .* x .^ (z - 1);
F = integral(f1, 0, Inf, 'ArrayValued', true, varargin{:});
end
