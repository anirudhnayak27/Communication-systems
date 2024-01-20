
function decoded_image = decoder(encoded_image,image)
    [M, N] = size(encoded_image);
    predicted_image = zeros(M, N);
    decoded_image = zeros(M, N);

    for i = 2:M
        for j = 2:N
            predicted_image(i, j) = image(i-1, j-1);
            decoded_image(i, j) = encoded_image(i, j) + predicted_image(i, j);
        end
    end
end