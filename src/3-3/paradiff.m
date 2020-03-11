function [result] = paradiff(y, x, t, n)
%paradiff 求解参数方程n阶导数((d^n)y/(dx)^n)
%   y: 方程1
%   x: 方程2
%   t: 参数
%   n: 求导阶次

if mod(n, 1) ~= 0
    error('n should positive integer, please correct')
else
    if n == 1
        result = diff(y, t)/diff(x, t);
    else
        result = diff(paradiff(y, x, t, n-1), t)/diff(x, t);
    end
end
end

