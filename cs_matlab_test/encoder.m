function encoded_image = encoder(image)
    [M, N] = size(image);
    predicted_image = zeros(M, N);
    quantized_error = zeros(M, N);
    encoded_image = zeros(M, N);

    for i = 2:M
        for j = 2:N
            predicted_image(i, j) = image(i-1, j-1); 
            quantized_error(i, j) = image(i, j) - predicted_image(i, j);
            encoded_image(i, j) = quantized_error(i, j);
        end
    end
end