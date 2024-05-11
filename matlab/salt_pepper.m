a=imread("20210607_153200.jpg");
a=rgb2gray(a);
b=imnoise(a,'salt & pepper',0.1);

box1=imfilter(b, ones(3) / 9);
box2=imfilter(b, ones(5) / 25);
m1=medfilt2(b,[3,3]);
m2=medfilt2(b,[5,5]);
a1=imfilter(b, fspecial('average', [3 3]));
a2=imfilter(b, fspecial('average', [5 5]));
subplot(2,2,1),imshow(a),title('Original image')
subplot(2,2,2),imshow(b),title('Salt & pepper noise')
subplot(2,2,3),imshow(box1),title('Box filter 3x3')
subplot(2,2,4),imshow(box2),title('Box filter 5x5')
figure,
subplot(2,2,1),imshow(uint8(m1)),title('3x3 Median filter')
subplot(2,2,2),imshow(uint8(m2)),title('5x5 Median filter')
subplot(2,2,3),imshow(uint8(a1)),title('3x3 Averaging Filter')
subplot(2,2,4),imshow(uint8(a2)),title('5x5 Averaging Filter')