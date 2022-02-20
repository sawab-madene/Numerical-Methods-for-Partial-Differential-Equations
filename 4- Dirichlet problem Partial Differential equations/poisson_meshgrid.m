function [ A ] = poisson_meshgrid(a,b,c,d,h,k)
% p1
 [x,y]= meshgrid(a:h:b,c:k:d);
 A=x.^2+y; %la sol exacte
 A=flip(A);



end

