f= imread('peppers.jpg');
%convert rgb to hsv
hsv=rgb2hsv(f);

%no of user inputs
n=1;

imshow(f);
% user inputs for all the colors
red=ginput(n);
green=ginput(n);
yellow=ginput(n);
orange=ginput(n);

% taking hue from hsv
hue=hsv(:,:,1);


green=uint8(green);
red=uint8(red);
yellow=uint8(yellow);
orange=uint8(orange);

tempHue=[];
% assigning hue for every color in temporary varibale & calculating mean
for ind=1:n
    tempHue(ind)=hue(red(ind,2),red(ind,1));
end
redMean=mean(tempHue);
for ind=1:n
    tempHue(ind)=hue(green(ind,2),green(ind,1));
end
greenMean=mean(tempHue);
for ind=1:n
    tempHue(ind)=hue(yellow(ind,2),yellow(ind,1));
end
yellowMean=mean(tempHue);
for ind=1:n
    tempHue(ind)=hue(orange(ind,2),orange(ind,1));
end
orangeMean=mean(tempHue);  

% storing mean in array to sort them to find the range
meanhue=[redMean,yellowMean,greenMean,orangeMean];
meanhue=meanhue';

meanhue=sortrows(meanhue);
hueRange=[0,(meanhue(1)+meanhue(2))/2,(meanhue(2)+meanhue(3))/2,(meanhue(3)+meanhue(4))/2,1];

%find the location of each pixles depending on range
[row, col]= find(hue>=hueRange(1)&hue<=hueRange(2));
[row1, col1]= find(hue>hueRange(2)&hue<=hueRange(3));
[row2, col2]= find(hue>hueRange(3)&hue<=hueRange(4));
[row3, col3]= find(hue>hueRange(4)&hue<=hueRange(5));
pepperClassification=hsv(:,:,1);
colorMatrix=double(f);

% classifying the pixles location in matrix & assigning mean RGB to those
% pixle location
meanR=0;
meanG=0;
meanB=0;
for index=1:size(row)
    pepperClassification(row(index),col(index))=0;
   meanR=meanR+ colorMatrix(row(index),col(index),1);
    meanG=meanG+ colorMatrix(row(index),col(index),2);
    meanB=meanB+ colorMatrix(row(index),col(index),3);
end
meanR=meanR/index;
meanG=meanG/index;
meanB=meanB/index;

for index=1:size(row)
    colorMatrix(row(index),col(index),1)=meanR;
     colorMatrix(row(index),col(index),2)=meanG;
      colorMatrix(row(index),col(index),3)=meanB;
   
end
meanR=0;
meanG=0;
meanB=0;
for index=1:size(row1)
    pepperClassification(row1(index),col1(index))=1;
    meanR=meanR+ colorMatrix(row1(index),col1(index),1);
    meanG=meanG+ colorMatrix(row1(index),col1(index),2);
    meanB=meanB+ colorMatrix(row1(index),col1(index),3);
end
meanR=meanR/index;
meanG=meanG/index;
meanB=meanB/index;

for index=1:size(row1)
    colorMatrix(row1(index),col1(index),1)=meanR;
     colorMatrix(row1(index),col1(index),2)=meanG;
      colorMatrix(row1(index),col1(index),3)=meanB;
   
end

meanR=0;
meanG=0;
meanB=0;
for index=1:size(row2)
    pepperClassification(row2(index),col2(index))=2;
    meanR=meanR+ colorMatrix(row2(index),col2(index),1);
    meanG=meanG+ colorMatrix(row2(index),col2(index),2);
    meanB=meanB+ colorMatrix(row2(index),col2(index),3);
end
meanR=meanR/index;
meanG=meanG/index;
meanB=meanB/index;


for index=1:size(row2)
    colorMatrix(row2(index),col2(index),1)=meanR;
     colorMatrix(row2(index),col2(index),2)=meanG;
      colorMatrix(row2(index),col2(index),3)=meanB;
   
end
meanR=0;
meanG=0;
meanB=0;
for index=1:size(row3)
    pepperClassification(row3(index),col3(index))=3;
    meanR=meanR+ colorMatrix(row3(index),col3(index),1);
    meanG=meanG+ colorMatrix(row3(index),col3(index),2);
    meanB=meanB+ colorMatrix(row3(index),col3(index),3);
end
meanR=meanR/index;
meanG=meanG/index;
meanB=meanB/index;

for index=1:size(row3)
    colorMatrix(row3(index),col3(index),1)=meanR;
     colorMatrix(row3(index),col3(index),2)=meanG;
      colorMatrix(row3(index),col3(index),3)=meanB;
   
end
colorMatrix=uint8(colorMatrix);
imshow(colorMatrix);


 
    





