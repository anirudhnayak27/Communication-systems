% function [ppm_mod, ppm_demod] = ppm_mod_demod(data, Fs, fc, bit_rate, T)
%     % Time vector
%   t = 0:T:(length(data)/bit_rate -T);
%     % PPM Modulation
%   ppm_mod = zeros(1,length(t));
%   for i=1:length(t)
%       sym_index=ceil(i/(Fs/bit_rate));
%       ppm_mod(i) = (2*data(sym_index)-1)*sin(2*pi*fc*t(i));
%   end
% 
%     % PPM Demodulation
%   ppm_demod = zeros(1,length(t));
%   for i=1:length(t)
%       sym_index=ceil(i/(Fs/bit_rate));
%       ppm_demod(i) = sign(sin(2*pi*fc*t(i)))*(data(sym_index)+1)/2;
%   end
% 
% end

function [ppm_mod, ppm_demod] = ppm_mod_demod(data, Fs, fc, bit_rate, T)
    % Time vector
    t = 0:1/Fs:T - 1/Fs;

    % PPM Modulation
    ppm_mod = zeros(1, length(data) * Fs / bit_rate);
    for i = 1:length(data)
        symbol_index = round((i - 0.5) * Fs / bit_rate);
        ppm_mod(symbol_index) = data(i);
    end

    % PPM Demodulation
    ppm_demod = zeros(1, length(data));
    for i = 1:length(data)
        symbol_index = round((i - 0.5) * Fs / bit_rate);
        ppm_demod(i) = ppm_mod(symbol_index);
    end
end