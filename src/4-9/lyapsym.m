function [X] = lyapsym(A, B, C)
% lyapsym 求解Lyapunov方程或Sylvester方程的解析解
%   Lyapunov方程形式: A * X + X * A.' = -C
%       调用示例: lyapsym(sym(A), C)
%   Sylvester方程形式: A * X + X * B = -C
%       调用示例: lyapsym(sym(A), B, C)
%   输入: 
%       A: 如方程形式所示
%       B: 如方程形式所示
%       C: 如方程形式所示
%   输出: 
%       X: 如方程形式所示

if nargin == 2, C = B; B = A'; end
[nr, nc] = size(C);
A0 = kron(A, eye(nc)) + kron(eye(nr), b.');
try
    C1 = C.'; x0 = -inv(A0) * C1(:); X = reshape(x0, nc, nr);
catch
    error('singular matrix found.');
end

