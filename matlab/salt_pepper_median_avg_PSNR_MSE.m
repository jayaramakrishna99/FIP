input_image = imread('20210607_153200.jpg');
input_image_gray = rgb2gray(input_image);


noisy_image = imnoise(input_image_gray, 'salt & pepper', 0.05);

filter_size = 3;

average_filtered_image = imfilter(noisy_image, fspecial('average', filter_size));

median_filtered_image = medfilt2(noisy_image, [filter_size, filter_size]);

psnr_noisy = psnr(noisy_image, input_image_gray);
mse_noisy = immse(noisy_image, input_image_gray);

psnr_average = psnr(average_filtered_image, input_image_gray);
mse_average = immse(average_filtered_image, input_image_gray);

psnr_median = psnr(median_filtered_image, input_image_gray);
mse_median = immse(median_filtered_image, input_image_gray);

fprintf('PSNR (Noisy Image): %.2f dB\n', psnr_noisy);
fprintf('MSE (Noisy Image): %.2f\n', mse_noisy);
fprintf('PSNR (Average Filtered Image): %.2f dB\n', psnr_average);
fprintf('MSE (Average Filtered Image): %.2f\n', mse_average);
fprintf('PSNR (Median Filtered Image): %.2f dB\n', psnr_median);
fprintf('MSE (Median Filtered Image): %.2f\n', mse_median);
