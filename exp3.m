%POWER SPECTRUM OF SIGNAL FOR ANALYSIS OF NOISE
close all
clear all
clc
fs=1000;
ts=1/fs;
t=0:ts:1-ts;
x=1.5*sin(2*pi*10*t)+3*sin(2*pi*20*t)+6*sin(2*pi*30*t);
noise=15*rand(size(x));
x_noise=x+noise;
N=length(x);
f=(-fs/2:fs/N:((fs/2)-(fs/N)));
X=((abs(fftshift(fft(x)))).^2)/N;
Noise=((abs(fftshift(fft(noise)))).^2)/N;
X_Noise=((abs(fftshift(fft(x_noise)))).^2)/N;
Px1=10*log10((X.*conj(X))/N);
Px2=10*log10((Noise.*conj(Noise))/N);
Px3=10*log10((X_Noise.*conj(X_Noise))/N);
figure;
subplot(3,1,1);
stem(t,x),title('Original Signal'),xlabel('t'),ylabel('Amplitude');
subplot(3,1,2);
stem(t,noise),title('Noise Input'),xlabel('t'),ylabel('Amplitude');
subplot(3,1,3);
stem(t,x_noise),title('Combination of x and Noise Signal'),xlabel('t'),ylabel('Amplitude');
figure;
subplot(3,1,1);
plot(f,Px1), title('Power spectrum of X'), xlabel('Freq in Hz'), ylabel('Power in dB')
subplot(3,1,2);
plot(f,Px2), title('Power spectrum of Noise'), xlabel('Freq in Hz'), ylabel('Power in dB')
subplot(3,1,3);
plot(f,Px3), title('Power spectrum of X_Noise'), xlabel('Freq in Hz'), ylabel('Power in dB')