Fs = 20;
T = 1/Fs;
fc = 10;
bit_rate = 2;
duty_cycle = 0.5;

%generate random binary data
data = randi([0,1],1,round(10*Fs/bit_rate));

% PPM modulation and demodulation
[ppm_mod,ppm_demod] = ppm_mod_demod(data,Fs,fc,bit_rate,T);

% PWM modulation and demodulation
[pwm_mod,pwm_demod] = pwm_mod_demod(data,Fs,fc,bit_rate,T,duty_cycle);

% Plots
figure;

subplot(5,1,1);
plot(data,'b-','LineWidth',2);
title("Binary data");
xlabel("Time");
ylabel("Amplitude");

subplot(5,1,2);
plot(ppm_mod,'r-','LineWidth',2);
title("PPM Modualted signal");
xlabel("Time");
ylabel("Amplitude");

subplot(5,1,3);
plot(ppm_demod,'g-','LineWidth',2);
title("PPM Demoulated signal");
xlabel("Time");
ylabel("Amplitude");

subplot(5,1,4);
plot(pwm_mod,'m-','LineWidth',2);
title("PWM modulated signal");
xlabel("Time");
ylabel("Amplitude");

subplot(5,1,5);
plot(pwm_demod,'b-','LineWidth',2);
title("PWM demodulated signal");
xlabel("Time");
ylabel("Amplitude");

sgtitle("PPM and PWM Modulation and Demodulation");