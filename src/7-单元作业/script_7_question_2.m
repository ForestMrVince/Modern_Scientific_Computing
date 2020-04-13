clear; clc;
% 函数 y = f(x)
% y1 = y;
% y2 = diff(y1) = diff(y);
% 方程组为: 
% diff(y1) = y2;
% diff(y2) = diff(y1, 2) = diff(y, 2);
% Y = [y1; y2] = [y, diff(y)];
bvpfcn = @(x, Y, m) [Y(2); m*(2 - Y(1)^2)*Y(2) - 2*Y(1)];

% 第一问: 
% 条件1: m = 1;
% 条件2: [1, ?] = f(1); [3, ?] = f(5);
m_Q21 = 1; % 满足条件 1
options = odeset('RelTol', 1e-3);
search_factor = 47;   % f(0) y2搜索因子, 这里设置开始搜索的初始值
search_step = 0.001;   % search_factor 的搜索步长, 为正时对应搜索因子增大
end_accuracy = 0.0001;  % 结束搜索时f(5)中y1和3的差, 要小于等于这个数, 的一半
final_factor = 0;      % 最终搜索结果
find_GT3_flag = 0;     % 找到大于3的f(5)标志位, 找到时置1
solve_CPL_flag = 0;    % 求解完成标志位, 当求解完成时置1

% 寻找满足条件2的解
search_factor_OLD = search_factor;
while(find_GT3_flag == 0)    % 找到f(5)>3时, f(0)中y2的值
%     clc;    %test code
%     fprintf('search_factor = ');
%     disp(search_factor);
%     fprintf('search_factor_OLD = ');
%     disp(search_factor_OLD);
    [T, Y] = ode45(bvpfcn, [0 5], [1 search_factor], options, m_Q21);
    if Y(end, 1) > 3
        find_GT3_flag = 1;
    elseif Y(end, 1) == 3
        final_factor = search_factor;
        find_GT3_flag = 1;
        solve_CPL_flag = 1;
    elseif Y(end, 1) < 3
        search_factor_OLD = search_factor;
        search_factor = search_factor + search_step;
    end
end
disp('Q2.1 Step 1 CPL!!!');

while(solve_CPL_flag == 0)    % 细化，找到符合 end_accuracy 的解
%     clc;    %test code
%     fprintf('search_factor = ');
%     disp(search_factor);
%     fprintf('search_factor_OLD = ');
%     disp(search_factor_OLD);
    [T, Y] = ode45(bvpfcn, [0 5], [1 search_factor], options, m_Q21);
    [T_OLD, Y_OLD] = ode45(bvpfcn, [0 5],...
        [1 search_factor_OLD], options, m_Q21);
    if abs(Y(end, 1) - Y_OLD(end, 1)) < end_accuracy
        solve_CPL_flag = 1;
        final_factor = (search_factor + search_factor_OLD)/2;
    else
        search_factor_temp = (search_factor + search_factor_OLD)/2;
        [T_temp, Y_temp] = ode45(bvpfcn, [0 5],...
            [1 search_factor_temp], options, m_Q21);
        if Y_temp(end, 1) < 3
            search_factor_OLD = search_factor_temp;
        elseif Y_temp(end, 1) > 3
            search_factor = search_factor_temp;
        elseif Y_temp(end, 1) == 3
            final_factor = search_factor_temp;
            solve_CPL_flag = 1;
        end
    end
end
% clc;    %test code
disp('Q2.1 Solve CPL!!!');
fprintf('final_factor = ');
disp(final_factor);
[T, Y] = ode45(bvpfcn, [0 5], [1 final_factor], options, m_Q21);
plot(T, Y(:,1), '-o');

disp('开始验证数据正确性！！！');
options.RelTol = 1e-7;
[T_, Y_] = ode45(bvpfcn, [0 5], [1 final_factor], options, m_Q21);
hold on;
plot(T_, Y_(:,1), '-^');
fprintf('提高求解精度后两个解的 f(5) 差值为: ');
Error_ = abs(Y(end, 1) - Y_OLD(end, 1));
disp(Error_);
disp('验证完成！！！');

% 第二问
% m∈(-2,-1)
figure;
options.RelTol = 1e-3;
m_search_factor = -1.1;    % m搜索因子, 在此设置初始值
m_search_step = 0.0001;   % search_factor 的搜索步长, 为正时对应搜索因子增大
end_accuracy = 0.0001;   % 结束搜索时f(1)中y1和1的差, 要小于等于这个数, 的一半
m_final_factor = 0;      % 最终搜索结果
find_GT1_flag = 0;       % 找到大于1的f(1)标志位, 找到时置1
solve_CPL_flag = 0;      % 求解完成标志位, 当求解完成时置1

m_search_factor_OLD = m_search_factor;
while(find_GT1_flag == 0)    % 找到f(1)>1时, m的值
%     fprintf('m_search_factor = ');
%     disp(m_search_factor);
%     fprintf('m_search_factor_OLD = ');
%     disp(m_search_factor_OLD);
    [T, Y] = ode15s(bvpfcn, [5 0], [3 -2], options, m_search_factor);
    if Y(end, 1) > 1
        find_GT1_flag = 1;
    elseif Y(end, 1) == 1
        m_final_factor = m_search_factor;
        find_GT1_flag = 1;
        solve_CPL_flag = 1;
    elseif Y(end, 1) < 1
        m_search_factor_OLD = m_search_factor;
        m_search_factor = m_search_factor + m_search_step;
    end
end
disp('Q2.2 Step 1 CPL!!!');

while(solve_CPL_flag == 0)
    [T, Y] = ode15s(bvpfcn, [5 0], [3 -2], options, m_search_factor);
    [T_OLD, Y_OLD] = ode15s(bvpfcn, [5 0], [3 -2],...
        options, m_search_factor_OLD);
    if abs(Y(end, 1) - Y_OLD(end, 1)) < end_accuracy
        solve_CPL_flag = 1;
        m_final_factor = (m_search_factor + m_search_factor_OLD)/2;
    else
        m_search_factor_temp = (m_search_factor + m_search_factor_OLD)/2;
        [T_temp, Y_temp] = ode15s(bvpfcn, [5 0],...
            [3 -2], options, m_search_factor_temp);
        if Y_temp(end, 1) < 1
            m_search_factor_OLD = m_search_factor_temp;
        elseif Y_temp(end, 1) > 1
            m_search_factor = m_search_factor_temp;
        elseif Y_temp(end, 1) == 1
            m_final_factor = m_search_factor_temp;
            solve_CPL_flag = 1;
        end
    end
end
disp('Q2.2 Solve CPL!!!');
fprintf('m_final_factor = ');
disp(m_final_factor);
[T, Y] = ode15s(bvpfcn, [5 0], [3 -2], options, m_final_factor);
plot(T, Y(:,1), '-o');

disp('开始验证数据正确性！！！');
options.RelTol = 1e-7;
[T_, Y_] = ode15s(bvpfcn, [5 0], [3 -2], options, m_final_factor);
hold on;
plot(T_, Y_(:,1), '-^');
fprintf('提高求解精度后两个解的 f(1) 差值为: ');
Error_ = abs(Y(end, 1) - Y_OLD(end, 1));
disp(Error_);
disp('验证完成！！！');