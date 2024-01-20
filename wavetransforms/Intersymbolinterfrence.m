% Generate a square signal
t = linspace(0,1,1000);
x = randi([0,1],1,25);

% Add ISI to the signal
h = [1 0.5 0.2];
isi = filter(h,1,x);

% Plot the results
figure;
subplot(2,1,1);
plot(x,'g');
title('Original Signal');
xlabel('Time (samples)');
ylabel('Amplitude');
hold on
plot(isi);
title('Signal with ISI');
xlabel('Time (samples)');
ylabel('Amplitude');


