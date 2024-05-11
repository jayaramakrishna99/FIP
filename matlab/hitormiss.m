a=imread("j.png");
%(x,b)=erosion(x,b) and erosion(x',b')
%b=[0 0 0;1 1 0;1 1 0];
b=[1 1 1;1 1 1;1 1 1];
%b=[0 0 0;0 0 0;0 0 0];
erode=imerode(a,b);
a_c=imcomplement(a);
b_c=imcomplement(b);
b_c
erode_c=imerode(a_c,b_c);
hit_or_miss=erode & erode_c;
hm=bwhitmiss(a,b,b_c);
subplot(2,3,1);imshow(a);title("Original");
subplot(2,3,2);imshow(erode);title("Erosion");
subplot(2,3,3);imshow(a_c);title("complement of original");
subplot(2,3,4);imshow(erode_c);title("complement of erode");
subplot(2,3,5);imshow(hit_or_miss);title("Hit or miss");
subplot(2,3,6);imshow(hm);title("hit or miss inbuilt");