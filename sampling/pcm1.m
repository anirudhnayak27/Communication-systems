clc;
close all;
clear all;

% Signal parameters
sampling_rate = 8e3; % 8 kHz sampling rate
n = 8; % 8 bits/sample
vmax = 4; % Maximum signal amplitude

% Generate and quantize signal
x = 0:2*pi/sampling_rate:(2*pi);
s = vmax * sin(x);
q = round(s * (2^n - 1) / vmax);

% Encode to 4 levels
encoded_signal = zeros(1, length(q));
encoded_signal(q < -(2^(n-1))) = -3;
encoded_signal(q >= -(2^(n-1)) & q < 0) = -1;
encoded_signal(q >= 0 & q < 2^(n-1)) = 1;
encoded_signal(q >= 2^(n-1)) = 3;

% Minimum bandwidth
min_bandwidth = sampling_rate / 2;

% Display results
figure;
stem(q, 'b');
hold on;
stem(encoded_signal, 'r');
legend({'Quantized', 'Encoded'});
xlabel('Time sample');
ylabel('Amplitude');
title('Quantized and Encoded Speech Signal');
fprintf('Minimum bandwidth: %d kHz\n', min_bandwidth);
