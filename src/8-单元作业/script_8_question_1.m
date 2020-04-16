% 条件：x采样点步长为0.5、0.1或1。
% 从实验结果看出“拉格朗日插值”最接近原函数，其次是“B样条插值”，
% 然后是“三次样条插值”和“样条插值”，最后依次是：“三次函数插值”、
% “线性插值”、“最近点插值”。

clear; clc;
% 函数 y = f(x) = x^2 * exp(-5*x) * sin(x)
f = @(x) x.^2 .* exp(-5.*x) .* sin(x);
hold on;

x = -2 : 0.001 : 4; % 原函数
y = f(x);
plot(x, y);
title('插值曲线图');
xlabel('x');
ylabel('y');

x0 = -2 : 0.5 : 4; % 样本点设置
y0 = f(x0);
plot(x0, y0, 'o');

% lagrange
lagrange_interp = lagrange(x0, y0, x);
plot(x, lagrange_interp);

% Linear
linear_interp = interp1(x0, y0, x);
plot(x, linear_interp);

% pchip
pchip_interp = interp1(x0, y0, x, 'pchip');
plot(x, pchip_interp);

% Nearest
nearest_interp = interp1(x0, y0, x, 'nearest');
plot(x, nearest_interp);

% Spline
spline_interp = interp1(x0, y0, x, 'spline'); % 一维样条插值
sp1 = csapi(x0, y0);    % 三次样条插值
sp1_result = fnval(sp1, x);
sp2 = spapi(5, x0, y0); % B样条插值
sp2_result = fnval(sp2, x);
plot(x, [spline_interp; sp1_result; sp2_result]);

legend('原函数', '样本点', '拉格朗日插值', '线性插值', '三次函数插值',...
    '最近点插值', '样条插值', '三次样条插值', 'B样条插值');

hold off;

figure;
hold on;

plot(x,[lagrange_interp - y; linear_interp - y; pchip_interp - y;...
    nearest_interp - y; spline_interp - y; sp1_result - y;...
    sp2_result - y]);

legend('拉格朗日插值', '线性插值', '三次函数插值',...
    '最近点插值', '样条插值', '三次样条插值', 'B样条插值');

title('误差曲线图');
xlabel('x');
ylabel('y');
hold off

fprintf('拉格朗日插值残差平方和: ');
disp(norm(lagrange_interp - y)^2);
fprintf('线性插值残差平方和: ');
disp(norm(linear_interp - y)^2);
fprintf('三次函数插值残差平方和: ');
disp(norm(pchip_interp - y)^2);
fprintf('最近点插值残差平方和: ');
disp(norm(nearest_interp - y)^2);
fprintf('样条插值残差平方和: ');
disp(norm(spline_interp - y)^2);
fprintf('三次样条插值残差平方和: ');
disp(norm(sp1_result - y)^2);
fprintf('B样条插值残差平方和: ');
disp(norm(sp2_result - y)^2);

function y=lagrange(x0,y0,x)
ii=1:length(x0); y=zeros(size(x));
for i=ii
   ij=find(ii~=i); y1=1;
   for j=1:length(ij) 
      y1=y1.*(x-x0(ij(j)));
   end
   y=y+y1*y0(i)/prod(x0(i)-x0(ij));
end
end