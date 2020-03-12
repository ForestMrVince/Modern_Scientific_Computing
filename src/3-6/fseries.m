function [F, A, B] = fseries(f, x, varargin)
% Fourier ����չ������
%   ����: 
%       f: ԭ����
%       x: �Ա���
%       varargin: �ɱ�����������, û�и�����ʹ��Ĭ��ֵ
%           p: չ��������, Ĭ��ֵ: 6
%           a: ���������½�, Ĭ��ֵ: -pi
%           b: ���������Ͻ�, Ĭ��ֵ: pi
%   ���: 
%       F: ԭ���� f �� Fourier չ��
%       A: an, n = 0:p ���ɵ�����
%       B: bn, n = 1:p ���ɵ�����

[p, a, b] = default_vals({6, -pi, pi}, varargin{:});
L = (b - a)/2; if (a + b) ~= 0, f = subs(f, x, x + L + a); end
A = int(f, x, -L, L) / L; B = []; F = A / 2;
for n = 1:p
    an = int(f * cos(n * pi * x / L), x, -L, L) / L; A = [A, an];
    bn = int(f * sin(n * pi * x / L), x, -L, L) / L; B = [B, bn];
    F = F + an * cos(n * pi * x / L) + bn * sin(n * pi * x / L);
end
if (a + b) ~= 0, F = subs(F, x, x - L - a); end
end

