%fplot
sym x
y = sin(x);
fplot(y, [-pi pi]);

%fimplicit
syms x y;
Y = sin(x) - y;
fimplicit(Y,[-pi pi]);

%polarplot
theta = 0 : 0.01 : 6*pi;
rho = 5 * sin(4 * theta / 3);
polarplot(theta, rho);

% ͨ��ezplot��ͼ���ҵ��������⣬����ֱ�ԼΪ(0.4, -0.896)��(1.6, 0.808)��
% ����Σ�
syms x y
Equation1 = (x^2) + (y^2) - (3*x*(y^2));
Equation2 = (x^3) - (x^2) - (y^2) - y;
ezplot(Equation1,[-2, 4]);
hold on
ezplot(Equation2,[-2, 4]);
hold off;
text(0.4, -0.896, '��1: (0.4, -0.896)')
text(1.6, 0.808, '��2: (1.6, 0.808)')
title('����������������ͼ');