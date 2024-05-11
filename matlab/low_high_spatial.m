% Read the input image
input_image = imread('20210926_163436.jpg');

if size(input_image, 3) == 3
    input_image_gray = rgb2gray(input_image);
else
    input_image_gray = input_image;
end

% Define the size of the filter (e.g., 3x3, 5x5, etc.)
filter_size = 5;

% Low-pass filter (averaging filter)
low_pass_filter = ones(filter_size) / (filter_size ^ 2);

% Apply low-pass filter to the image
low_pass_filtered_image = imfilter(input_image_gray, low_pass_filter, 'conv');

% High-pass filter (Laplacian filter)
high_pass_filter = fspecial('laplacian', 0);

% Apply high-pass filter to the image
high_pass_filtered_image = imfilter(input_image_gray, high_pass_filter, 'conv');

% Display the original and filtered images
subplot(2, 3, 1);
imshow(input_image_gray);
title('Original Image');

subplot(2, 3, 2);
imshow(low_pass_filtered_image);
title('Low-Pass Filtered Image');

subplot(2, 3, 3);
imshow(high_pass_filtered_image);
title('High-Pass Filtered Image');

% Compute the power spectrum of the original and filtered images
power_spectrum_original = abs(fftshift(fft2(input_image_gray))).^2;
power_spectrum_low_pass = abs(fftshift(fft2(low_pass_filtered_image))).^2;
power_spectrum_high_pass = abs(fftshift(fft2(high_pass_filtered_image))).^2;

% Display the power spectra
subplot(2, 3, 4);
imshow(log(1 + power_spectrum_original), []);
title('Power Spectrum (Original Image)');

subplot(2, 3, 5);
imshow(log(1 + power_spectrum_low_pass), []);
title('Power Spectrum (Low-Pass Filtered Image)');

subplot(2, 3, 6);
imshow(log(1 + power_spectrum_high_pass), []);
title('Power Spectrum (High-Pass Filtered Image)');
