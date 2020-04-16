% ������x�����㲽��Ϊ0.5��0.1��1��
% ��ʵ�����������������ղ�ֵ����ӽ�ԭ����������ǡ�B������ֵ����
% Ȼ���ǡ�����������ֵ���͡�������ֵ������������ǣ������κ�����ֵ����
% �����Բ�ֵ������������ֵ����

clear; clc;
% ���� y = f(x) = x^2 * exp(-5*x) * sin(x)
f = @(x) x.^2 .* exp(-5.*x) .* sin(x);
hold on;

x = -2 : 0.001 : 4; % ԭ����
y = f(x);
plot(x, y);
title('��ֵ����ͼ');
xlabel('x');
ylabel('y');

x0 = -2 : 0.5 : 4; % ����������
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
spline_interp = interp1(x0, y0, x, 'spline'); % һά������ֵ
sp1 = csapi(x0, y0);    % ����������ֵ
sp1_result = fnval(sp1, x);
sp2 = spapi(5, x0, y0); % B������ֵ
sp2_result = fnval(sp2, x);
plot(x, [spline_interp; sp1_result; sp2_result]);

legend('ԭ����', '������', '�������ղ�ֵ', '���Բ�ֵ', '���κ�����ֵ',...
    '������ֵ', '������ֵ', '����������ֵ', 'B������ֵ');

hold off;

figure;
hold on;

plot(x,[lagrange_interp - y; linear_interp - y; pchip_interp - y;...
    nearest_interp - y; spline_interp - y; sp1_result - y;...
    sp2_result - y]);

legend('�������ղ�ֵ', '���Բ�ֵ', '���κ�����ֵ',...
    '������ֵ', '������ֵ', '����������ֵ', 'B������ֵ');

title('�������ͼ');
xlabel('x');
ylabel('y');
hold off

fprintf('�������ղ�ֵ�в�ƽ����: ');
disp(norm(lagrange_interp - y)^2);
fprintf('���Բ�ֵ�в�ƽ����: ');
disp(norm(linear_interp - y)^2);
fprintf('���κ�����ֵ�в�ƽ����: ');
disp(norm(pchip_interp - y)^2);
fprintf('������ֵ�в�ƽ����: ');
disp(norm(nearest_interp - y)^2);
fprintf('������ֵ�в�ƽ����: ');
disp(norm(spline_interp - y)^2);
fprintf('����������ֵ�в�ƽ����: ');
disp(norm(sp1_result - y)^2);
fprintf('B������ֵ�в�ƽ����: ');
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