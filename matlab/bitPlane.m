a=imread('20210607_153200.jpg');
a=rgb2gray(a);
[m ,n]=size(a);
for i=1:m
    for j=1:n
        b7(i,j)=bitand(a(i,j),128);
        b6(i,j)=bitand(a(i,j),64);
        b5(i,j)=bitand(a(i,j),32); 
        b4(i,j)=bitand(a(i,j),16); 
        b3(i,j)=bitand(a(i,j),8); 
        b2(i,j)=bitand(a(i,j),4); 
        b1(i,j)=bitand(a(i,j),2); 
        b0(i,j)=bitand(a(i,j),1); 
    end
end

       
subplot(3,3,1),imshow(a),title("Original"),
subplot(3,3,2),imshow(b0),title("0-bit plane image"),
subplot(3,3,3),imshow(b1),title("1-bit plane image"),
subplot(3,3,4),imshow(b2),title("2-bit plane image"),
subplot(3,3,5),imshow(b3),title("3-bit plane image"),
subplot(3,3,6),imshow(b4),title("4-bit plane image"),
subplot(3,3,7),imshow(b5),title("5-bit plane image"),
subplot(3,3,8),imshow(b6),title("6-bit plane image"),
subplot(3,3,9),imshow(b7),title("7-bit plane image"),
sgtitle("Grey to 8-Bit Plane")

