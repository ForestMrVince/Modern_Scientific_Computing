% 第一题
% 参考资料: https://blog.csdn.net/lynn15600693998/article/details/86597068
% 微分方程解法: https://wenku.baidu.com/view/ddf17d2acfc789eb172dc8f7.html
% 答: 采用dsolve函数直接求出解析解，也可以利用ode系列函数求数值解，下面答案利用了dsolve函数，求解出了本题给出的方程组的解。
equations = 'D2x - x + y + z = 0, x + D2y - y + z = 0, x + y + D2z - z = 0';
conditions = 'x(0) = 1, Dx(0) = 0, y(0) = 0, Dy(0) = 0, z(0) = 0, Dz(0) = 0';
[x, y, z] = dsolve(equations, conditions);
fprintf('x = ');
disp(x);
fprintf('y = ');
disp(y);
fprintf('z = ');
disp(z);

% 第二题
% 答: 该函数不能应用polse，所以采用了循环方式判定z=0的重数，并根据公式计算了对应留数，即r_0。
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