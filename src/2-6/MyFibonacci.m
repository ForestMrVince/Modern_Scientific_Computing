function [FibonacciSeries] = MyFibonacci(n)
%MyFibonacci 计算Fibonacci序列的前n项
%   采用了递归调用
if n < 1 || abs(n - floor(n)) > eps
    error('n 必须是一个大于0的整数');
end

if n > 2
    FibonacciSeries_Pre = MyFibonacci(n - 1);
    FibonacciSeries = [FibonacciSeries_Pre, FibonacciSeries_Pre(end-1)...
        + FibonacciSeries_Pre(end)];
elseif n == 2
    FibonacciSeries_Pre = MyFibonacci(n - 1);
    FibonacciSeries = [FibonacciSeries_Pre, 1];
else
    FibonacciSeries = [1];
end
end