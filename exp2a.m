%CIRCULAR CONVULATION
clear all
close all
clc
a=input('Enter Sequence x(n):-');
b=input('Enter sequence h(n):-');
N1=length(a);
N2=length(b);
if ((N1~=N2)&&(N1>N2))
    b=[b zeros(1,(N1-N2))];
else
    a=[a zeros(1,(N2-N2))];
end
A=mydft(a);
B=mydft(b);
N=length(a);
M=A.*B;
m=myidft(M);
n=1:N;
figure,
subplot(3,1,1);
stem(a),title('Input Signal x(n)'),xlabel('index n->'),ylabel('Amplitude');
subplot(3,1,2);
stem(b),title('Input Signal h(n)'),xlabel('index n->'),ylabel('Amplitude');
subplot(3,1,3);
stem(m),title('Circular Convolution of Signal y(n)'),xlabel('index n->'),ylabel('Amplitude');
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