function [H] = hankel_trans(f, w, nu, varargin)
% hankel_trans ��ֵHankel�任
% ʾ�������: 
% >> syms t w a positive; f=exp(-a^2*t^2/2); F=int(f*t*besselj(0,w*t),t,0,inf); F=simplify(F); f1=int(w*F*besselj(0,w*t),w,0,inf)   
% >> F1=subs(F,a,2); ezplot(F1,[0,10]); a=2; f=@(t)exp(-a^2*t.^2/2); w=0:0.4:10; for i=0:4, H=hankel_trans(f,w,i); line(w,H); end
%   ����: 
%       f: Ŀ�꺯��
%       w: w�Ĳ���������
%       nu: �״�
%   ���: 
%       H: w�Ĳ�����������Ӧ��H����ֵ

F = @(t)t .* f(t) .* besselj(nu, w * t);
H = integral(F, 0, Inf, 'ArrayValued', true);
end

