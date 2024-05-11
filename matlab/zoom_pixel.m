a=imread('20211106_101356.jpg'); 
a=rgb2gray(a);
[m n]=size(a);
p=input('Enter the size you want:'); 
for i=1:m
    for j=1:n
        for k=1:p
            b(i,(j-1)*p+k)=a(i,j);% replication of pixels in row wise
        end
    end
end
c=b;
[m n]=size(c);
for i=1:n
    for j=1:m
        for k=1:p
            b((j-1)*p+k,i)=c(j,i); % replication of pixel in column wise
        end
    end
end
subplot(2,2,1);imshow(a),title('original image')
subplot(2,2,2);imshow(b),title('Zoomed image') 
xlabel(sprintf('Zooming factor is %g',p))