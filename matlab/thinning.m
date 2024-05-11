% Thinning
% thin(x,b)=x-hm(x,b)
% Thickening
% thick(x,b)=x
a=imread("j.png");
b=[1 1 1;1 1 1;1 1 1];
b_c=imcomplement(b);
hm=bwhitmiss(a,b,b_c);
thin=a-hm;
thick=(a | hm);
subplot(1,3,1);imshow(a);title("Original");
subplot(1,3,2);imshow(thin);title("Thinning")
subplot(1,3,3);imshow(thick);title("Thickening")