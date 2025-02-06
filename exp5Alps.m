close all
clear all
clc
fs=12000; % Sampling rate 
fc=2200; % Cutoff frequency
omegap=2*fs.*tan(2*pi*fc/(2*fs)); % Analog freq calculation
n1 = 4; n2 = 6;
%% Filter design for n = 2
[z1, p1, k1]=buttap(n1); % returns zeros, poles and gain for
% an N-th order normalized prototype Butterworth analog lowpass filter.
[num1,den1] = zp2tf(z1,p1,k1); %Zero-pole,gain to transfer function conversion.
[B1, A1]=lp2lp(num1,den1,omegap); % frequency transformation of LP to LP
[bz1, az1]= bilinear(B1,A1,fs); % Bilinear transformation, bz and az are num and denominator of H(z)
[h1, f1]= freqz(bz1,az1,2048,fs); % Frequency response of digital filter from z transform
%% %% Filter design for n = 5
[z2, p2, k2]=buttap(n2); % returns zeros, poles and gain for
% an N-th order normalized prototype Butterworth analog lowpass filter
[num2,den2] = zp2tf(z2,p2,k2); %Zero-pole,gain to transfer function conversion.
[B2, A2]=lp2lp(num2,den2,omegap); % frequency transformation of LP to LP 
[bz2, az2]= bilinear(B2,A2,fs); % Bilinear transformation, bz and az are num and denominator of H(z)
[h2, f2]= freqz(bz2,az2,2048,fs); % Frequency response of digital filter from z transform
%% %% Plots
% Magnitude Spectrum
figure,subplot(2,1,1)
plot(f1,mag2db(abs(h1)),'r')% Magnitude spectrum of filter in decibels 
hold on
plot(f2,mag2db(abs(h2)),'b'), axis([0 fs/2 -50 5]), grid, xlabel('Frequency (Hz)'), ylabel('Attenuation (dB)')
legend('butterworth of n=2','butterworth of n=6');
% Phase spectrum 
subplot(2,1,2)
plot(f1,angle(h1),'r')% Phase spectrum of filter
hold on
plot(f2,angle(h2),'b'), axis([0 fs/2 -10 10]), grid, xlabel('Frequency (Hz)'), ylabel('Phase angle')
legend('butterworth of n=2','butterworth of n=6');
%% Apply filter on test input
t=0:1/fs:1-(1/fs); % duration of 1 sec.
x = 1.5+sin(2*pi*150*t)+sin(2*pi*580*t)+sin(2*pi*1000*t)+2*sin(2*pi*2500*t)+3*sin(2*pi*3000*t);% x(n) test input
N=length(x);
y1 = filter(bz1,az1,x); % Passing x(n) through the filter-1
y2 = filter(bz2,az2,x); % Passing x(n) through the filter-2
f=fs*(0:N-1)/N; %frequency axis construction
X=fft(x); %FFT of input
Y1=fft(y1); %FFT of output filter-1
Y2=fft(y2); %FFT of output filter-2
%% Plot spectrum of i/p, o/p of filter-1 and filter-2
figure,subplot(3,1,1)
% input in frequency domain
plot(f,abs(X)/N), title('Spectrum of i/p signal'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
% output in frequency domain
subplot(3,1,2)
plot(f,abs(Y1)/N,'r'),title(['Spectrum of filtered o/p, Order- ',num2str(n1)]),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,3)
plot(f,abs(Y2)/N,'r'),title(['Spectrum of filtered o/p, Order- ',num2str(n2)]),xlabel('Frequency "Hz" '), ylabel('Magnitude')
%% %% Pole-Zero Plots
figure,subplot(2,2,1),zplane(num1,den1), title(['Normalized BLPF poles-Zeros, Order- ',num2str(n1)])
subplot(2,2,2),zplane(bz1, az1), title(['Fc=1Khz, BLPF poles-Zeros, Order- ',num2str(n1)])
subplot(2,2,3),zplane(num2,den2), title(['Normalized BLPF poles-Zeros, Order- ',num2str(n2)])
subplot(2,2,4),zplane(bz2, az2), title(['Fc=1Khz, BLPF poles-Zeros, Order- ',num2str(n2)])
%% Plot i/p and o/p in time domain (few samples)
figure,subplot(3,1,1)
plot(t(1:500),x(1:500)), title('I/P signal x(t)'),xlabel('Time in sec. '), ylabel('Amplitude')
subplot(3,1,2)
plot(t(1:500),y1(1:500)), title(['Low Pass Filtered Signal, Order- ', num2str(n1)]),xlabel('Time in sec. '), ylabel('Amplitude')
subplot(3,1,3)
plot(t(1:500),y2(1:500)), title(['Low Pass Filtered Signal, Order- ', num2str(n2)]),xlabel('Time in sec. '), ylabel('Amplitude')