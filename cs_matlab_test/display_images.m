function display_images(original_image, encoded_image, decoded_image)
    figure;
    
    subplot(1, 3, 1), imshow(original_image), title('Original Image');
    subplot(1, 3, 2), imshow(uint8(encoded_image)), title('Encoded Image');
    subplot(1, 3, 3), imshow(uint8(decoded_image)), title('Decoded Image');
end