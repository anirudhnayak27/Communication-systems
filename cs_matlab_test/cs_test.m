image = imread("lena.jpg");
image = rgb2gray(image);
encoded_image = encoder(image);
decoded_image = decoder(encoded_image,image);
figure;
subplot(1, 3, 1), imshow(image), title('Original Image');
subplot(1, 3, 2), imshow(uint8(encoded_image)), title('Encoded Image');
subplot(1, 3, 3), imshow(uint8(decoded_image)), title('Decoded Image');
