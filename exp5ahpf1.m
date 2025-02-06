fs=10000;
fc=2000;
omega_p=2*fs.*tan(2*pi*fc/(2*fs));
n1=2;
n2=6;

[z1,p1,k1]=buttap(n1);
[num1,den1]=zp2tf(z1,p1,k1);
[B1,A1]=lp2hp(num1,den1,omega_p);
[bz1,az1]=bilinear(B1,A1,fs);
[h1,f1]=freqz(bz1,az1,2048,fs);

[z2,p2,k2]=buttap(n2);
[num2,den2]=zp2tf(z2,p2,k2);
[B2,A2]=lp2hp(num2,den2,omega_p);
[bz2,az2]=bilinear(B2,A2,fs);
[h2,f2]=freqz(bz2,az2,2048,fs);

figure,subplot(2,1,1)
plot(f1,mag2db(abs(h1)),'r')
hold on
plot(f2,mag2db(abs(h2)),'b'),axis([0 fs/2 -10 10]),grid,xlable('Frequency(Hz)'),ylable('Phase Angle')
legend('butterworth of n=2','butterworth of n=5');
subplot(2,1,2)
plot(f1,angle(h1),'r')
hold on
plot(f2,angle(h2),'b'), axis([0 fs/2 -10 10]), grid, xlabel('Frequency (Hz)'), ylabel('Phase angle')
legend('butterworth of n=2','butterworth of n=5');

t=0:1/fs:1-(1/fs);
x=1.5+sin(2*pi*150*t)+sin(2*pi*580*t)+sin(2*pi*1000*t)+sin(2*pi*2500*t)+sin(2*pi*3000*t);
N=lenght(x);
y1=filter(bz1,az1,x);
y2=filter(bz2,az2,x);
f=fs*(0:N-1)/N;
X=fft(x);
Y1=fft(y1);
Y2=fft(y2);

figure,subplot(3,1,1)
plot(f,abs(X)/N), title('Spectrum of i/p signal'),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,2)
plot(f,abs(Y1)/N,'r'),title(['Spectrum of filtered o/p, Order- ',num2str(n1)]),xlabel('Frequency "Hz" '), ylabel('Magnitude')
subplot(3,1,3)
plot(f,abs(Y2)/N,'r'),title(['Spectrum of filtered o/p, Order- ',num2str(n2)]),xlabel('Frequency "Hz" '), ylabel('Magnitude')

figure,subplot(2,2,1),zplane(num1,den1), title(['Normalized BLPF poles-Zeros, Order- ',num2str(n1)])
subplot(2,2,2),zplane(bz1, az1), title(['Fc=1Khz, BHPF poles-Zeros, Order- ',num2str(n1)])
subplot(2,2,3),zplane(num2,den2), title(['Normalized BLPF poles-Zeros, Order- ',num2str(n2)])
subplot(2,2,4),zplane(bz2, az2), title(['Fc=1Khz, BHPF poles-Zeros, Order- ',num2str(n2)])

%% Plot i/p and o/p in time domain (few samples)
figure,subplot(3,1,1)
plot(t(1:500),x(1:500)), title('I/P signal x(t)'),xlabel('Time in sec. '), ylabel('Amplitude')
subplot(3,1,2)
plot(t(1:500),y1(1:500)), title(['Low Pass Filtered Signal, Order- ', num2str(n1)]),xlabel('Time in sec. '), ylabel('Amplitude')
subplot(3,1,3)
plot(t(1:500),y2(1:500)), title(['Low Pass Filtered Signal, Order- ', num2str(n2)]),xlabel('Time in sec. '), ylabel('Amplitude')
