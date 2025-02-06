clc 
close all 
clear all 
Fs=1000; 
fmax=200; 
L=2; 
t=0:1/Fs:1-(1/Fs); 
Fs1=Fs/L; 
x = sin(2*pi*200*t)+ 0.3.*sin(2*pi*180*t)+0.2.*sin(2*pi*fmax*t)+0.1.*sin(2*pi*80*t)+0.8.*sin(2*pi*120*t)+1.3.*sin(2*pi*100*t)+0.8.*sin(2*pi*140*t); 
xL=downsample(x,L); 
y=decimate(x,L); 
t1=0:1/Fs1:1-(1/Fs1); 
timewin=Fs/10;
timewin2=Fs1/10;
N=1024; 
f=-Fs/2:Fs/(N):(Fs/2-Fs/(N)); 
f1=-Fs1/2:Fs1/(N):(Fs1/2-Fs1/(N)); 
figure, 
subplot(3,1,1), 
stem(t(1:timewin+1),x(1:timewin+1),'b'),title(strcat('Original sampled signal of fmax',num2str(fmax), 'Hz', '(Fs=',num2str(Fs),'Hz)')),xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('original') 
subplot(3,1,2), 
stem(t1(1:timewin2+1),xL(1:timewin2+1),'r'),title(strcat('Downsampled by ',num2str(L),'signal (Fs=',num2str(Fs1),'Hz)')),xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('downsampled') 
subplot(3,1,3), 
stem(t1(1:timewin2+1),y(1:timewin2+1),'m'),title(strcat('Decimated signal M=',num2str(L),'(Fs=',num2str(Fs1),'Hz',' or ',num2str(length(y)),'samples/sec)')) ,xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('decimated') 
figure 
subplot(3,1,1), 
plot(t(1:100),x(1:100),'b'),title(strcat('Original sampled signal of fmax',num2str(fmax), 'Hz', '(Fs=',num2str(Fs),'Hz)')) ,xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('original') 
subplot(3,1,2), 
plot(t1(1:100),xL(1:100),'r'),title(strcat('Downsampled by ',num2str(L),'signal (Fs=',num2str(Fs1),'Hz)')) ,xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('downsampled') 
subplot(3,1,3), 
plot(t1(1:100),y(1:100),'m'),title(strcat('Decimated signal M=',num2str(L),'(Fs=',num2str(Fs1),'Hz',' or ',num2str(length(y)),'samples/sec)')) ,xlabel('? me in sec'), ylabel ('Amplitude'),grid on ,legend('decimated') 
figure, 
subplot(3,1,1) 
plot(f,fftshift(((abs(fft(x,N))./(N/2)))),'b'),title('spectrum of original signal'),grid on ,axis([-Fs/2 Fs/2 0 1]) 
subplot(3,1,2)
plot(f1,fftshift(((abs(fft(xL,N))./(N/2)))),'r'),title('spectrum of downsampled signal by 2'),grid on,axis([-Fs1/2 Fs1/2 0 0.5])
subplot(3,1,3)
plot(f1,fftshift(((abs(fft(y,N)./(N/2))))),'m'),title('spectrum of decimated signal by 2'),grid on,axis([-Fs1/2 Fs1/2 0 0.5])