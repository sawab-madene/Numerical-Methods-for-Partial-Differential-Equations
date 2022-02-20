function [ A ] = poisson_meshgrid(L,T,m,n)
%  p1
  h=L/m; k=T/n;
  [x,t]=meshgrid(0:h:L,0:k:T);
  A=5*sin(pi*x/2).*cos(pi*t/2); %la sol exacte
  A=flip(A);

% p2
% h=L/m; k=T/n;[x,t]=meshgrid(0:h:L,0:k:T);
%  A=sin(pi*x).*cos(2*pi*t)+sin(2*pi*x).*cos(4*pi*t);%la sol exacte
%  A=flip(A);

% p3
% h=L/m; k=T/n;
% [x,t]=meshgrid(0:h:L,0:k:T);
%   A=sin(pi*x).*sin(2*pi*t);%la sol exacte
%  A= flip(A);

% p4
% h=L/m; k=T/n;
% [x,t]=meshgrid(0:h:L,0:k:T);
% A=sin(x).*exp(-t);%la sol exacte
% A= flip(A);

% p5
% h=L/m; k=T/n;
% [x,t]=meshgrid(0:h:L,0:k:T);
%   A=sinh(x).cosh(2*t);%la sol exacte
%  A= flip(A);




end


