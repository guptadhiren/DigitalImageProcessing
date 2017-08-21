clear;clc;close all;
f= imread('rice.png');
figure;imshow(f);title('Input Image');
bw=im2bw(f);

[R,C]= size(bw);
h= zeros(R,C,'uint16');
L=1;
equiTable=[];
tempTable=[];
i=1;
for r=1:R
    for c=1:C
        if(bw(r,c)==true)
          
            if(r-1==0)
                topLabel=0;
            else
                topLabel=h(r-1,c);
            end
            if(c-1==0)
                leftLabel=0;
            else
                leftLabel=h(r,c-1);
            end
            
            
           if((topLabel==0)&& (leftLabel==0))
               h(r,c)=L;
               L=L+1;
           elseif((topLabel==0)&& (leftLabel~=0))
                h(r,c)=leftLabel;
           elseif((topLabel~=0)&& (leftLabel==0))
               h(r,c)=topLabel;
           elseif((topLabel~=0)&& (leftLabel~=0))
               h(r,c)=min(topLabel,leftLabel);
               if(topLabel~=leftLabel)
               tempTable(i,1)=min(topLabel,leftLabel);
               tempTable(i,2)=max(topLabel,leftLabel);
               i=i+1; 
               end
           
           end
        end
    end
end
figure;imshow(h,[]);title('Labeled Image');
uniq = unique(tempTable,'rows');
labelCount=max(max(h));
equiTable(1:labelCount)=1:labelCount;

for i=1:size(uniq,1)
    equiTable(uniq(i,2))= equiTable(uniq(i,1));
end
g=h;
for r=1:R
    for c=1:C
        if(h(r,c)~=0)
        g(r,c)=equiTable(h(r,c));
        end
    end
end
count=0;
cmap = rand(unique(labelCount),3); % N = # of unique labels including background
for z=1:labelCount
    for row=1:R
        for column = 1:C
            if g(row,column)==z
                count=count+1;
            end
        end
    end
    myHist(z)=count;
    count=0;
end
figure;imshow ( g,[] );title('CCL output');  % g = matrix with labels
colormap (cmap);
noise=myHist<mean(myHist);
Threshold=mean(myHist)
for i=1:size(noise,2)
    if(noise(i)~=0)
        g(g==i)=0;
    else
        count=count+1;
    end
end

objectCount=count



figure;imshow ( g,[] ); title('CCL output with Threshold'); % g = matrix with labels
colormap (cmap);