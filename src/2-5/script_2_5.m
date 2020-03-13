% 问题：你有什么办法显示出pi的前十万位呢？
% 答：
% 可以。
% 
% 首先，分析出现这种问题的原因：
% matlab的命令行界面和cmd、powershell以及linux shell一样，都受到操作系统命令行当行最大字符数的限制。这里只对于当前版本的Windows 10，Windows 10的每行限制的最大字符数是32768。再说vpa函数，例如vpa(pi,n)，这里n指显示的有效位数。那么在使用默认方法输出数值时，pi的'.'占一位，vpa(pi,n)能全部显示出数值的最大的n_max，理论值为32768 - 1 = 32767，但实测值为32766，可能是换行符占了一位（大概吧）。
% 
% 解决问题：经过上述原因分析，只需要将pi的前任意转化为字符串，然后进行分段输出即可输出pi的前任意位数。

n = 100000;
Pi_sym = vpa(pi, n);
Pi_str = char(Pi_sym);

str = Pi_str;
str_size = size(str,2);
MAX_LINE = 32766;
pointer = 0;
while(str_size > 0)
    if(str_size > MAX_LINE)
        str_temp = str(pointer + 1 : pointer + MAX_LINE);
        disp(str_temp);
        pointer = pointer + MAX_LINE;
    else
        str_temp = str(pointer + 1 : end);
        disp(str_temp);
    end
    str_size = str_size - MAX_LINE;
end
clear str;
clear str_size;
clear pointer;
clear str_temp;