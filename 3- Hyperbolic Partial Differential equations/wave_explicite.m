%%% Explicit solution of hyperbolic PDE %%%
%% Guidlines:
% Domaine:{(x;t)/0<x<L , 0<t<T}
% Utt=C^2*Uxx+F(x,t)
% boundary condition :{U(x,0)=U0(x) ; Ut(x,0)=Ut0(x)
%                      U(0,t)=f1(t) ; U(L,t)=f2(t)}
% there are 5 problems to evaluate algorithm
%% Guidlines: "poisson_meshgrid: give exact solution" |"wave_explicite:numerical solution" | "e:Error"}

function [U,r,e] = wave_explicite(C,L,T,m,n)
 f1=@(t) 0; f2=@(t) 0;U0=@(x) 5*sin((pi*x)/2); Ut0=@(x) 0 ;F=@(x,t) 0;
% f1=@(t) 0; f2=@(t) 0;U0=@(x) sin(pi*x)+sin(2*pi*x);Ut0=@(x) 0 ;F=@(x,t) 0;
% f1=@(t) 0; f2=@(t) 0;U0=@(x) 0;Ut0=@(x) 2*pi*sin(pi*x);F=@(x,t) 0;
% f1=@(t) 0; f2=@(t) 0;U0=@(x) sin(x);Ut0=@(x) -sin(x);F=@(x,t) 2*exp(-t).*sin(x);
% f1=@(t) 0; f2=@(t) sinh(1)*cosh(2*t);U0=@(x) sinh(x);Ut0=@(x)0;F=@(x,t) 0;
h=L/m; k=T/n; x=0:h:L; t=0:k:T; r=(C)*(k^2)/(h^2);

% calcul numeriacal solution
for j=1:n+1
    U(1,j)=f1(t(j));
    U(m+1,j)=f2(t(j));
end
for i=1:m+1
    U(i,1)=U0(x(i));
end

for i=2:m
    U(i,2)=(1-r)*U(i,1)+r/2*(U(i-1,1)+U(i+1,1))+k*Ut0(x(i))+(k^2)/2*F(x(i),t(1));
end
for j=2:n
    for i=2:m
        U(i,j+1)=2*(1-r)*U(i,j)+r*(U(i-1,j)+U(i+1,j))-U(i,j-1)+(k^2)*F(x(i),t(j));
    end
end
U=flip(U');

% calcul  exacte solution 
Uex=poisson_meshgrid(L,T,m,n);

% calcul error
e=err( n,m,U,Uex );

end
