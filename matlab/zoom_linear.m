a=imread('20210607_153200.jpg');
a=rgb2gray(a);
zooming_factor=input('enter the zooming factor:');
num=zooming_factor; den=1;
%Repeated multiplication to convert decimal into fraction
while (num - floor(num) ~= 0)
    num=num*2; den=den*2;
end
[m n]=size(a); 
s1=num*m;
re=zeros(s1,num*n);
for i=1:m
    for j=1:n
        k=num*(i-1);
        l=num*(j-1);
        re(k+1,l+1)=a(i,j); 
    end
end
i=1;
while (i<=(s1))
    j=1;
    while (j<=(num*n))
        x=ones(num,num); 
        for p=1:num
            for q=1:num
                c(p,q)=re(i,j); % To extract the pixel matrix
                j=j+1;
            end
            i=i+1;j=j-num;
        end
        z=ifft2(fft2(c).*fft2(x)); % To perform the circular convolution 
        %using DFT and IDFT
        i=i-num;
    for p=1:num
        for q=1:num
            re(i,j)=z(p,q); % To generate the interpolated matrix
            j=j+1;end
        i=i+1; j=j-num;end
    i=i-num; j=j+num;end
i=i+num; end
if (den>1) %to check whether the zooming factor is integer or not.
    m=den;[p,q]=size(re);
    a=double(re);
for i=1:ceil(p/m)
    for j=1:ceil(q/m)
        if(((m*i)<p) && ((m*j)<q))
            b(i,j)=re(m*i,m*j);
        else b(i,j)=0;
        end
    end
    end
else b=re;end
imshow(a),title("Orginal image");
figure, imshow (uint8(b)),title("zoomed image");