clc
close all
clear all
fs=1000;
D=2;
ts=(1/fs);
t=0:ts:1-ts;
x = sin(2*pi*2*t)+ sin(2*pi*10*t)+sin(2*pi*40*t);% with aliasing(36 Hz aliased with 4 Hz)
%x=sin(2*pi*fr*t);
xdw=downsample(x,D);
xdeci=decimate(x,D);
len = min(50, length(xdw));
subplot(3,1,1), stem(x(1:50)), title('I/p signal');
subplot(3,1,2), stem(xdw(1:len)), title('Downsampled signal');
subplot(3,1,3), stem(xdeci(1:len)), title('Decimated signal');
N=1024;
X=abs(fftshift(fft(x,N)));
Xdw=abs(fftshift(fft(xdw,N)));
Xdeci=abs(fftshift(fft(xdeci,N)));
f=(-N/2:(N-1)/2)*fs/N;
fsnew=fs/D;
fnew=(-N/2:(N-1)/2)*fsnew/N;
figure,subplot(3,1,1),plot(f,X),title('Mag. Spectrum of i/p')
subplot(3,1,2),plot(fnew,Xdw),title('Mag. Spectrum of UPsampled i/p ')
subplot(3,1,3),plot(fnew,Xdeci),title('Mag. Spectrum of Interpolated i/p ')