fs = 100;
t = 0:1/10000:1;
f = 5;
x = 0.5 * sin(2 * pi * f * t);
mu = 155;
y_companded = muLawCompand(x, mu);
y_expanded = muLawExpand(y_companded, mu);

figure;
subplot(3, 1, 1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, y_companded);
title('Mu-law Companded Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, y_expanded);
title('Mu-law Expanded Signal');
