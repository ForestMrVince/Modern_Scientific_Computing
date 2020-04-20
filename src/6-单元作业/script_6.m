% 第一题
% 答：
% 穷举法优点：
% 1、能保证得出全局最优值；
% 2、除了得出最优值，还能得出次最优值等数值；
% 3、不区分线性/非线性规划；
% 穷举法缺点：
% 1、不能求解规模过大的问题，因为规模过大的问题会使用大量内存资源，或者使用过久的求解时间，使问题对计算机的要求过高，甚至远超当前计算机的计算能力。
% 2、只能用于求解可行解数量有限的问题，可行解数量无限的问题穷举也穷举不完。

% 第二题
clear;
P.solver = 'linprog';
P.options = optimoptions('linprog');
P.lb = [0; 0; 0];
P.f = [-2, -3, 5];
P.Aineq = [-2, 5, -1;...
    1, 3, 1];
P.Bineq = [-10, 12];
P.Aeq = [1, 1, 1];
P.Beq = [7];
[x, f_opt, key, c] = linprog(P);
if(key == 1)
    disp('求解成功！！！');
    disp('函数最优值为：');
    disp(-f_opt);
    disp('最优决策变量为：');
    disp(x);
else
    disp('求解失败');
end


% 第三题
% 求解问题
clear;
P.solver = 'intlinprog';
P.options = optimoptions('intlinprog');
P.lb = [0; 0; 0; 0; 0];
P.ub = [1; 1; 1; 1; 1];
P.f = [5, 7, 10, 3, 1];
P.Aineq = [-1, 1, -5, -1, 4;...
    2, -6, 3, 2 -2;...
    0, -2, 2, -1, -1];
P.Bineq = [-2, 0, 1];
P.intcon = [1, 2, 3, 4, 5];
I = [1, 2, 3, 4, 5];
[x, f, a, b] = intlinprog(P);
x(I) = round(x(I)); % 最优决策变量
f_min_I = P.f * x;  % 最有函数值
% 穷举法求解
[x1, x2, x3, x4, x5] = ndgrid(0:1, 0:1, 0:1, 0:1, 0:1);
i = find((x1 - x2 + 5*x3 + x4 - 4*x5 >= 2)...
    & (-2*x1 + 6*x2 - 3*x3 - 2*x4 + 2*x5 >= 0)...
    & (-2*x2 + 2*x3 - x4 - x5 <= 1));
x1 = x1(i); x2 = x2(i); x3 = x3(i); x4 = x4(i); x5 = x5(i);
f_org = 5*x1 + 7*x2 + 10*x3 + 3*x4 + x5;
[fmin, ii] = sort(f_org);
in = ii(1);
x_min = [x1(in); x2(in); x3(in); x4(in); x5(in)]; % 最优决策变量
f_min = fmin(in);                                 % 最有函数值
% 验证结果
if norm(x - x_min) == 0 % 判断一致性
    disp('决策变量求解正确！！！');
end
if f_min_I == f_min     % 判断一致性
    disp('函数最优值求解正确！！！');
end