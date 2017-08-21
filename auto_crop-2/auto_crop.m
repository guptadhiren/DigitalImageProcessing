function [x0, y0, x1, y1, x2, y2, x3, y3] = auto_crop ( f )

%%%IMPORTANT%%%
% x0,y0 are the x, y coordinates of the top left corner of image
% x1,y1 are the x, y coordinates of the top right corner of image
% x2,y2 are the x, y coordinates of the bottom right corner of image
% x3,y3 are the x, y coordinates of the bottom left corner of image

%getting size of the input image
 Ro = size(f,1);
 Co = size(f,2);
% 
% greenImage=f(:,:,2);
% greenImage=greenImage(20:end-20,20:end-20);
%         blueImage=f(:,:,3);
%         blueImage=blueImage(20:end-20,20:end-20);
%         
%         BW1 = im2bw(greenImage,graythresh(greenImage));
%         BW2 = im2bw(blueImage,graythresh(blueImage));
%         binaryImage=BW1&BW2;
%         
%         %binaryImage = imclearborder(binaryImage);
%         se=[1 0 1 0 1;0 1 1 1 0;1 1 1 1 1;0 1 1 1 0;1 0 1 0 1 ];
%         binaryImage=imopen(binaryImage,se);
%         binaryImage = bwareaopen(binaryImage, 7500);
% binaryImage = imfill(binaryImage, 'holes');
% 
%  L=bwlabel(binaryImage);
%         stats=regionprops(L,'Area');
%         x = [stats.Area];
%         L(L~=find(x==max(x)))=0;
%         L(L==find(x==max(x)))=1;
% % Display the image.
% %binaryImage=L(1:4:end,1:4:end);
% se=[0 1 0;1 1 1;0 1 1];
% %binaryImage=imdilate(binaryImage,se);
% edgeCanny=edge (binaryImage, 'canny' );
% %figure;imshow(edgeCanny);title('Canny Edge');
% %figure;imshow(binaryImage, []);
% 
% [R C]=size(edgeCanny);
% 
% [R C]=size(edgeCanny);
% 
% [H, T, R] = hough(edgeCanny);
%  P  = houghpeaks(H,4);
%  lines = houghlines(edgeCanny,T,R,P,'FillGap',120);
%  figure;imshow(edgeCanny);title('Canny Edge'),hold on;
%  
%  max_len = 0;
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
% end
% d=ceil(sqrt(R^2+C^2));
% a=zeros(2*d+1,180,'uint16');
% for r=1:R
%     for c=1:C
%         if(edgeCanny(r,c)==1)
%             for angle=1:180
%                 p=floor(c*cosd(angle-1)+r*sind(angle-1));
%                 p=p+d+1;
%                 a(p,angle)=a(p,angle)+1;
%             end
%         end
%     end
% end
% 
% [R C]=size(a);
% tempAcc=a;
% 
% for r = 6: R-5
%     for c =6:C-5
%        
%             maxValue=max(max(a(r-5:r+5,c-5:c+5)));
%             if(a(r,c)==maxValue)
%             a(r-5:r+5,c-5:c+5)=0;
%             a(r,c)=maxValue;
%             else
%             a(r,c) = 0;
%             end
%             
% 
%     end
% end
% 
% for(k=1:4)
%     [m,n] = find(a==max(max(a)));
%     M(k) = m;
%     N(k) = n;
%     b(m,n) = 0;
%  
% end;  
% 
% L = M;
% O = N;
% L = (L - d-1)
% O = (O - 1)
% figure;
% imshow(edgeCanny);
% hold on ;
% x = 1:500;
% for i=1:4
%      y = -cotd(O(i))*x + L(i)*cscd(O(i));
%         plot(x,y,'y');
% end 

% always pick middle half




    

% x0 = lines(2).point1(1)
% y0 =  lines(2).point1(2)
% 
% x1 = lines(3).point1(1)
% y1 = lines(3).point1(2)
% 
% x2 = lines(3).point2(1)
% y2 = lines(3).point2(2)
% 
% x3 = lines(4).point2(1)
% y3 = lines(4).point2(2)


%%Some random numbers come out of here
x0=0;y0=0;x1=0;y1=0;x2=0;y2=0;x3=0;y3=0;
% x0 = randi([1 Co],1,1);
% y0 = randi([1 Ro],1,1);
% x1 = randi([1 Co],1,1);
% y1 = randi([1 Ro],1,1);
% x2 = randi([1 Co],1,1);
% y2 = randi([1 Ro],1,1);
% x3 = randi([1 Co],1,1);
% y3 = randi([1 Ro],1,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

greenImage=f(:,:,2);
greenImage=greenImage(20:end-20,20:end-20);
        blueImage=f(:,:,3);
        blueImage=blueImage(20:end-20,20:end-20);
        
        BW1 = im2bw(greenImage,graythresh(greenImage));
        BW2 = im2bw(blueImage,graythresh(blueImage));
        binaryImage=BW1&BW2;
        
        %binaryImage = imclearborder(binaryImage);
       % se= [1 0 1 0 1;0 1 1 1 0;1 1 1 1 1;0 1 1 1 0;1 0 1 0 1 ];
       se=strel('diamond',4);
        binaryImage=imopen(binaryImage,se);
        %binaryImage=imerode(binaryImage,[0 1 0;1 1 1;0 1 0]);
        binaryImage = bwareaopen(binaryImage, 7500);
binaryImage = imfill(binaryImage, 'holes');

 L=bwlabel(binaryImage);
        stats=regionprops(L,'Area');
        x = [stats.Area];
        L(L~=find(x==max(x)))=0;
        L(L==find(x==max(x)))=1;
% Display the image.
%binaryImage=L(1:4:end,1:4:end);

edgeCanny=edge (L, 'canny' );
se=strel('diamond',6);
edgeCanny=imdilate(edgeCanny,se);
%figure;imshow(edgeCanny);title('Canny Edge');
%figure;imshow(binaryImage, []);

[R C]=size(edgeCanny);

[H, T, Rho] = hough(edgeCanny);
 P  = houghpeaks(H,4);
 lines = houghlines(edgeCanny,T,Rho,P,'FillGap',150);
 %figure;imshow(edgeCanny);title('Canny Edge'),hold on;
 
 max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   %plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   %plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   %plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

end
d=[];
xt=[];
yt=[];
rho=abs([lines.rho]);
i=find(rho==min(rho),1,'first');
j=find(rho==max(rho),1,'first');
x0=double(lines(i).point1(1))+20;
y0=double(lines(i).point1(2))+20;
x2=double(lines(j).point2(1))+20;
y2=double(lines(j).point2(2))+20;
%x1=double(Co*.75);
%y1=double(Ro*.25);

xt(i)=lines(i).point2(1);
yt(i)=lines(i).point2(2);

d(i)=sqrt((xt(i)).^2+(yt(i)-R).^2);
xt(j)=lines(j).point1(1);
yt(j)=lines(j).point1(2);
d(j)=sqrt((xt(j)).^2+(yt(j)-R).^2);
for num=1:length(lines)
    if(num == i|| num ==j )
       
    else
        
        xt(num)=lines(num).point1(1);
        yt(num)=lines(num).point1(2);
        d(num)=sqrt((xt(num)).^2+(yt(num)-R).^2);
    end
end
index=find(d==min(d));
x3=xt(index)+20;
y3=yt(index)+20;

d=[];

d(i)=sqrt((xt(i)-C).^2+(yt(i)).^2);
d(j)=sqrt((xt(j)-C).^2+(yt(j)).^2);

for num=1:length(lines)
    if(num == i|| num ==j )
    else  
        xt(num)=lines(num).point2(1);
        yt(num)=lines(num).point2(2);
        d(num)=sqrt((xt(num)-C).^2+(yt(num)).^2);
    end
end
 

index=find(d==min(d));
x1=xt(index)+20;
y1=yt(index)+20;
if(length(lines)<4)
    x1=double(Co*.75);
    y1=double(Ro*.25);
    x3=double(Co*.25);
    y3=double(Ro*.75);
 end
%x1=double(Co*.75);
%y1=double(Ro*.25);