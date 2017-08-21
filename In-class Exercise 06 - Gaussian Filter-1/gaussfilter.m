close all;
clc;
clear;
f = imread('Gaussian Filtering/input.png');
figure, imshow(f);
sigma = 10.0; 
step=3;

for sig=3:step:sigma% taking values 3,6,9
    Wh = floor(2.5* sig - 0.5);
    window = zeros(2*Wh+1,2*Wh+1);

    for r = -Wh:Wh
        for c = -Wh:Wh
            window(Wh+1+c,Wh+1+r) = exp(-1 * (c^2+r^2)/(2*sig^2));   
        end
    end

    w = window/sum(window(:));
    figure;
    imagesc(w); colormap jet;

    [R,C] = size(f);
    w = rot90(w,2);
    fd = double(f);
    [rw,cw] = size(w);
    g=zeros(R-rw+1,C -cw+1,'uint8');
    for r =1:R-rw+1
        for c =1:C -cw+1
            a = fd(r:r+rw-1,c:c+cw-1).*w;
            g(r,c) = sum(sum(a(:)));
        end
    end

    g= uint8(g);
    titlestr=sprintf('Sigma=%d\n',sig);
    title(titlestr);
    figure, imshow(g);
    
end


