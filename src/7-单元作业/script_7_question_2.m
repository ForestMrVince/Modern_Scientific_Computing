% ����bvp5c������⣬�����г�ʼ����ֵ��������guess�����������ҵ����ʵĺ�����
% ���⣬����mathworks�������ĵ�˵��������н�Ļ�������ܲ���Ψһ��
% ��ˣ����𰸲���ѭ���ķ�ʽ�ҵ�����һ���⡣
% ��һ���еĽ����һ�������ͼ���ڶ��ʵĽ���ڶ��������ͼ���ڶ��ʵ�mԼΪ-1.0830��
% ��ÿһ�ʵ�ÿ��ͼ����ɫΪ��߾��Ⱥ����֤���ߣ����Կ���������ȫ�غϣ�����֤�ɹ���
% ���Ҵ򵽰����ϵ�Ŀ��ֵ����
% ���ڽ��Ψһ�ԣ�����Ҳ�����˳��ԣ���Ȼ����ȥȡֵ������֤�����Ψһ�ԡ����ڵ�һ�ʣ���ʼ���y2ȡ����������ǧ����Ȼû���ҵ���x=5ʱy1=3�ĵ㡣���ڵڶ��ʣ�ͼ����m�仯�ܴ󣬵�������m������(-5�� -4)�仹����һ������Ҫ��Ľ⣬�ɼ��ڶ��ʽⲻΨһ��ֻ�費��ѭ�������ҵ�����Ľ⣬���Ҳ��ҵõ����еĽ⣬�Լ����ж��ٸ����ö�֪���������´���ֻ���������룬ֻ�ҵ��˾���0������Ǹ��⡣
clear; clc;
% ���� y = f(x)
% y1 = y;
% y2 = diff(y1) = diff(y);
% ������Ϊ: 
% diff(y1) = y2;
% diff(y2) = diff(y1, 2) = diff(y, 2);
% Y = [y1; y2] = [y, diff(y)];
bvpfcn = @(x, Y, m) [Y(2); m*(2 - Y(1)^2)*Y(2) - 2*Y(1)];

% ��һ��: 
% ����1: m = 1;
% ����2: [1, ?] = f(1); [3, ?] = f(5);
m_Q21 = 1; % �������� 1
options = odeset('RelTol', 1e-3);
search_factor = 47;   % f(0) y2��������, �������ÿ�ʼ�����ĳ�ʼֵ
search_step = 0.001;   % search_factor ����������, Ϊ��ʱ��Ӧ������������
end_accuracy = 0.0001;  % ��������ʱf(5)��y1��3�Ĳ�, ҪС�ڵ��������, ��һ��
final_factor = 0;      % �����������
find_GT3_flag = 0;     % �ҵ�����3��f(5)��־λ, �ҵ�ʱ��1
solve_CPL_flag = 0;    % �����ɱ�־λ, ��������ʱ��1

% Ѱ����������2�Ľ�
search_factor_OLD = search_factor;
while(find_GT3_flag == 0)    % �ҵ�f(5)>3ʱ, f(0)��y2��ֵ
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

while(solve_CPL_flag == 0)    % ϸ�����ҵ����� end_accuracy �Ľ�
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

disp('��ʼ��֤������ȷ�ԣ�����');
options.RelTol = 1e-7;
[T_, Y_] = ode45(bvpfcn, [0 5], [1 final_factor], options, m_Q21);
hold on;
plot(T_, Y_(:,1), '-^');
fprintf('�����⾫�Ⱥ�������� f(5) ��ֵΪ: ');
Error_ = abs(Y(end, 1) - Y_OLD(end, 1));
disp(Error_);
disp('��֤��ɣ�����');

% �ڶ���
% m��(-2,-1)
figure;
options.RelTol = 1e-3;
m_search_factor = -1.1;    % m��������, �ڴ����ó�ʼֵ
m_search_step = 0.0001;   % search_factor ����������, Ϊ��ʱ��Ӧ������������
end_accuracy = 0.0001;   % ��������ʱf(1)��y1��1�Ĳ�, ҪС�ڵ��������, ��һ��
m_final_factor = 0;      % �����������
find_GT1_flag = 0;       % �ҵ�����1��f(1)��־λ, �ҵ�ʱ��1
solve_CPL_flag = 0;      % �����ɱ�־λ, ��������ʱ��1

m_search_factor_OLD = m_search_factor;
while(find_GT1_flag == 0)    % �ҵ�f(1)>1ʱ, m��ֵ
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

disp('��ʼ��֤������ȷ�ԣ�����');
options.RelTol = 1e-7;
[T_, Y_] = ode15s(bvpfcn, [5 0], [3 -2], options, m_final_factor);
hold on;
plot(T_, Y_(:,1), '-^');
fprintf('�����⾫�Ⱥ�������� f(1) ��ֵΪ: ');
Error_ = abs(Y(end, 1) - Y_OLD(end, 1));
disp(Error_);
disp('��֤��ɣ�����');