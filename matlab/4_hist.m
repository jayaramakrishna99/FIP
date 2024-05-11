img1 = imread("20210926_163436.jpg");
img = rgb2gray(img1);

subplot(2,2,1)
imshow(img)
title("Orginal")

subplot(2,2,2)
imhist(img)
xlabel("Gray levels")
ylabel("Pixels Intensity")
title("Histogram")

eq = histeq(img);
subplot(2,2,3)
imshow(eq)
title("Hist Equalization")

subplot(2,2,4)
imhist(eq)
title("Histogram")

