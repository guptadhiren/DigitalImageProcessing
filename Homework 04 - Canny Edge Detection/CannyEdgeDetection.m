close all;
f=imread('valve.png');
figure;imshow(f);title('Input Image');
gray=rgb2gray(f);
grayd=double(gray);
kx=1.0/8.0*[1 0 -1; 2 0 -2; 1 0 -1];
ky=transpose(kx);

kx=imgaussfilt(kx,1);
ky=imgaussfilt(ky,1);
gx=imfilter(grayd,kx,'conv');
gy=imfilter(grayd,ky,'conv');
figure;imshow(gx,[]);
%colormap jet;
title('X gradient');
figure;imshow(gy,[]);
%colormap jet;
title('Y gradient');
gm=sqrt(gx.^2+gy.^2);
figure;imshow(gm,[]);
title('Output Image');
gd=atan2(gy,gx);
figure;imshow(gd,[]);
title('Direction');
colormap jet;

gmlocal=gm;

[R,C]=size(gm);
for r=2:(R-1);
    for c=2:(C-1)
        v=gm(r,c);
        newAngle=0;
        if((((-1/8*pi<=gd(r,c))&& (gd(r,c)<pi*1/8))||((-7/8*pi>gd(r,c))&& (gd(r,c)>=pi*7/8))) )
            newAngle=0;
        elseif((((pi*1/8<=gd(r,c))&& (gd(r,c)<pi*3/8))||((-5/8*pi>gd(r,c))&& (gd(r,c)>=-7/8*pi))) )
            newAngle=45;
        elseif((((pi*3/8<=gd(r,c))&& (gd(r,c)<pi*5/8))||((-3/8*pi>gd(r,c))&& (gd(r,c)>=-5/8*pi))) )
            newAngle=90;
        elseif((((pi*5/8<=gd(r,c))&& (gd(r,c)<pi*7/8))||((-1/8*pi>gd(r,c))&& (gd(r,c)>=-3/8*pi))) )
            newAngle=135;
        end
        
        if(newAngle == 0 &&  ( v < gm(r  , c - 1) || v  < gm(r , c + 1)))
               gmlocal(r ,  c) = 0;
           elseif(newAngle == 45 &&  ( v < gm(r - 1 , c - 1) || v  < gm(r + 1, c + 1)))
               gmlocal(r ,  c) = 0;  
          elseif(newAngle == 90 &&  ( v < gm(r - 1  , c ) || v  < gm(r + 1 , c )))
               gmlocal(r ,  c) = 0;
           elseif(newAngle == 135 &&  ( v < gm(r + 1 , c - 1) || v  < gm(r - 1 , c + 1)))
               gmlocal(r ,  c) = 0;
         end
    end
end

figure;imshow(gmlocal,[]);
title('non max suppression');
%colormap jet
% hm = imhist(gmlocal);
% [n , v] = max(hm);
% figure; plot(hm);title('Hisotgram');
alpha = 10;
beta = 0.2;
tHigh = 10; %alpha;
tLow = 2;% beta * tHigh;
bEdge =  edgeLinking(gmlocal , tLow ,tHigh);
figure ; imshow(bEdge); title('Canny Edge');