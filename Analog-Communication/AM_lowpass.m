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
s = AM_signal(m,c,u);

%DSBSC signal
d = DSBSC(m,c);

%DSBSC signal by balanced modulator
s1 = m .* cos(2 * pi * lo_freq *t);

order=1;
f=5*fm;
[b,a]=butter(order,f/(fs/2),"low");
% lowpass filter
ls = filter(b,a,s);

ld = filter(b,a,d);

ls1 = filter(b,a,s1);

% Plots
subplot(3,2,1)
plot(t,s)
xlabel('Time');
ylabel('Amplitude');
title('AM signal');

subplot(3,2,2)
plot(t,d)
xlabel('Time');
ylabel('Amplitude');
title('DSBSC signal');

subplot(3,2,3)
plot(t,s1)
xlabel('Time');
ylabel('Amplitude');
title('DSBSC-LO signal');

subplot(3,2,4)
plot(t,ls)
xlabel('Time');
ylabel('Amplitude');
title('Lowpass AM signal');

subplot(3,2,5)
plot(t,ld)
xlabel('Time');
ylabel('Amplitude');
title('Lowpass DSBSC signal');

subplot(3,2,6)
plot(t,ls1)
xlabel('Time');
ylabel('Amplitude');
title('Lowpass DSBSC_LO signal');