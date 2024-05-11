% Read the input image
input_image = imread('20210926_163436.jpg');

% Convert the image to grayscale if it's not already
if size(input_image, 3) == 3
    input_image_gray = rgb2gray(input_image);
else
    input_image_gray = input_image;
end

% Perform Fourier Transform
F = fftshift(fft2(input_image_gray));
F_mag = abs(F);
F_phase = angle(F);

% Define the cutoff frequency for low-pass filter
cutoff_frequency = 0.2; % Adjust as needed

% Define the cutoff frequency for high-pass filter
high_cutoff_frequency = 0.8; % Adjust as needed

% Generate the low-pass filter
[m, n] = size(input_image_gray);
low_pass_filter = zeros(m, n);
center_x = round(m/2);
center_y = round(n/2);
for i = 1:m
    for j = 1:n
        distance = sqrt((i - center_x)^2 + (j - center_y)^2);
        if distance <= cutoff_frequency * min(m, n)
            low_pass_filter(i, j) = 1;
        end
    end
end

% Apply low-pass filter in the frequency domain
F_low_pass = F .* low_pass_filter;

% Generate the high-pass filter
high_pass_filter = ones(m, n) - low_pass_filter;

% Apply high-pass filter in the frequency domain
F_high_pass = F .* high_pass_filter;

% Inverse Fourier Transform to obtain filtered images
low_pass_filtered_image = real(ifft2(ifftshift(F_low_pass)));
high_pass_filtered_image = real(ifft2(ifftshift(F_high_pass)));

% Display the original and filtered images
subplot(2, 3, 1);
imshow(input_image_gray);
title('Original Image');

subplot(2, 3, 2);
imshow(low_pass_filtered_image, []);
title('Low-Pass Filtered Image (Frequency Domain)');

subplot(2, 3, 3);
imshow(high_pass_filtered_image, []);
title('High-Pass Filtered Image (Frequency Domain)');

% Compute the power spectrum of the original and filtered images
power_spectrum_original = abs(F_mag).^2;
power_spectrum_low_pass = abs(F_low_pass).^2;
power_spectrum_high_pass = abs(F_high_pass).^2;

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
