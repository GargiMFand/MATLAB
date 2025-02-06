clear all
close all
clc
fs=1000;% HZ
ts=1/fs;
t=0:ts:0.2;
a=2*sin(2*pi*30*t)+0.6*sin(2*pi*300*t);
b=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
N1=length(a);
N2=length(b);
b=[b zeros(1,N1-N2)];
A=mydft(a);
B=mydft(b);
M=A.*B;
m=myidft(M);
n=0:N1-1;
figure,
subplot(3,1,1);
stem(n,a),title('1st Input of signal x(n)'),xlabel('Index n'),ylabel('Amplitude');
subplot(3,1,2);
stem(n,b),title('2nd Input of signal h(n)'),xlabel('Index n'),ylabel('Amplitude');
subplot(3,1,3);
stem(n,real(m)),title('Circular convolution of x(n) and h(n)'),xlabel('Index n'),ylabel('Amplitude');
figure,
subplot(3,1,1);
stem(abs(A)),title('Magnitude of X(k)'),xlabel('index k->'),ylabel('Magnitude');
subplot(3,1,2);
stem(abs(B)),title('Magnitude of H(k)'),xlabel('index k->'),ylabel('Magnitude');
subplot(3,1,3);
stem(abs(M)),title('Magnitude of M(k)'),xlabel('index k->'),ylabel('Magnitude');
figure,
subplot(3,1,1);
stem(angle(A)),title('Phase of X(k)'),xlabel('index k->'),ylabel('Phase');
subplot(3,1,2);
stem(angle(B)),title('Phase of H(k)'),xlabel('index k->'),ylabel('Phase');
subplot(3,1,3);
stem(angle(M)),title('Phase of M(k)'),xlabel('index k->'),ylabel('Phase');