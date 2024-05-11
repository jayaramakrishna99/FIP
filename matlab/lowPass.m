a=imread('20210926_163436.jpg');
a=rgb2gray(a);
[m n]=size(a);
mask=zeros(m,n);
for i=300:500
    for j=350:550
        mask(i,j)=1;
    end
end
c=fftshift(mask);
b=fft2(a);
d=b.*c;
e=abs(ifft2(d));
subplot(2,2,1),imshow(a),title('original image')
subplot(2,2,2),imshow(uint8(e)),title('Low pass filtered image')
subplot(2,2,3),imshow(mask),title('Low pass filter mask')