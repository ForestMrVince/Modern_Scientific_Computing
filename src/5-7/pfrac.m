function [R,P,K]=pfrac(num,den) 
% pfrac 略
%   略
%   来源: http://www.pudn.com/Download/item/id/3169310.html

[R,P,K]=residue(num,den);  % residue的说明文档: https://ww2.mathworks.cn/help/matlab/ref/residue.html
for i=1:length(R)
   if imag(P(i))>eps 
      a=real(R(i)); b=imag(R(i)); 
      R(i)=-2*sqrt(a^2+b^2);R(i+1)=atan2(-a,b); 
   end 
end

% 个人理解: 根据本文件的7-10行, 可以看到, 这个函数就是把residue
% 求出来的P中为虚数的部分拿出来, 给它对应的留数, 和下一个留数就行
% 了一定的修改. 
