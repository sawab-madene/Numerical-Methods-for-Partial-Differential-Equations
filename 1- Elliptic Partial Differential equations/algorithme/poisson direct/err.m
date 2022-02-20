function [ e ] = err( n,m,U,Uex )
diff=zeros(m+1,n+1);
 for i=1:m+1
        for j=1:n+1
           diff(i,j)=abs( U(i,j)-Uex(i,j));
        end
 end 
e=max(max(diff));

end

