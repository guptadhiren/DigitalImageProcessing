clc,clear;close all;
f= ones(8,8)*100;
U=dctmtx(8);
figure;plot(U(2,:));
result=U*f*U';
figure;imagesc(result);
f1=rand(8,8)*255;

result=U*f1*U';
figure;imagesc(result);


f=imread('Compression/input.png');
final=zeros(size(f,1),size(f,2));
for r=1:8:size(f,1)
    for c=1:8:size(f,2)
        if((r+7)<=size(f,1)&& (c+7)<=size(f,2))
            temp=double(f(r:r+7,c:c+7));
            result=U*temp*U';
            final(r:r+7,c:c+7)=result;
        end
    end
end
figure;imagesc(final);


