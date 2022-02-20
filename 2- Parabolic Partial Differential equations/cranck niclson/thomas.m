function [ x ] = thomas( A,b )
n=length(b);
d=diag(A);
l=[0;diag(A,-1)];
u=[diag(A,1);0];

w(1)=u(1)/d(1);
y(1)=b(1)/d(1);
for i=2:n
    s=d(i)-l(i)*w(i-1);
    w(i)=u(i)/s;
    y(i)=(b(i)-l(i)*y(i-1))/s;
end
x(n)=y(n);
for i=n-1:-1:1
    x(i)=y(i)-w(i)*x(i+1);
end
x=x';

end

