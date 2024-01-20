% Mid-Rise Quantization
function quantized_signal = midRiseQuantization(input_signal, num_levels)
    step_size = (max(input_signal)-min(input_signal))/(2^num_levels);
    quantized_signal=floor(input_signal/step_size)*step_size+step_size/2;
end
