clc; clear;
% 函数: y = p(x)
% Riccati 微分方程: diff(p) = A.'*p + p*A + P*B*p + C

A = [6, 6, 17; 1, 0, -1; -1, 0, 0];
B = [0, 0, 0; 0, 4, 2; 0, 2, 1];
C = [1, 2, 0; 2, 8, 0; 0, 0, 4];

Riccati = @(x, y, A, B, C) reshape(A.'*reshape(y, size(A)) + ...
    reshape(y, size(A))*A + reshape(y, size(A))*B*reshape(y, size(A)) + C,...
    length(A(:)), 1);

y_0_5 = [1, 0, 0; 0, 3, 0; 0, 0, 5];   % 没办法用0.5，只能用0_5
[x, y] = ode45(Riccati, [0.5, 0], y_0_5(:), [], A, B, C);
plot(x, y);