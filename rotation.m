clc;clear;close all;
image = imread('cameraman.tif');
%%Scaling

picSize = size(image);
originHeight = picSize(1);
originWidth =  picSize(2);
translateToCenter = [-1 0  originHeight / 2;
                     0  1  -originWidth / 2;
                     0  0                 1];

thate = pi/2;
transform = [cos(thate)  -sin(thate)   0;
             sin(thate)   cos(thate)   0; 
                0            0        1];

p1 = [picSize(1);0;1];
p2 = [picSize(1);picSize(2);1];
p3 = [0;picSize(2);1];
scaledP1 = transform * p1;
scaledP2 = transform * p2;
scaledP3 = transform * p3;
height = ceil(max([scaledP1(1),scaledP2(1),scaledP3(1), 0])) - ceil(min([scaledP1(1),scaledP2(1),scaledP3(1), 0]));
width = ceil(max([scaledP1(2),scaledP2(2),scaledP3(2), 0])) - ceil(min([scaledP1(2),scaledP2(2),scaledP3(2), 0]));

centerToLeftTop = [1  0  0.5 * width;
                   0 -1 0.5 * height;
                   0  0     1];


transformedPic = zeros(height, width);
for x = 1 : height
    for y = 1 : width
        originP = inv(centerToLeftTop * transform *  translateToCenter) * [x;y;1];
        if ceil(originP(1)) > 256 || ceil(originP(1))  < 1 || ceil(originP(2)) > 256 || ceil(originP(2)) < 1
            continue;
        end
        transformedPic(x,y) = image(ceil(originP(1)),ceil(originP(2)));
    end
end
figure;imshow(image);
figure;imshow(transformedPic/256);

      