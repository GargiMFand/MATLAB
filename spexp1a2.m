%SINE WAVE DFT
clear all
close all
clc
fs=100;
ts=1/fs;
t=0:ts:1-ts;
x=16*sin(2*pi*4*t)+12*sin(2*pi*6*t)+10*sin(2*pi*8*t);
N=length(x);
X=zeros(1,N);
j=sqrt(-1);
for k=0:1:N-1;
    for n=0:1:N-1;
        X(k+1)=X(k+1)+x(n+1)*exp(-j*2*pi*n*k/N);
    end
end
subplot(3,1,1);
stem(x),title('Input Signal x(n)'),xlabel('index n->'),ylabel('Amplitude');
subplot(3,1,2);
stem(abs(X)),title('Magnitude of X(k)'),xlabel('index k->'),ylabel('Magnitude');
subplot(3,1,3);
stem(angle(X)),title('Phase of X(k)'),xlabel('index k->'),ylabel('Phase');