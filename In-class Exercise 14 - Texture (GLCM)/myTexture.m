clear;clc;close all;

f=imread('Texture/Bark.1.png');
%f= imread(fn);
%f=ones(1000,1000,'uint8');
%f=uint8(rand(1000,1000)*256);
%f=f+1;
%f(f==257)=256;
% O1=[1 1];
% O2=[10 10];
% O3=[100 100];
O=[1 10 100];
for i=1:3
    [GLCM]=compute_GLCM(f,O(i));
    GLCM=GLCM/numel(f);
    figure;imshow(GLCM,[]);colormap jet;
    titlestr=sprintf('GLCM with offset Vector %d X %d',O(i),O(i));
    title(titlestr);
end

prefix = {'Bark', 'Bush', 'Fabric', 'Floor', 'Flower', 'Food', 'Gravel', 'Hair', 'Marble', 'Metal', 'Paint' };
entropy=zeros(size(prefix,2),9);
O=[20];
for r=1:size(prefix,2)
    for c=1:9
        fn = sprintf ( 'Texture/%s.%d.png', prefix{r}, c );
        f=imread(fn);
        f=f+1;
        GLCM=compute_GLCM(f,O);
         GLCM=GLCM/numel(f);
         entropy(r,c)=calEntropy(GLCM);
    end
end
entropyDiff=entropy;
for r=1:size(prefix,2)
    for c=1:9
       diff=abs(entropy - entropy(r,c));
       temp=sort(diff);
       temp=sort(temp,2);
       [R C]=find(diff==temp(1,2));
       entropyDiff(r,c)=R;
    end
end
count=0;
for r=1:11
    for c=1:9
        if entropyDiff(r,c)==r
            count=count+1;
        end
    end
end
    accuracy=(count/99)*100
