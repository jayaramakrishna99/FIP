a = imread('20210607_153200.jpg');
%a=double(a);

mean_kernel = fspecial('average', [3, 3]);
mean_enhance=imfilter(a,mean_kernel);

gaussian_kernel = fspecial('gaussian', [5, 5], 1);
gaussian_enhance=imfilter(a,gaussian_kernel);

sharpen_kernel = fspecial('unsharp');
sharpen_enhance=imfilter(a,sharpen_kernel);

subplot(2, 2, 1);
imshow(a);
title('Original Image');

subplot(2, 2, 2);
imshow(mean_enhance);
title('Enhanced Image (Mean Filter)');

subplot(2, 2, 3);
imshow(gaussian_enhance);
title('Enhanced Image (Gaussian Filter)');

subplot(2, 2, 4);
imshow(sharpen_enhance);
title('Enhanced Image (Sharpening Filter)');
