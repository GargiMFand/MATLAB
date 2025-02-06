clear all
close all
clc
load Hd_06bs 
load Hd_24bs
fs=10000;
n1 = 6; n2 = 24;
t = 0:1/fs:1-(1/fs);
x = sin(2*pi*500*t)+ sin(2*pi*1000*t) + sin(2*pi*1500*t) +sin(2*pi*1600*t) + sin(2*pi*1700*t) + sin(2*pi*2000*t) + sin(2*pi*2500*t) + 2*sin(2*pi*2700*t) + 3*sin(2*pi*3500*t);
N = length(x);
y1 = filter(Hd_06bs, x);
y2 = filter(Hd_24bs, x);
X = fft(x); 
Y1 = fft(y1);
Y2 = fft(y2); 
f = fs*(0:N-1)/N; 
figure,subplot(3,1,1)
plot(f,abs(X)/N), title('Spectrum of i/p signal'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,2)
plot(f,abs(Y1)/N,'r'),title('Spectrum of filtered o/p (Bandstop), Order- 06 , fc1=2k, fc2=3k'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,3)
plot(f,abs(Y2)/N,'r'),title('Spectrum of filtered o/p (Bandstop), Order- 24, fc1=2k, fc2=3k'),xlabel('Frequency "Hz" '), ylabel('Magnitude')