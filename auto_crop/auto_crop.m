function [sx, sy, sWidth, sHeight] = auto_crop ( f )

%getting size of the input image
Ro = size(f,1);
Co = size(f,2);

%Some random numbers come out of here
% sx, sy are the row, column coordinates of the top left corner of image
% sWidth, sHeight are the the dimensions of the document
        greenImage=f(:,:,2);
        blueImage=f(:,:,3);
        
        BW1 = im2bw(greenImage,graythresh(greenImage));
        BW2 = im2bw(blueImage,graythresh(blueImage));
        binaryImage=BW1&BW2;
        
        %binaryImage = imclearborder(binaryImage);
binaryImage = imfill(binaryImage, 'holes');
binaryImage = bwareaopen(binaryImage, 5000);
% Display the image.

%figure;imshow(binaryImage, []);
binaryImage=binaryImage';
sumI=sum(binaryImage(1:Co/2,1:Ro/2));
diffnce=abs(sumI(1:end-1)-sumI(2:end));
%maxDiff=max(diff);
testr=find(diffnce>50,1,'first');
if(isempty(testr))
    sy=Ro/6;
else
    sy=testr;
end
bIt=binaryImage';
sumI=sum(bIt(testr:Ro/2,1:Co/2));
diff1=abs(sumI(1:end-1)-sumI(2:end));
%maxDiff=max(diff1);
testc=find(diff1>35,1,'first')+1;
if(isempty(testc))
    sx=uint16(Co/10);
else
    sx=testc;
end

%calculating width

sumI=sum(binaryImage(end:-1:Co/2,end:-1:Ro/2));
diffnce=abs(sumI(1:end-1)-sumI(2:end));
%maxDiff=max(diff);
testrh=find(diffnce>49,1,'first');
if(isempty(testrh))
    sHeight=Ro/2+Ro/8;
else
    sHeight=Ro-testrh-sy;
end
sumI=sum(bIt(Ro:-1:sHeight,end:-1:Co/2));
diff1=abs(sumI(1:end-1)-sumI(2:end));
%maxDiff=max(diff1);
testcw=find(diff1>=30,1,'first')+1;
if(isempty(testcw))
    sWidth=Co/2+Co/8;
else
    sWidth=Co-testcw-sx;
end



