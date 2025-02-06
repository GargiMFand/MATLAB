%FUNCTION IDFT
function [x]=myidft(X)
N=length(X);
x=zeros(1,N);
j=sqrt(-1);
for k=0:1:N-1;
    for n=0:1:N-1;
        x(k+1)=x(k+1)+X(n+1)*exp(j*2*pi*n*k/N)/N;
    end
end
end