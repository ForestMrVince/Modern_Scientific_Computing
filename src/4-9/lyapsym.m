function [X] = lyapsym(A, B, C)
% lyapsym ���Lyapunov���̻�Sylvester���̵Ľ�����
%   Lyapunov������ʽ: A * X + X * A.' = -C
%   Sylvester������ʽ: A * X + X * B = -C
%   ����: 
%       A: �緽����ʽ��ʾ
%       B: �緽����ʽ��ʾ
%       C: �緽����ʽ��ʾ
%   ���: 
%       X: �緽����ʽ��ʾ

if nargin == 2, C = B; B = A'; end
[nr, nc] = size(C);
A0 = kron(A, eye(nc)) + kron(eye(nr), b.');
try
    C1 = C.'; x0 = -inv(A0) * C1(:); X = reshape(x0, nc, nr);
catch
    error('singular matrix found.');
end

