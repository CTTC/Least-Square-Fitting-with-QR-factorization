function [Q,R]=QR_Householder(A)
% Perform QR decompostion by using Householder transformation
% Input  - A is an m x n matrix (m>n)
% Output - Q, R : QR decomposition results
[m,n]=size(A);
H=eye(m);
for k=1:min(m-1,n) 
    s=norm(A(k:m,k));
    if (A(k,k)<0)
        s=-s;
    end
    r=sqrt(2*s*(A(k,k)+s));
    W=zeros(m,1);
    W(k,1)=(A(k,k)+s)/r;
    W(k+1:m,1)=A(k+1:m,k)/r;
    Hi=eye(m)-2*W*W';
    H=Hi*H;  
    A=Hi*A;
end
    Q=inv(H);
    R=A;
end