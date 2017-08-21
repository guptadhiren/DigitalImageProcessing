clear;clc;close all;
f= imread('rice.png');
figure;imshow(f);title('Input Image');
bw=im2bw(f);
L=bwlabel(bw);
%L=uint16(L);
figure;imshow(bw);title('Threshold Image');
stats=regionprops(L,'Area');
area=cat(1,stats.Area);
figure;plot(area);
temp=L;
figure;imshow(L,[]);title('Labeled Image');
%O = ismember(L, find(area > 50));
%figure, imshow(O);title('check');
for i =1:numel(area)
    if(area(i)<=50)
        temp(find(L==i))=0;
    end
end

%Erosion
temp(find(temp~=0))=1;
figure;imshow(temp,[]);title('removed small Regions Image');
 B = [1 1 1; 1 1 1; 1 1 1];
erode=imerode(temp,B);
figure;imshow(erode,[]);title('Eroded Image');
figure;imshow(temp-erode,[]);title('output Image');