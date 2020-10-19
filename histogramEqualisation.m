clear;clc;close all;
im = imread('beauty.bmp');
grayLevelNum = zeros(1,256);
for grayIntensity = 0 : 255
    grayLevelNum(grayIntensity + 1) = sum(sum(im == grayIntensity));
end
picSize = size(im);
probability = grayLevelNum / (picSize(1) * picSize(2));
for i = 2:256
    probability(i) = probability(i) +  probability(i - 1);
end

newGrayLevelIntensity = round(probability * 255);
copy = newGrayLevelIntensity(im + 1);
figure;imshow(im);
figure;imshow(copy / 256);

