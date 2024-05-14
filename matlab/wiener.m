
a = imread('20210926_163436.jpg');
degraded_image = im2double(a);


PSF = fspecial('gaussian', [7 7], 1);

estimated_nsr = 0.0001;

restored_image = deconvwnr(degraded_image, PSF, estimated_nsr);

figure;
subplot(1,3,1);imshow(a)
subplot(1, 3,2);
imshow(degraded_image);
title('Degraded Image');
subplot(1, 3,3);
imshow(restored_image);
title('Restored Image (Wiener Filter)');