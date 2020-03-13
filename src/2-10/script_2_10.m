%fimplicit3
syms x y z
f = x * sin(y + (z^2)) + (y^2)*cos(x + z) + z * x * cos(x + (y^2));
fimplicit3(f, [-1 1]);
f1 = x^2 + y^2 + z^2 - 1;
hold on;
fimplicit3(f1, [-1 1]);
hold off;