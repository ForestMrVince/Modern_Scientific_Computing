function [R,P,K]=pfrac(num,den) 
% pfrac ÂÔ
%   ÂÔ
%   À´Ô´: http://www.pudn.com/Download/item/id/3169310.html

[R,P,K]=residue(num,den);  
for i=1:length(R)
   if imag(P(i))>eps 
      a=real(R(i)); b=imag(R(i)); 
      R(i)=-2*sqrt(a^2+b^2);R(i+1)=atan2(-a,b); 
   end 
end

