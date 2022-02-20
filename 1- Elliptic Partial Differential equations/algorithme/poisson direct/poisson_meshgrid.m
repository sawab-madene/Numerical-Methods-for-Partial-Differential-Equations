function [ A ] = poisson_meshgrid(a,b,c,d,h,k)
% problem 1
 [x,y]= meshgrid(a:h:b,c:k:d);
 A=x.^2+y; %la sol exacte
 A=flip(A);

% problem 2
%   [x,y]=meshgrid(a:h:b,c:k:d);
%  A=log(x.^2+y.^2 );%la sol exacte
%  A=flip(A);

% problem 3
%   [x,y]=meshgrid(a:h:b,c:k:d);
%  A=(sinh(x)/sinh(pi)).*sin(y);%la sol exacte
%  A=flip(A);

% problem 4
%   [x,y]=meshgrid(a:h:b,c:k:d);
%  A=(sin(pi*x/2)/sinh(pi/2)).*sinh(pi*(1-y)/2); %la sol exacte
%  A=flip(A);

% problem 5
%   [x,y]=meshgrid(a:h:b,c:k:d);
%   A=exp(x).*sin(y);%la sol exacte
% A=flip(A);

% problem 6
%   [x,y]=meshgrid(a:h:b,c:k:d);
%  A=x.^2.*sin(y); %la sol exacte
%  A=flip(A);

% problem 7
%   [x,y]=meshgrid(a:h:b,c:k:d);
%  A=(1+x.^2)*(1-y.^2); %la sol exacte
%  A=flip(A);



end

