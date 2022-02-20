uj bfunction [ u ] = poisson_jacobi( a,b,c,d,h,k )
 f1=@(x) x.^2;  f2=@(x)  x^2+3; ;g1=@(y) y;  g2=@(y)  9+y;; f=@(x,y) 2;
%  f1=@(x) log(x.^2+1);  f2=@(x)  log(x.^2+4); ;g1=@(y) 2*log(y);  g2=@(y)  log(1+y.^2); f=@(x,y) 0;
%  f1=@(x) 0;  f2=@(x)  0; ;g1=@(y) 0;  g2=@(y)  sin(y); f=@(x,y) 0;
%  f1=@(x) sin(pi*x/2);  f2=@(x)  0; ;g1=@(y) 0;  g2=@(y)  0; f=@(x,y) 0;
%  f1=@(x) 0;  f2=@(x)  0; ;g1=@(y) sin(y);  g2=@(y) exp(1)*sin(y); f=@(x,y) 0;
%  f1=@(x) 0;  f2=@(x)  0; ;g1=@(y) 0;  g2=@(y) sin(y); f=@(x,y) 0;
%  f1=@(x) 1+x.^2;  f2=@(x)  0; ;g1=@(y) 1-y.^2;  g2=@(y) 2*(1-y.^2); f=@(x,y) -2*(x.^2+y.^2);
x=a:h:b;
y=c:k:d;
m=(b-a)/h;
n=(d-c)/k;
u=zeros(m+1,n+1);
kmax=100;
tol=0.001;
% cl
for i=1:m+1
        u(i,1)=f1(x(i));
         u(i,n+1)=f2(x(i));
    end
    for j=1:n+1
        u(1,j)=g1(y(j));
        u(m+1,j)=g2(y(j));
    end
k=0 ;e=1; uk1=u;
while (k< kmax) && (e>tol)
    k=k+1; 
    for i=2:m
        for j=2:n
            uk1(i,j)=(1/(2*(h^-2+k^-2)))*(h^-2*(u(i-1,j)+u(i+1,j))+k^-2*(u(i,j-1)+u(i,j+1))-f(x(i),y(j)));
        end
    end 
    e=err( n,m,u,uk1 );
    u=uk1;  
    
end
u=flip(u');
