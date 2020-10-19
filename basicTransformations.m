clc;clear;close all;
image = imread('cameraman.tif');
%%Scaling

picSize = size(image);
originHeight = picSize(1);
originWidth =  picSize(2);
Cx = 1; Cy = 1;
Tx = -originHeight/2; Ty = -originWidth/2;
Sv = 0; Sh = 0;
scaling = [Cx  Sv  Tx;
           Sh  Cy  Ty; 
           0   0   1];
p1 = [picSize(1);0;1];
p2 = [picSize(1);picSize(2);1];
p3 = [0;picSize(2);1];
scaledP1 = scaling * p1;
scaledP2 = scaling * p2;
scaledP3 = scaling * p3;
height = ceil(max([scaledP1(1),scaledP2(1),scaledP3(1), 0])) - ceil(min([scaledP1(1),scaledP2(1),scaledP3(1), 0]));
width = ceil(max([scaledP1(2),scaledP2(2),scaledP3(2), 0])) - ceil(min([scaledP1(2),scaledP2(2),scaledP3(2), 0]));
transformedPic = zeros(height, width);
for x = 1 : height
    for y = 1 : width
        originP = inv(scaling) * [x;y;1];
        if ceil(originP(1)) > 256 || ceil(originP(1))  < 1 || ceil(originP(2)) > 256 || ceil(originP(2)) < 1
            continue;
        end
        transformedPic(x,y) = image(ceil(originP(1)),ceil(originP(2)));
    end
end
figure;imshow(image);
figure;imshow(transformedPic/256);

      