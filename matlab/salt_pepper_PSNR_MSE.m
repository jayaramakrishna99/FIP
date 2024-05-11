input_image = imread('20210607_153200.jpg');

if size(input_image, 3) == 3
    input_image_gray = rgb2gray(input_image);
else
    input_image_gray = input_image;
end

noisy_image = imnoise(input_image_gray, 'salt & pepper', 0.05);

subplot(1, 3, 1);
imshow(input_image_gray);
title('Original Image');

subplot(1, 3, 2);
imshow(noisy_image);
title('Noisy Image');

% Remove salt and pepper noise using median filter
filtered_image = medfilt2(noisy_image);

subplot(1, 3, 3);
imshow(filtered_image);
title('Filtered Image');

psnr_noisy = psnr(noisy_image, input_image_gray);
mse_noisy = immse(noisy_image, input_image_gray);

psnr_filtered = psnr(filtered_image, input_image_gray);
mse_filtered = immse(filtered_image, input_image_gray);

fprintf('PSNR (Noisy Image): %.2f dB\n', psnr_noisy);
fprintf('MSE (Noisy Image): %.2f\n', mse_noisy);
fprintf('PSNR (Filtered Image): %.2f dB\n', psnr_filtered);
fprintf('MSE (Filtered Image): %.2f\n', mse_filtered);
