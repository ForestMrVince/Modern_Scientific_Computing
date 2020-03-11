function [FibonacciSeries] = MyFibonacci(n)
%MyFibonacci ����Fibonacci���е�ǰn��
%   �����˵ݹ����
if n < 1 || abs(n - floor(n)) > eps
    error('n ������һ������0������');
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