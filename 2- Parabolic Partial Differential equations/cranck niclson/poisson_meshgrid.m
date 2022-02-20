function [ A ] = poisson_meshgrid(L,T,m,n)
%  p1
h=L/m; k=T/n;
[x,t]=meshgrid(0:h:L,0:k:T);
A=10*sin(pi.*x).*exp(-pi^2.*t/4); %la sol exacte
A=flip(A);

% p2
% h=L/m; k=T/n;
%   [x,t]=meshgrid(0:h:L,0:k:T);
%    A=cos(x).*exp(-t);%la sol exacte
%    A=flip(A)

% p3
% h=L/m; k=T/n;
%   [x,t]=meshgrid(0:h:L,0:k:T);
%     A=sin(pi*x).*exp(-pi^2*t)+sin(3*pi*x).*exp(-9*pi^2*t);%la sol exacte
%    A= flip(A)


end


