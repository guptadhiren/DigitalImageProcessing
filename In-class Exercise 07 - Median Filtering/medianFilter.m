close all;
clc;clear;
I=imread('salt-pep.png');
rw=3;% change to 11,31
cw=3;% change to 11,31
W=zeros(rw,cw);
M=zeros(1,rw*cw);

[r,c]= size(I);
I1=padarray(I,[double(floor(rw/2)), double(floor(cw/2))]);
[rp,cp]= size(I1);
R=zeros(r,c);
for m=1:r
    for n=1:c
        for i=1:rw
            for j=1:cw
            %W(i,j)=  I1(m+i-1,n+j-1); 
             M((i-1)*rw+j)=I1(m+i-1,n+j-1);
            end
        end
        
        R(m,n)=findMedian(M);
    end
end
figure;imshow(I);
figure;imshow(uint8(R));

d=[];
w=[];
for W=3:21:101
    sum=0;M=zeros(1,W*W);
    I1=padarray(I,[double(floor(W/2)), double(floor(W/2))]);
    for m=1:r
        for n=1:c
            for i=1:W
                for j=1:W
                    %W(i,j)=  I1(m+i-1,n+j-1); 
                     M((i-1)*W+j)=I1(m+i-1,n+j-1);
                end
            end
            [med,duration]=findMedianDuration(M);
            R(m,n)=med;
            sum= sum+ duration;
        end
    end
    d=[d sum];
    w=[w W];
end
figure;plot( w, d, '-ro' );