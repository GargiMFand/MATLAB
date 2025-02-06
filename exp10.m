clc
close all
clear all
fs=1000;
I=8;
ts=(1/fs);
t=0:ts:1-ts;
x = sin(2*pi*2*t)+ sin(2*pi*10*t)+sin(2*pi*40*t);% with aliasing(36 Hz aliased with 4 Hz)
%x=sin(2*pi*fr*t);
xup=upsample(x,I);
xinter=interp(x,I);
subplot(3,1,1),stem(x(1:50)),title('I/p signal')
subplot(3,1,2),stem(xup(1:50)),title('Upsampled of I/p signal')
subplot(3,1,3),stem(xinter(1:50)),title('Interpolation of I/p signal')
N=1024;
X=abs(fftshift(fft(x,N)));
Xup=abs(fftshift(fft(xup,N)));
Xinter=abs(fftshift(fft(xinter,N)));
f=(-N/2:(N-1)/2)*fs/N;
fsnew=fs*I;
fnew=(-N/2:(N-1)/2)*fsnew/N;
figure,subplot(3,1,1),plot(f,X),title('Mag. Spectrum of i/p')
subplot(3,1,2),plot(fnew,Xup),title('Mag. Spectrum of UPsampled i/p ')
subplot(3,1,3),plot(fnew,Xinter),title('Mag. Spectrum of Interpolated i/p ')