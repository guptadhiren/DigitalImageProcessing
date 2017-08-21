clear;
f=imread('input\input2.png');
N=11;
Nh=floor(N/2);
[R,C]=size( f );
bcv=findTotsu(f);
[mv,mindex]=max(bcv);
Totsu=mindex-1;
figure;imshow(f>=Totsu);
meanIm=zeros(R,C,'uint8');
for r= Nh+1: (R-Nh-1)
    for c= Nh+1 :(C-Nh-1)
        meanIm(r,c)= mean(mean(f(r-Nh:r+Nh,c-Nh:c+Nh)));
    end
end


figure;imshow(meanIm);
title('Mean Image');

k=1;
g=f>= k*meanIm;
figure;imshow(g);

k=.9;
g=f>= k*meanIm;
figure;imshow(g);

k=1.1;
g=f>= k*meanIm;
figure;imshow(g);
