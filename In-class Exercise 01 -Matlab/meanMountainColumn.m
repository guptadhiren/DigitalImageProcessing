% item 1

f=imread('mountain.png');
meanMountainColumn=mean(f);
plot(f);
plot(meanMountainColumn);


% item 2

darkestCol=find(meanMountainColumn==min(meanMountainColumn));
darkestCol=int16(darkestCol);


% item 3
flipImage=f(end:-1:1,1:end);
imshow(flipImage);
whos



% item 5
halfImage=f(1:2:end,1:2:end);
imshow(halfImage);
whos


% item 4 Histogram
[r,c]=size(f);
count=0;
count=int16(count);
for z=1:256
    for row=1:r
        for column = 1:c
            if f(row,column)==z-1
                count=count+1;
            end
        end
    end
    myHist(z)=count;
    count=0;
end
myHist=int16(myHist');
plot(myHist);
whos myHist;


