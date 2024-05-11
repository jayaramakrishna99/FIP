a=imread('20210926_163436.jpg');
a=rgb2gray(a);
[m n]=size(a);
mask=ones(m,n);
for i=300:500
    for j=400:600
        mask(i,j)=0;
    end
end
c=fft2(a);
d=fftshift(mask);
e=c.*d;
f=abs(ifft2(e));    
subplot(2,2,1),imshow(a),title('original image')
subplot(2,2,2),imshow(mat2gray(f)),title('High pass filtered image')
subplot(2,2,3),imshow(mask),title('high pass filter mask')
