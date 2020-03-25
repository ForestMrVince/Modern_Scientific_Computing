function [F] = mellin_trans(f, z, varargin)
% mellin_trans ��ֵMellin�任
% ʾ�������: 
% >> syms t z; syms a positive,f=log(z)/(t+a);M=int(f*t^(z-1),t,0,inf)
% >> f=@(x)sin(3*x.^0.8)./(x+2).^1.5;z=0:0.05:1; F=mellin_trans(f,z); plot(z,F)
%   ����:
%       f: Ŀ�꺯��
%       z: z�Ĳ���������
%   ���: 
%       F: z�Ĳ�����������Ӧ��F����ֵ

f1 = @(x)f(x) .* x .^ (z - 1);
F = integral(f1, 0, Inf, 'ArrayValued', true, varargin{:});
end
