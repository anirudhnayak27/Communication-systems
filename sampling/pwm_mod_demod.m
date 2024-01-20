function [pwm_mod,pwm_demod]  =pwm_mod_demod(data,Fs,fc,bit_rate,T,duty_cycle)
  t  = 0:T:(length(data)/bit_rate - T);

  % PWM Modulation
  pwm_mod = zeros(1,length(t));
  for i=1:length(t)
      sym_index=ceil(i/(Fs/bit_rate));
      pwm_mod(i) = square(2*pi*fc*t(i),duty_cycle*100*(data(sym_index)+1));
  end

  % PWm Demodulation
  pwm_demod = zeros(1,length(t));
  for i=1:length(t)
      pwm_demod(i) = (square(2*pi*fc*t(i),duty_cycle*100)+1)/2;
  end
end