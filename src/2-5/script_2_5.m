% ���⣺����ʲô�취��ʾ��pi��ǰʮ��λ�أ�
% ��
% ���ԡ�
% 
% ���ȣ������������������ԭ��
% matlab�������н����cmd��powershell�Լ�linux shellһ�������ܵ�����ϵͳ�����е�������ַ��������ơ�����ֻ���ڵ�ǰ�汾��Windows 10��Windows 10��ÿ�����Ƶ�����ַ�����32768����˵vpa����������vpa(pi,n)������nָ��ʾ����Чλ������ô��ʹ��Ĭ�Ϸ��������ֵʱ��pi��'.'ռһλ��vpa(pi,n)��ȫ����ʾ����ֵ������n_max������ֵΪ32768 - 1 = 32767����ʵ��ֵΪ32766�������ǻ��з�ռ��һλ����Űɣ���
% 
% ������⣺��������ԭ�������ֻ��Ҫ��pi��ǰ����ת��Ϊ�ַ�����Ȼ����зֶ�����������pi��ǰ����λ����

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