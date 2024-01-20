% Parameters
f_carrier = 1e6;  % Carrier frequency (1 MHz)
f_modulation = 10e3;  % Modulation frequency (10 kHz)
duration = 1e-3;  % Signal duration (1 ms)

% Time vector
t = 0:1e-7:duration;

% Generate carrier and modulation signals
carrier = cos(2*pi*f_carrier*t);
modulating = square(2*pi*f_modulation*t);

% Amplitude modulation
am_signal = (1 + 0.5*modulating).*carrier;

% Plot the original carrier, modulating signal, and the amplitude-modulated signal
figure;
subplot(3,1,1);
plot(t, carrier);
title('Carrier Signal');

subplot(3,1,2);
plot(t, modulating);
title('Modulating Signal');

subplot(3,1,3);
plot(t, am_signal);
title('Amplitude-Modulated Signal');

% Frequency analysis
fft_am_signal = fft(am_signal);
fft_freq = linspace(0, 1/(2*(t(2)-t(1))), length(t)/2);

% Plot the frequency spectrum of the amplitude-modulated signal
figure;
plot(fft_freq, abs(fft_am_signal(1:length(fft_freq))));
title('Frequency Spectrum of Amplitude-Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% Check which frequencies are present
sideband_frequencies = f_carrier + [-f_modulation, f_modulation];
disp('Sideband frequencies present in the modulated signal:');
disp(sideband_frequencies);
