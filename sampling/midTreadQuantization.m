% Mid-Tread Quantization
function quantized_signal = midTreadQuantization(input_signal, num_levels)
    step_size = (max(input_signal)-min(input_signal))/(2^num_levels);
    quantized_signal = floor(input_signal/step_size+(1/2))*step_size;
end
