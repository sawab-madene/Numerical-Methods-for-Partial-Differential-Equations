function [ u ] = poisson_direct( a,b,c,d,h,k )
 f1=@(x) x.^2;  f2=@(x)  x^2+3; ; g1=@(y) y;  g2=@(y)  9+y; f=@(x,y) 2; % problem 1
%  f1=@(x) log(x.^2+1);  f2=@(x)  log(x.^2+4); ;g1=@(y) 2*log(y);  g2=@(y)  log(1+y.^2); f=@(x,y) 0;% problem 2
%  f1=@(x) 0;  f2=@(x)  0; ;g1=@(y) 0;  g2=@(y)  sin(y); f=@(x,y) 0; % problem 3
%  f1=@(x) sin(pi*x/2);  f2=@(x)  0; ;g1=@(y) 0;  g2=@(y)  0; f=@(x,y) 0; % problem 4
%  f1=@(x) 0;  f2=@(x)  0; ;g1=@(y) sin(y);  g2=@(y) exp(1)*sin(y); f=@(x,y) 0;% problem 5
%  f1=@(x) 0;  f2=@(x)  0; ;g1=@(y) 0;  g2=@(y) sin(y); f=@(x,y) 0; % problem 6
%  f1=@(x) 1+x.^2;  f2=@(x)  0; ;g1=@(y) 1-y.^2;  g2=@(y) 2*(1-y.^2); f=@(x,y) -2*(x.^2+y.^2);% problem 7
m=(b-a)/h; M=m+1;
n=(d-c)/k; N=n+1;
x=a:h:b;
y=c:k:d;
A=zeros(M*N,M*N);
F=zeros(M*N,1);

for i=2:M-1
    for j=2:N-1
        p=i+(j-1)*M;
        A(p,p)=-2*(h^-2+k^-2);
        A(p,p-1)=h^-2;
        A(p,p+1)=h^-2;
        A(p,p-M)=k^-2;
        A(p,p+M)=k^-2;
        F(p)=f(x(i),y(j));
    end
end

for i=1:M
    j=1;
    p=i+(j-1)*M;
    A(p,p)=1;
    F(p)=f1(x(i));
    
    j=N;
    p=i+(j-1)*M;
    A(p,p)=1;  
    F(p)=f2(x(i));
end

for j=1:N
    i=1;
    p=i+(j-1)*M;
    A(p,p)=1;
    F(p)=g1(y(j));
    i=M;
    p=i+(j-1)*M;
    A(p,p)=1;
    F(p)=g2(y(j));
end

v=A\F;
u=reshape(v(1:N*M),M,N);
u=flip(u');

end


