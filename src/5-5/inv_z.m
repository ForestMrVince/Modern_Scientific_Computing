function [y] = inv_z(num, den, d, N)
% inv_z z���任��ֵ���
% ʾ�������: �ο�5-5 ppt��12-14ҳ
%   ����: 
%       num: ���Ӹ���ϵ��
%       den: ��ĸ����ϵ��
%       d: �ӳ�ϵ��
%       N: ����ĵ���
%   ���: 
%       y: ԭ����kȡֵ����0��N-1ʱ��Ӧ��y����ֵ

if nargin == 2
    d = 0;
end
if nargin <= 3
    N = 10;
end
num(N) = 0;
for i = 1 : N-d
    y(d + i) = num(1) / den(1);
    if length(num) > 1
        ii = 2 : length(den);
        if length(den) > length(num)
            num(length(den)) = 0;
        end
        num(ii) = num(ii) - y(end) * den(ii);
        num(1) = [];
    end
end
end

