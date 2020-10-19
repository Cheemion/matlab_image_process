clc;clear;
im = imread('beauty.bmp');
temp = double(im);

c0 = mod(temp, 2);
c0 = c0 .* imread('linaWaterMark.bmp');

c1 = mod(floor(temp / 2), 2);
c1 = c1 .* imread('linaWaterMark.bmp');

c2 = mod(floor(temp / 4), 2);
c2 = c2 .* imread('linaWaterMark.bmp');

c3 = mod(floor(temp / 8), 2);
c3 = c3 .* imread('linaWaterMark.bmp');

c4 = mod(floor(temp / 16), 2);
c4 = c4 .* imread('linaWaterMark.bmp');

c5 = mod(floor(temp / 32), 2);
c5 = c5 .* imread('linaWaterMark.bmp');

c6 = mod(floor(temp / 64), 2);
c6 = c6 .* imread('linaWaterMark.bmp');

c7 = mod(floor(temp / 128), 2);
c7 = c7 .* imread('linaWaterMark.bmp');

%%最后一位可以拿来存储水印
%%c7 = c7 .* imread('linaWaterMark.bmp');

figure, imshow(c0);
figure, imshow(c1);
figure, imshow(c2);
figure, imshow(c3);
figure, imshow(c4);
figure, imshow(c5);
figure, imshow(c6);
figure, imshow(c7);

cc = 2 * (2 * (2 * (2 * (2 * (2 * ((2 * c7) + c6) + c5) + c4) + c3) + c2) + c1) + c0;
figure, imshow(uint8(cc));

