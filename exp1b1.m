%IDFT
clear all
close all
clc
X=input('Enter X(k)sequence:-');
N=length(X);
x=zeros(1,N);
j=sqrt(-1);
for k=0:1:N-1;
    for n=0:1:N-1;
        x(k+1)=x(k+1)+X(n+1)*exp(j*2*pi*n*k/N)/N;
    end
end
subplot(3,1,3);
stem(real(x)),title('Input Signal x(n)'),xlabel('index n->'),ylabel('Amplitude');
subplot(3,1,1);
stem(abs(X)),title('Magnitude of X(k)'),xlabel('index k->'),ylabel('Magnitude');
subplot(3,1,2);
stem(angle(X)),title('Phase of X(k)'),xlabel('index k->'),ylabel('Phase');
