clear;
close all;
f=double(imread('model-t.png'));

figure;imshow(imread('model-t.png'));
title('Input Image');
kx=1/8*[1 0 -1; 2 0 -2; 1 0 -1];
ky=transpose(kx);
sum(kx(:));

fx=imfilter(f,kx);
fy=imfilter(f,ky);
ky=transpose(kx);

figure;imshow(fx,[]);
%colormap jet;
title('X gradient');
figure;imshow(fy,[]);
%colormap jet;
title('Y gradient');

fr= (fx.^2+fy.^2).^0.5;
figure;imshow(fr,[]);
title('Output Image');
fabs= abs(fx)+abs(fy);
gd=atan2(fy,fx);
figure;imshow(gd,[]);
title('Direction');
colormap jet;
f5=fr>=1;
figure;imshow(f5,[]);
title('Edge Detection for threshold 1');
f10=fr>=10;
figure;imshow(f10,[]);
title('Edge Detection for threshold 10');
f25=fr>=25;
figure;imshow(f25,[]);
title('Edge Detection for threshold 25');
