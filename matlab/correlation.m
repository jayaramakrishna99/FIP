image1 = imread('20210607_153200.jpg');
%image2 = imread('20210926_163436.jpg');
image2 = imread('20210607_153200.jpg');
%image2=imresize(image2,[400,400]);
%image2=imcomplement(image2);

image1 = rgb2gray(image1);
image2 = rgb2gray(image2);

% Normalize the images to have zero mean and unit standard deviation
image1 = (double(image1) - mean(double(image1(:)))) / std(double(image1(:)));
image2 = (double(image2) - mean(double(image2(:)))) / std(double(image2(:)));

correlation_coefficient = corr2(image1, image2);

disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);
