-T;
f = 10;
A = 1;

analog_signal = A * sin(2 * pi * f * t)n_levels = 2^bit_depth;

quantized_signal = round((analog_signal + A) / (2*A)*(quantization_levels - 1));

decoded_signal = quantized_signal / (quantization_levels - 1) * (2 * A) - A;

subplot(3,1,1);
plot(t,analog_signal);
title('Analog Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,quantized_signal);
title('Quantized Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,decoded_signal);
title('Decoded siganl');
xlabel('Time');
ylabel('Amplitude');

quantization_error = analog_signal - decoded_signal;
disp(['Quantization Error (RMS): ',num2str(rms(quantization_error))]);

