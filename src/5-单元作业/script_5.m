% ��һ��
% �ο�����: https://blog.csdn.net/lynn15600693998/article/details/86597068
% ΢�ַ��̽ⷨ: https://wenku.baidu.com/view/ddf17d2acfc789eb172dc8f7.html
% ��: ����dsolve����ֱ����������⣬Ҳ��������odeϵ�к�������ֵ�⣬�����������dsolve�����������˱�������ķ�����Ľ⡣
equations = 'D2x - x + y + z = 0, x + D2y - y + z = 0, x + y + D2z - z = 0';
conditions = 'x(0) = 1, Dx(0) = 0, y(0) = 0, Dy(0) = 0, z(0) = 0, Dz(0) = 0';
[x, y, z] = dsolve(equations, conditions);
fprintf('x = ');
disp(x);
fprintf('y = ');
disp(y);
fprintf('z = ');
disp(z);

% �ڶ���
% ��: �ú�������Ӧ��polse�����Բ�����ѭ����ʽ�ж�z=0�������������ݹ�ʽ�����˶�Ӧ��������r_0��
syms z f;
f = ((1 - sin(z * exp(-2 * z))) / ((z^7) * sin(z - (pi / 3)))) * ...
    (z^4 + 10 * z^3 + 35 * z^2 + 50 * z + 24);
mflag = 0;
m = 0;
while(mflag == 0)
    m = m + 1;
    mflag = abs(double(limit(diff(((z - 0)^m) * f, m - 1), z, 0))) < Inf;
end
r_0 = limit(diff(f * z^m, m-1) / prod(1 : m-1), z, 0);
fprintf('r_0 = ');
disp(r_0);