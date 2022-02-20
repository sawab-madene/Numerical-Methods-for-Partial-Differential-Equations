%%% this algorithm uses "iteration method" to solve elliptic PDE %%%
%there are three iteration methods : gauss / jacobi/ relaxation
%% Guidlines:
% Domaine:{(x;y)/a<x<b , c<y<d}
% ?U=Uxx+Uyy=f(x,y)
% boundary condition :{U(x=a)=g1(y) ; U(x=b)=g2(y)
%                      U(y=c)=f1(x) ; U(y=d)=f2(x)}
% there are 7 problems to evaluate algorithm
%% Guidlines: "poisson_meshgrid: give exact solution" |
%             "poisson_gauss or poisson_jacobi or poisson_relaxation :numerical solution" |
%             "e:Error"}
function [U,e]=main_poisson_iterative(a,b,c,d,h,k)
m=(b-a)/h; 
n=(d-c)/k;
Uex=poisson_meshgrid(a,b,c,d,h,k);
% U=poisson_gauss(a,b,c,d,h,k);
  U=poisson_jacobi(a,b,c,d,h,k);
% U=poisson_relaxation(a,b,c,d,h,k);
e=err( n,m,U,Uex );
end

