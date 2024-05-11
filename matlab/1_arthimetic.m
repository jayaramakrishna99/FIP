img1 = imread("20220308_135615.jpg");
subplot(2,4,1)
imshow(img1)
title("Image 1")

grayimage=rgb2gray(img1);
subplot(2,4,2)
imshow(grayimage)
title("Gray Image")

img2=imread("20210926_163436.jpg");
subplot(2,4,3)
imshow(img2)
title("Image 2")

i_re1=imresize(img1,[500,500]);
i_re2=imresize(img2,[500,500]);

add=imadd(i_re1,i_re2);
subplot(2,4,4)
imshow(add)
title("Addition")


sub=imsubtract(i_re1,i_re2);
subplot(2,4,5)
imshow(sub)
title("subtract")

mul=immultiply(i_re1,i_re2);
subplot(2,4,6)
imshow(mul)
title("Multiplication")

div=imdivide(i_re1,i_re2);
subplot(2,4,7)
imshow(div)
title("Division")

sgtitle("Arthimetic operations")




