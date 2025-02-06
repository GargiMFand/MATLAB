clc 
close all 
clear all 
Fs=200; 
fr=10; 
fmax=70; 
L=4; 
t=0:1/Fs:1-(1/Fs); 
Fs1=Fs.*L; 
x = sin(2*pi*150*t)+ sin(2*pi*250*t)+sin(2*pi*850*t)+sin(2*pi*100*t)+0.3.*sin(2*pi*150*t)+0.2.*sin(2*pi*180*t)+sin(2*pi*100*t)+0.3.*sin(2*pi*150*t)+0.2.*sin(2*pi*360*t)+sin(2*pi*fr*t)+sin(2*pi*fmax*t); 
xL=downsample(x,L); 
y=decimate(x,L); 
timewin=Fs/10;
t1=0:1/Fs1:1-(1/Fs1); 
timewin1=Fs1/10;
N=2048; 
f=-Fs/2:Fs/(N):(Fs/2-Fs/(N)); 
f1=-Fs1/2:Fs1/(N):(Fs1/2-Fs1/(N)); 
figure, 
subplot(3,1,1), 
stem(t(1:timewin+1),x(1:timewin+1),'b'),title(strcat('Original sampled signal of fmax',num2str(fmax), 'Hz', '(Fs=',num2str(Fs),'Hz)')),xlabel('me in sec'), ylabel ('Amplitude'),grid on ,legend('original') 
subplot(3,1,2), 
stem(t1(1:timewin+1),xL(1:timewin+1),'r'),title(strcat('Upsampled by ',num2str(L),'signal (Fs=',num2str(Fs1),'Hz)')),xlabel('me in sec'), ylabel ('Amplitude'),grid on ,legend('downsampled') 
subplot(3,1,3), 
stem(t1(1:timewin+1),y(1:timewin+1),'m'),title(strcat('Interpolated signal L=',num2str(L),'(Fs=',num2str(Fs1),'Hz',' or ',num2str(length(y)),'samples/sec)')) ,xlabel(' me in sec'), ylabel ('Amplitude'),grid on ,legend('decimated') 
figure 
subplot(3,1,1), 
plot(t(1:timewin1+1),x(1:timewin1+1),'b'),title(strcat('Original sampled signal of fmax',num2str(fmax), 'Hz', '(Fs=',num2str(Fs),'Hz)')) ,xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('original') 
subplot(3,1,2), 
plot(t1(1:timewin1+1),xL(1:timewin1+1),'r'),title(strcat('Upsampled by',num2str(L),'signal (Fs=',num2str(Fs1),'Hz)')) ,xlabel(' me in sec'), ylabel ('Amplitude'),grid on ,legend('downsampled') 
subplot(3,1,3), 
plot(t1(1:timewin1+1),y(1:timewin1+1),'m'),title(strcat('Interpolated signal L=',num2str(L),'(Fs=',num2str(Fs1),'Hz',' or ',num2str(length(y)),'samples/sec)')) ,xlabel(' me in sec'), ylabel ('Amplitude'),grid on ,legend('decimated') 
figure, 
subplot(3,1,1) 
plot(f,fftshift(((abs(fft(x,N))./(N/16)))),'b'),title('spectrum of original signal'),grid on ,axis([-Fs/2 Fs/2 0 1]) 
subplot(3,1,2)
plot(f1,fftshift(((abs(fft(xL,N))./(N/16)))),'r'),title('spectrum of upsampled signal by 2'),grid on,axis([-Fs1/2 Fs1/2 0 1])
subplot(3,1,3)
plot(f1,fftshift(((abs(fft(y,N)./(N/16))))),'m'),title('spectrum of Interpolated signal by 2'),grid on,axis([-Fs1/2 Fs1/2 0 2])