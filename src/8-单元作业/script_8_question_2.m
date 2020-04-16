% ��Ҫע�����, �������ͬʱ����interp3��������ֵ���ֲ�ֵ����, 
% ������������������������, ���������������ͼ��, 
% ����ͬʱʹ��, ����ʹ��һ��, �뽫��һ��ע�͵�.
% ע��vol_visual4d, �����ԡ��ߵ�Ӧ����ѧ�����MATLAB?��� ���İ桷
% ������ѧ��Դ�С�MATLAB����.rar�����������ļ���

clear; clc;
% ����: val = V(x, y, z) = exp(-x*y - y*x - z*y) * cos((x^2)*y*z + (z^2)*y*x)
V = @(x, y, z) exp(-x.*z - y.*x - z.*y) .* cos((x.^2).*y.*z + (z.^2).*y.*x);

% ԭ����
original_mark = 0 : 0.1 : 4;
[x, y, z] = meshgrid(0 : 0.1 : 4);
val = V(x, y, z);

% ����������
sample_mark = 0: 0.3 : 4; % �����������־
[x0, y0, z0] = meshgrid(sample_mark);
val0 = V(x0, y0, z0);

% interp3���
spline_interp = interp3(x0, y0, z0, val0, x, y, z, 'spline');
% �˴�����ѡ��: Ĭ��(���Բ�ֵ), pchip, nearest, spline; ����ѡ��
vol_visual4d(x, y, z, spline_interp - val);% �������ͼ��

% ������ֵ���
[x_nd, y_nd, z_nd, val_nd] = mesh2nd(x, y, z, val); % ��meshgridת��Ϊndgrid
[x_nd0, y_nd0, z_nd0, val_nd0] = mesh2nd(x0, y0, z0, val0);

sp1 = csapi({sample_mark, sample_mark, sample_mark}, val_nd0); % ����������ֵ
sp1_result = fnval(sp1, {original_mark, original_mark, original_mark});
sp2 = spapi({5, 5, 5}, {sample_mark, sample_mark, sample_mark}, val_nd0);
sp2_result = fnval(sp1, {original_mark, original_mark, original_mark});

sp_result = sp1_result; % ѡ���ۼ��ӵĽ��, ��ǰѡ���������������ֵ�����
[x_mesh, y_mesh, z_mesh, err_mesh] = mesh2nd(x_nd, y_nd, z_nd, sp_result - val_nd);
vol_visual4d(x_mesh, y_mesh, z_mesh, err_mesh); % �������ͼ��


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