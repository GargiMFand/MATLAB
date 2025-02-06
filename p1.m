close all
clear all
clc
load Hd_bp_06;
load Hd_bp_20;
fs=10000;
n1=6;n2=20;
t=0:1/fs:1-(1/fs);
x=5*sin(2*pi*200*t)+4*sin(2*pi*600*t)+3*sin(2*pi*1000*t)+2*sin(2*pi*1500*t)+sin(2*pi*1700*t)+2*sin(2*pi*2000*t)+3*sin(2*pi*2400*t)+4*sin(2*pi*2600*t)+5*sin(2*pi*3000*t)+6*sin(2*pi*3500*t)+7*sin(2*pi*3700*t);
N=length(x);
y1=filter(Hd_bp_06,x);
y2=filter(Hd_bp_20,x);
X=fft(x);
Y1=fft(y1);
Y2=fft(y2);
f=fs*(0:N-1)/N;
figure,subplot(3,1,1)
plot(f,abs(X)/N),title('Spectrum of i/p signal'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,2)
plot(f,abs(Y1)/N,'r'),title('Spectrum of filtered o/p (Bandpass), Order- 06, fc1=1.5k, fc2=3k '),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,3)
plot(f,abs(Y2)/N,'r'),title('Spectrum of filtered o/p (Bandpass), Order- 20, fc1=1.5k, fc2=3k'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
