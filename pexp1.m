%DFT:- Discrete Fourier Transform
clear all
close all
clc
%Above Commands for termination of existing Program
%x=input('Enter x(n) Sequence:-'); %User Input
A=16;%Amplitude
fmax=4;%frequency
fs=100;%sampling frequency
ts=1/fs;%sampling frequency time
t=0:ts:1-ts;%Actual time
x=A*sin(2*pi*fmax*t);%Sin Wave Input
N=length(x); %length of Sequence
X=zeros(1,N);%values of X
j=sqrt(-1);%imaginary
for k=0:1:N-1;%values of k
    for n=0:1:N-1;%values of n
        X(k+1)=X(k+1)+x(n+1)*exp(-j*2*pi*n*k/N);%Modified Equation Of DFT
    end
end
subplot(3,1,1);%(col,row,index no)
stem(x);%plot x
subplot(3,1,2);
stem(abs(X));%plot magnitude of X
subplot(3,1,3);
stem(angle(X));%plot angle of X