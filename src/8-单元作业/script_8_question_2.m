% 需要注意的是, 代码段中同时包含interp3和样条插值两种插值方法, 
% 因此有上下两个绘制误差的语句, 上下两处绘制误差图像, 
% 不能同时使用, 若需使用一个, 请将另一个注释掉.
% 注：vol_visual4d, 引用自《高等应用数学问题的MATLAB?求解 第四版》
% 辅助教学资源中“MATLAB代码.rar”所包含的文件。
% 参考资料(其中例题8-10): http://www.doc88.com/p-9095269484567.html

clear; clc;
% 函数: val = V(x, y, z) = exp(-x*y - y*x - z*y) * cos((x^2)*y*z + (z^2)*y*x)
V = @(x, y, z) exp(-x.*z - y.*x - z.*y) .* cos((x.^2).*y.*z + (z.^2).*y.*x);

% 原函数
original_mark = 0 : 0.1 : 4;
[x, y, z] = meshgrid(0 : 0.1 : 4);
val = V(x, y, z);

% 生成样本点
sample_mark = 0: 0.3 : 4; % 样本点网格标志
[x0, y0, z0] = meshgrid(sample_mark);
val0 = V(x0, y0, z0);

% interp3拟合
spline_interp = interp3(x0, y0, z0, val0, x, y, z, 'spline');
% 此处可以选择: 默认(线性插值), pchip, nearest, spline; 自行选择
vol_visual4d(x, y, z, spline_interp - val);% 绘制误差图像

% 样条插值拟合
[x_nd, y_nd, z_nd, val_nd] = mesh2nd(x, y, z, val); % 将meshgrid转换为ndgrid
[x_nd0, y_nd0, z_nd0, val_nd0] = mesh2nd(x0, y0, z0, val0);

sp1 = csapi({sample_mark, sample_mark, sample_mark}, val_nd0); % 计算样条插值
sp1_result = fnval(sp1, {original_mark, original_mark, original_mark});
sp2 = spapi({5, 5, 5}, {sample_mark, sample_mark, sample_mark}, val_nd0);
sp2_result = fnval(sp1, {original_mark, original_mark, original_mark});

sp_result = sp1_result; % 选择要检视的结果, 当前选择的是三次样条插值的误差
[x_mesh, y_mesh, z_mesh, err_mesh] = mesh2nd(x_nd, y_nd, z_nd, sp_result - val_nd);
vol_visual4d(x_mesh, y_mesh, z_mesh, err_mesh); % 绘制误差图像


function [x1,y1,z1,v1]=mesh2nd(x,y,z,v)
switch nargin
    case 3, x1=x.'; y1=y.'; z1=z.';
    case 4, z1=z; 
        for i=1:size(x,3) 
            x1(:,:,i)=x(:,:,i).'; y1(:,:,i)=y(:,:,i).'; v1(:,:,i)=v(:,:,i).'; 
        end
    otherwise, error('Error in input arguments')
end  
end
