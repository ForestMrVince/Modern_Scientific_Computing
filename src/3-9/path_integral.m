function [I] = path_integral(F, vars, t, a, b)
% path_integral 求解第一类和第二类曲线积分的函数, 支持二维和三维曲线的积分
%   输入: 
%       F:被积函数 (当 F 为标量时, 为第一类曲线积分; 当 F 为向量时, 为第二类曲线积分)
%       vars: 曲线的参数方程
%       t: 参数方程的参数
%       a: 参数起始点
%       b: 参数终止点
%   输出: 
%       I: 积分结果

if length(F) == 1
    I = int(F * sqrt(sum(diff(vars, t) .^ 2)), t, a, b);
else
    F = F(:).'; vars = vars(:); I = int(F * diff(vars, t), t, a, b);
end
end

