a=imread("j.png");
b=[1 1 1;1 1 1;1 1 1];

erode=imerode(a, b);
dilate=imdilate(a,b);
open=imopen(a,b);
close=imclose(a,b);

subplot(2,3,1);
imshow(a);
title("Original");
subplot(2,3,2);
imshow(erode);
title("Erosion");
subplot(2,3,3);
imshow(dilate);
title("Dilation");
subplot(2,3,4);
imshow(open);
title("Opening");
subplot(2,3,5);
imshow(close);
title("Closing");
sgtitle("Morphological Process");