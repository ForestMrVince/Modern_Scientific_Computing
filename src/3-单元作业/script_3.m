syms x y z;

%第一题
f_1 = (exp(x.^3) - 1) ./ (1 - cos(sqrt(x-sin(x))));
result_1 = limit(f_1, x, 0, 'left');
disp(result_1);

%第二题
f_2 = sin((x .^ 3) .* y) .* exp(-z);
f_diff_x2yz = simplify(diff(diff(diff(f_2, x, 2), y), z));
disp(f_diff_x2yz);

%第三题
step = 0.000001;
x_3 = 0:step:pi;
y_3_cos = cos(x_3);
y_3_sin = sin(x_3);
I_cos = trapz(x_3, y_3_cos);
I_sin = trapz(x_3, y_3_sin);
disp(I_cos);
disp(I_sin);