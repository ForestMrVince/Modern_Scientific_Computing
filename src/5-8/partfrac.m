function [Y] = partfrac(varargin)
% partfrac ���ַ���չ���ķ�������
% ʾ�������: 
% syms s; f=(s^3+2*s^2+3*s+4)/(s^6+11*s^5+48*s^4+106*s^3+125*s^2+75*s+18);
% G1=partfrac(f) %����G1 = partfrac(f, s)
%   ����: 
%       f: Ŀ��������
%       s: ���������еı���
%   ���: 
%       Y: ���ַ�ʽչ�����

Y = feval(symengine, 'partfrac', varargin{:});
end