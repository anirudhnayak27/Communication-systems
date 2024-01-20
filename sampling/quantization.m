% Example Usage:
f=5;
fs = 2*f;
t=0:0.001:1;
input_signal = sin(2*pi*f*t);  % Replace with your signal
num_levels = 6;                 % Number of quantization levels

% Mid-Rise Quantization
midRiseQuantizedSignal = midRiseQuantization(input_signal, num_levels);

% Mid-Tread Quantization
midTreadQuantizedSignal = midTreadQuantization(input_signal, num_levels);


figure;
plot(t,input_signal,'-g',t,midRiseQuantizedSignal,'r',t,midTreadQuantizedSignal);
legend('original','mid rise','mid thread');
xlabel('input signal');
ylabel('quantized output');
title(['Quantized with ',num2str(num_levels),' bits']);