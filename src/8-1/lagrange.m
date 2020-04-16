function y=lagrange(x0,y0,x)
% lagrange 差值函数
%   输入: 
%       x0: 样本点x向量
%       y0: 样本点y向量
%       x: 插值点x向量
%   输出: 
%       y: 插值点y计算结果

ii=1:length(x0); y=zeros(size(x));
for i=ii
   ij=find(ii~=i); y1=1;
   for j=1:length(ij), 
      y1=y1.*(x-x0(ij(j)));
   end
   y=y+y1*y0(i)/prod(x0(i)-x0(ij));
end
