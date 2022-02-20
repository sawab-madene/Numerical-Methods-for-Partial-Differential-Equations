%%% Explicit solution of Parabolic PDE using Crank Nicolson%%
%% Guidlines:
% Domaine:{(x;t)/0<x<L , 0<t<T}
% Ut=C^2*Uxx+F(x,t)
% boundary condition :{Ut(x,0)=U0(x)
%                      U(0,t)=f1(t) ; U(L,t)=f2(t)}
% there are 3 problems to evaluate algorithm
%% Guidlines: "poisson_meshgrid: give exact solution" |"heat_crank_niclson:numerical solution" | "e:Error"}
function [U,r,e] = heat_crank_niclson(C,L,T,m,n)
f1=@(t) 0; f2=@(t) 0;U0=@(x)10*sin(pi*x);
%  f1=@(t) exp(-t); f2=@(t) -exp(-t);U0=@(x) cos(x);
%  f1=@(t) 0; f2=@(t) 0;U0=@(x) sin(pi*x)+sin(3*pi*x);
h=L/m; k=T/n; x=0:h:L; t=0:k:T; r=(C)*k/(h^2);

% calcul la sol num
d1(1:m-1)=2*(1+r);  d2(1:m-1)=2*(1-r);
l1(1:m-2)=-r;       l2(1:m-2)=r;
u1(1:m-2)=-r;       u2(1:m-2)=r;
for j=1:n+1
    U(1,j)=f1(t(j));
    U(m+1,j)=f2(t(j));
end
for i=1:m+1
    U(i,1)=U0(x(i));
end
A1=diag(d1,0)+diag(l1,-1)+diag(u1,1);
A2=diag(d2,0)+diag(l2,-1)+diag(u2,1);
for j=1:n
   w=[U(1,j)+ U(1,j+1);zeros(m-3,1);U(m+1,j)+U(m+1,j+1)] ;
   v=U(2:m,j);
%  U(2:m,j+1)=A1\(A2*v+r*w);
 U(2:m,j+1)=thomas(A1,(A2*v+r*w));
end
U=flip(U');

% calcul la sol exacte
Uex=poisson_meshgrid(L,T,m,n);

% calcul erreur
e=err( n,m,U,Uex );

end

