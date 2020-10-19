close all;clc;clear;
i = imread('cameraman.tif');
f = ones(3,3) / 9;
i1 = filter2(f, i, 'same');
figure;
imshow(i1 / 255);
f1 = fspecial('average',[20,20]);
i2 = filter2(f1, i, 'same');
figure;
imshow(i2 / 255);

i3 = filter2(f1, i, 'valid');
figure;
imshow(i3 / 255);


i4 = filter2(f1, i, 'full');
figure;
imshow(i4 / 255);