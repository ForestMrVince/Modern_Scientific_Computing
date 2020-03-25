function [H] = hankel_trans(f, w, nu, varargin)
% hankel_trans 数值Hankel变换
% 示例代码段: 
% >> syms t w a positive; f=exp(-a^2*t^2/2); F=int(f*t*besselj(0,w*t),t,0,inf); F=simplify(F); f1=int(w*F*besselj(0,w*t),w,0,inf)   
% >> F1=subs(F,a,2); ezplot(F1,[0,10]); a=2; f=@(t)exp(-a^2*t.^2/2); w=0:0.4:10; for i=0:4, H=hankel_trans(f,w,i); line(w,H); end
%   输入: 
%       f: 目标函数
%       w: w的采样点向量
%       nu: 阶次
%   输出: 
%       H: w的采样点向量对应的H函数值

F = @(t)t .* f(t) .* besselj(nu, w * t);
H = integral(F, 0, Inf, 'ArrayValued', true);
end

