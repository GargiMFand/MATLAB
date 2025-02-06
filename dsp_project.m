 close all; 
clear all;
clc;

% Load the wav file
[audio, Fs] = audioread('audio.wav');  % Load the audio file
if size(audio, 2) == 2
    audio = audio(:,1);  % Convert to mono if stereo
end

% Get user input for delay and attenuation
delay_time = input('Enter the echo delay in seconds: ');  % User-defined delay
attenuation_factor = input('Enter the attenuation factor (between 0 and 1): ');  % Echo volume relative to original

% Ensure attenuation factor is between 0 and 1
if attenuation_factor < 0 || attenuation_factor > 1
    error('Attenuation factor must be between 0 and 1.');
end
   
% Calculate the number of samples for the delay
delay_samples = round(Fs * delay_time);

% Create the echo signal
echo_signal = zeros(length(audio) + delay_samples, 1);  % Create a longer signal to store the echo
echo_signal(1:length(audio)) = audio;  % Place the original audio into the signal

% Add the delayed echo with attenuation
echo_signal(delay_samples+1:end) = echo_signal(delay_samples+1:end) + attenuation_factor * audio;

% Play the original and echoed audio
disp('Playing original audio...');
sound(audio, Fs);
pause(length(audio)/Fs + 1);  % Wait for the original audio to finish

disp('Playing audio with echo...');
sound(echo_signal, Fs);


% Plot the original and echoed signals for comparison
t = (0:length(audio)-1)/Fs;  % Time vector for original audio
t_echo = (0:length(echo_signal)-1)/Fs;  % Time vector for echoed audio

figure;
subplot(2,1,1);
plot(t, audio); 
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Audio Signal');
grid on;

subplot(2,1,2);
plot(t_echo, echo_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title(['Echoed Audio Signal (Delay = ' num2str(delay_time) ' s, Attenuation = ' num2str(attenuation_factor) ')']);
grid on;

audiowrite('echo_audio.wav', echo_signal, Fs);  % Save the echoed audio to a file