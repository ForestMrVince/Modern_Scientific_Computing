syms x y C1 C2 C3;

syms f;
f = sym(1);
f_int_x_pre = int(int(f, x) + C1, x);
f_int_x = f_int_x_pre + C2;
f_int_xy_pre = int(f_int_x, y);
f_int_xy = f_int_xy_pre + C3;
disp(simplify(f_int_xy - int(int(int(f, x), x), y)));  %输出1
disp(int(int(int(f, x), x), y));                       %输出2

syms f2;
f2 = sym(1);
f_int_y_pre = int(f, y);
f_int_y = f_int_y_pre + C1;
f_int_yx_pre = int(int(f_int_y, x) + C2, x);
f_int_yx = f_int_yx_pre + C3;
disp(simplify(f_int_yx - int(int(int(f, y), x), x)));  %输出3
disp(int(int(int(f, y), x), x));                       %输出4