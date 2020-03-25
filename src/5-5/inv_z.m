function [y] = inv_z(num, den, d, N)
% inv_z z反变换数值求解
% 示例代码段: 参考5-5 ppt中12-14页
%   输入: 
%       num: 分子各项系数
%       den: 分母各项系数
%       d: 延迟系数
%       N: 计算的点数
%   输出: 
%       y: 原函数k取值整数0到N-1时对应的y函数值

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

