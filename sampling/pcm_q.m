% Parameters
bit_rate = 50e6  % Bits per second
bits_per_sample = 7
modulation_freq = 1e6  % Hz

% Sampling rate
fs = bit_rate / bits_per_sample

% Message bandwidth (Nyquist interval)
message_bandwidth = fs / 2

% Quantization levels
L = 2^bits_per_sample

% Quantization step size
delta = 2 / L

% Maximum quantization error
e_max = delta / 2

% Signal generation
t = 0:1/fs:1/modulation_freq;  % One period of the sinusoid
signal = cos(2*pi*modulation_freq*t);

% Quantization
quantized_signal = round(signal / delta) * delta

% Quantization noise
quantization_noise = quantized_signal - signal

% Signal power
signal_power = mean(signal.^2)

% Quantization noise power
noise_power = mean(quantization_noise.^2)

% SQNR
SQNR = 10 * log10(signal_power / noise_power)

% Display results
fprintf('Message bandwidth: %.6f MHz\n', message_bandwidth/1e6);
fprintf('SQNR: %.2f dB\n', SQNR);

% Plot signals (optional)
figure;
plot(t, signal);
hold on;
plot(t, quantized_signal, 'r--');
plot(t, quantization_noise, 'g-.');
legend('Original Signal', 'Quantized Signal', 'Quantization Noise');
xlabel('Time (s)');
ylabel('Amplitude');
title('PCM Signal Quantization');
