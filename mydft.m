%FUNCTION DFT
function [X]=mydft(x)
N=length(x);
X=zeros(1,N);
j=sqrt(-1);
for k=0:1:N-1;
    for n=0:1:N-1;
        X(k+1)=X(k+1)+x(n+1)*exp(-j*2*pi*n*k/N);
    end
end
end