%  Sampling and Reconstruction
f=5;% max frequency
Fsu=1*pi*f;%under-sampling
Fsc=2*pi*f;%critical-sampling
Fso=5*pi*f;%over-sampling
Tu=1/Fsu;
Tc=1/Fsc;
To=1/Fso;
tc=0:0.001:1;% continueous time
% Discrite time
tdu=0:Tu:1;
tdc=0:Tc:1;
tdo=0:To:1;
% Orignal Signal
s = sin(2*pi*f*tc);

% Sampled Signal
sampled_signalu=sin(2*pi*f*tdu);
sampled_signalc=sin(2*pi*f*tdc);
sampled_signalo=sin(2*pi*f*tdo);

% Reconstructed Signal
[r,rl]=Reconstruction(tc,tdu,sampled_signalu);
[rc,rlc]=Reconstruction(tc,tdc,sampled_signalc);
[ro,rlo]=Reconstruction(tc,tdo,sampled_signalo);

% Plots
figure;

subplot(7,1,1);
plot(tc,s,'b-','LineWidth',2);
title('Orignal-signal');
xlabel('Time');
ylabel('Amplitude');

subplot(7,1,2);
stem(tdu,sampled_signalu,'r');
title('Sampled-signal(under-sampled)');
xlabel('Time');
ylabel('Amplitude');

subplot(7,1,3);
stem(tdc,sampled_signalc,'r');
title('Sampled-signal(critical-sampled)');
xlabel('Time');
ylabel('Amplitude');

subplot(7,1,4);
stem(tdo,sampled_signalo,'r');
title('Sampled-signal(over-sampled)');
xlabel('Time');
ylabel('Amplitude');

subplot(7,1,5);
plot(tc,r,'g--','LineWidth',2);
hold on;
plot(tc,rl,'m:','LineWidth',2);
title('Reconstructed-signal(under-sampled)');
xlabel('Time');
ylabel('Amplitude');

subplot(7,1,6);
plot(tc,rc,'g--','LineWidth',2);
hold on;
plot(tc,rlc,'m:','LineWidth',2);
title('Reconstructed-signal(critical-sampled)');
xlabel('Time');
ylabel('Amplitude');
 
subplot(7,1,7);
plot(tc,ro,'g--','LineWidth',2);
hold on;
plot(tc,rlo,'m:','LineWidth',2);
title('Reconstructed-signal(over-sampled)');
xlabel('Time');
ylabel('Amplitude');

sgtitle("Sampling and Reconstruction");
