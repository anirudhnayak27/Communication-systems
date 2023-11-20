fc = 100;
fm = 10;
fs = 2 * fc;
t = 0:1/fs:1;
Am = 1;
Ac = 1;
u = 0.5;

% message signal
m = Am * cos(2 * pi * fm * t);

% Carrier signal
c = Ac * cos(2 * pi * fc * t);

%AM signal
s = (c + (((u*Ac)/2)*cos(2*pi*(fc+fm)*t) + (((u*Ac)/2)*cos(2 * pi * (fc-fm)*t))));

% Plots
subplot(3,1,1)
plot(t,m)
xlabel('Time');
ylabel('Amplitude');
title('Message signal');

subplot(3,1,2)
plot(t,c)
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');

subplot(3,1,3)
plot(t,s)
xlabel('Time');
ylabel('Amplitude');
title('Amplitude Modulated signal');
