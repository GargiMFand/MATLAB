% BLPF using FDA tool
fs=10000; % Sampling rate 
fc=1000; % Cutoff frequency
n1 = 2;% order
%filter coefficients from FDA tool
b=[];
a=[];
%% Apply filter on test input
t=0:1/fs:1-(1/fs); % duration of 1 sec.
x = 1.5+sin(2*pi*150*t)+sin(2*pi*580*t)+sin(2*pi*1000*t)+2*sin(2*pi*2500*t)+3*sin(2*pi*3000*t);% x(n) test input
N=length(x);
y = filter(b,a,x); % Passing x(n) through the filter-1
f=fs*(0:N-1)/N; %frequency axis construction
X=fft(x); %FFT of input
Y=fft(y); %FFT of output filter

figure,subplot(2,1,1)
% input in frequency domain
plot(f,abs(X)/N), title('Spectrum of i/p signal'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
% output in frequency domain
subplot(3,1,2)
plot(f,abs(Y)/N,'r'),title(['Spectrum of filtered o/p, Order- ',num2str(n1)]),xlabel('Frequency "Hz" '), ylabel('Magnitude');

%% Plot i/p and o/p in time domain (few samples)
figure,subplot(2,1,1)
plot(t(1:500),x(1:500)), title('I/P signal x(t)'),xlabel('Time in sec. '), ylabel('Amplitude')
subplot(2,1,2)
plot(t(1:500),y1(1:500)), title(['Low Pass Filtered Signal, Order- ', num2str(n1)]),xlabel('Time in sec. '), ylabel('Amplitude')