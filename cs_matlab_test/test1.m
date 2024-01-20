image = imread('lena.jpg'); 
image = rgb2gray(image);
[M, N] = size(image);

% Encoder
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

% Decoder
decoded_image = zeros(M, N);

for i = 2:M
    for j = 2:N
        decoded_image(i, j) = encoded_image(i, j) + predicted_image(i, j);
    end
end

figure;
imshow(image), title('Original Image');
figure;
imshow(uint8(encoded_image)), title('Encoded Image');
figure;
imshow(uint8(decoded_image)), title('Decoded Image');





