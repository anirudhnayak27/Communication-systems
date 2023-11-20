fc = 100;
fs = 2 * fc;
t = -10:1:10;
t1 = 0:1/fs:1;
Ac = 1;
u = 0.5;

% message signal
m = t/(1 + power(t,2));

% Carrier signal
c = Ac * cos(2 * pi * fc * t1);

s = Ac * cos(2 * pi * fc * t1) + Ac .* m .* cos(2*pi*fc*t1);

% Plots
subplot(3,1,1)
plot(t1,m)
xlabel('Time');
ylabel('Amplitude');
title('Message signal');
xlim([-10,10]);
ylim([-1,1]);

subplot(3,1,2)
plot(t1,c)
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');

subplot(3,1,3)
plot(t1,s)
xlabel('Time');
ylabel('Amplitude');
title('Amplitude Modulated signal');