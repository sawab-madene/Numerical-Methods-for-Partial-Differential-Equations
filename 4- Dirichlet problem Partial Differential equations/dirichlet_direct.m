function [ u ] = dirichlet_direct( a,b,c,d,h,k )
 f1=@(x) x.^2;  f2=@(x)  x^2+3; ;g1=@(y) y;  g2=@(y)  9+y; f=@(x,y) 2;
 c1=@(x,y) 2; c2=@(x,y) 2; c3=@(x,y) 2;
 
m=(b-a)/h; M=m+1;
n=(d-c)/k; N=n+1;
x=a:h:b;
y=c:k:d;
A=zeros(M*N,M*N);
F=zeros(M*N,1);

for i=2:M-1
    for j=2:N-1
        p=i+(j-1)*M;
        A(p,p)= -((2/h^2)+(2/k^2)+c3(x(i),y(j)));
        A(p,p-1)=(1/h^2)-(c1(x(i),y(j))/(2*h));
        A(p,p+1)=(1/h^2)+(c1(x(i),y(j))/(2*h));
        A(p,p-M)=(1/k^2)-(c2(x(i),y(j))/(2*k));
        A(p,p+M)=(1/k^2)+(c2(x(i),y(j))/(2*k));
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
