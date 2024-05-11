img1 = imread("20220308_135615.jpg");
subplot(2,3,1)
imshow(img1)
title("Image 1")

img2=imread("20210926_163436.jpg");
subplot(2,3,2)
imshow(img2)
title("Image2")

i_re1=imresize(img1,[500,500]);
i_re2=imresize(img2,[500,500]);

bit_or=bitor(i_re1,i_re2);
subplot(2,3,3)
imshow(bit_or)
title("Bit OR")

bit_and=bitand(i_re1,i_re2);
subplot(2,3,4)
imshow(bit_and)
title("Bit AND")

bit_xor=bitxor(i_re1,i_re2);
subplot(2,3,5)
imshow(bit_xor)
title("Bit XOR")

complement=imcomplement(img2);
subplot(2,3,6)
imshow(complement)
title("Complement")

sgtitle("Logical Operations")
