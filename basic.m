%%
im  = imread('beauty.bmp');
%%
colormap(jet);
%%
img1 = uint8(zeros(256,246));
%%
imfinfo('beauty.bmp');
%% 
impixelinfo;
%%
figure();
subplot(2,2,1,im);
[im, colorMap] = imread('indexed.bmp');
imshow(im, colorMap);
%% 抽取最后一位的数据
temp = double(c);
c0 = mod(temp, 2);
%%
x = imread('beauty.bmp');
y = imresize(x, 1/2);
figure, imshow(y);
figure, imagesc(y);
colormap(gray);
%%
i = imread('beauty.bmp');
imhist(i)%直方图
