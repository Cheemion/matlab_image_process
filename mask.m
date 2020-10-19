clc;clear;close all;
im = imread('beauty.bmp');
copy = im;
blockLength = 20;
im(length(im):length(im) + blockLength, length(im):length(im) + blockLength) = 0;

for i = 1 : blockLength : length(copy)
    for j = 1 : blockLength : length(copy)
        average = sum(sum(im(i : i + blockLength - 1, j : j + blockLength - 1))) / (blockLength * blockLength);
        copy(i : i + blockLength - 1, j : j + blockLength - 1) = round(average);
    end
end
figure;imshow(im);
figure;imshow(copy);
