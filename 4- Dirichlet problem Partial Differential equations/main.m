%%% this algorithm solve Dirichlet problem  %%%
%% Guidlines:
% Domaine:{(x;y)/a<x<b , c<y<d}
% Uxy+C(x,y)U(x)=f(x,y)
% boundary condition :{U(x=a)=g1(y) ; U(x=b)=g2(y)
%                      U(y=c)=f1(x) ; U(y=d)=f2(x)}
%% Guidlines: "poisson_meshgrid: give exact solution" |"dirichlet_direct:numerical solution" | "e:Error"}
function [U,e]=main(a,b,c,d,h,k)
m=(b-a)/h; 
n=(d-c)/k;
Uex=poisson_meshgrid(a,b,c,d,h,k);
U=dirichlet_direct( a,b,c,d,h,k );
e=err( n,m,U,Uex );
end

