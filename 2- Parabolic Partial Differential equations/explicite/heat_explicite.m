%%% Explicit solution of Parabolic PDE %%%
%% Guidlines:
% Domaine:{(x;t)/0<x<L , 0<t<T}
% Ut=C^2*Uxx+F(x,t)
% boundary condition :{Ut(x,0)=U0(x)
%                      U(0,t)=f1(t) ; U(L,t)=f2(t)}
% there are 3 problems to evaluate algorithm
%% Guidlines: "poisson_meshgrid: give exact solution" |"wave_explicite:numerical solution" | "e:Error"}
function [U,r,e] = heat_explicite(C,L,T,m,n)
f1=@(t) 0; f2=@(t) 0;U0=@(x) 10*sin(pi*x);
%  f1=@(t) exp(-t); f2=@(t) -exp(-t);U0=@(x) cos(x);
%  f1=@(t) 0; f2=@(t) 0;U0=@(x) sin(pi*x)+sin(3*pi*x);
h=L/m; k=T/n; x=0:h:L; t=0:k:T; r=(C)*k/(h^2);

% calcul la sol num
for j=1:n+1
    U(1,j)=f1(t(j));
    U(m+1,j)=f2(t(j));
end
for i=1:m+1
    U(i,1)=U0(x(i));
end
for j=1:n
    for i=2:m
        U(i,j+1)=(1-2*r)*U(i,j)+r*(U(i-1,j)+U(i+1,j))
    end
end
U=flip(U');

% calcul la sol exacte
Uex=poisson_meshgrid(L,T,m,n);

% calcul erreur
e=err( n,m,U,Uex );

end
