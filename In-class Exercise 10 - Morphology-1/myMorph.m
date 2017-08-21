clear;clc;close all;
f= imread('rice.png');
figure;imshow(f);title('Input Image');
bw=im2bw(f);

figure;imshow(bw);title('Threshold Image');
[R,C]= size(bw);

%erosion
s1=[0 1 0;0 1 0;0 1 0];
s2=[1 1 1;1 1 1;1 1 1];
s3= ones(7);


g1=myErosion(bw,s1);
figure;imshow(g1);title('Erosion:3x3 all with 1''s along a center column ');
g2=myDilate(bw,s1);
figure;imshow(g2);title('Dilation:3x3 all with 1''s along a center column ');

g3=myErosion(bw,s2);
figure;imshow(g3);title('Erosion:3x3 all with 1''s');
g4=myDilate(bw,s2);
figure;imshow(g4);title('Dilation:3x3 all with 1''s');

figure;imshow(g1~=g3);title('Erosion:3x3 Diffrence between Center & all with 1''s');
figure;imshow(g2~=g4);title('Dilation:3x3 Diffrence between Center & all with 1''s');

g5=myErosion(bw,s3);
figure;imshow(g5);title('Erosion:7x7 all with 1''s');
g6=myDilate(bw,s3);
figure;imshow(g6);title('Dilation:7x7 all with 1''s');

figure;imshow(g5~=g3);title('Erosion:Diffrence between 3x3 & 7x7');
figure;imshow(g6~=g4);title('Dilation:Diffrence between 3x3 & 7x7');
