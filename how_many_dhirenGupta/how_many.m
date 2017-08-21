function [ct] = how_many ( prefix, ct_f, num_f )
%prefix - name of video folder
%ct_f - vector of frames used for grading
%num_f - number of frames

%i is an array of integers from 1 to the number of frames
for i = 1:num_f;
    fn = sprintf ( '%sFRM_%05d.png%', prefix, i);
    f = imread ( fn );
    
    f = rgb2gray(f);
%     f=imresize(f,[1080 1920]);
    f=f(30:end-30,30:end-30);
    
    if i==1
        meanImg = zeros(size(f));
    end
    meanImg = meanImg + double(f);
end
ct = zeros(1,numel(ct_f));
bg = uint8(meanImg / (num_f));figure;imshow(bg);
bg=medfilt2(bg,[3,3]);
for j=1:numel(ct_f)
    fn = sprintf ( '%sFRM_%05d.png%', prefix, ct_f(j));
    f = imread ( fn );
    
    f = rgb2gray(f);
%     f=imresize(f,[1080 1920]);
    f=f(30:end-30,30:end-30);
    fg = imabsdiff(f,bg);
     fg=medfilt2(fg,[2,2]);
  % fg=~fg;
  fg=im2bw(fg,graythresh(fg));
   % fgImg=imgaussfilt(fg);
     imageMean=mean2(fg);
    % fg=imregionalmax(fg);
%        figure;imshow(fg);
    %fg = ~((imageMean-40)<fg & fg<(imageMean+40));
   
   % fg=imreconstruct(fg,fg);
%     fg = imopen(fg, strel('rectangle', [3,3]));
%         fg = imclose(fg, strel('rectangle', [9, 9]));
%         fg = imfill(fg, 'holes');
   fg = imdilate(fg, strel('square',3));
     fg = imerode(fg, strel('square',3));
     fg = imfill(fg,4,'holes');
     
   % figure;imshow(fg);
    [L num] = bwlabel(fg,4);
    L = uint16(L);
%     [R C]=find(L(1,1:end));
%     for c=1:size(C,2)
%         fgImg(L==L(1,C(c)))=0;
%     end
%   %  figure;imshow(fg);
%      L = bwlabel(fg);
%     L = uint16(L);
    stats = regionprops(L,'Area');
    x = [stats.Area];
    y = x;
   % median(x);
    for i=1:numel(x)
        if x(i) <=85 
            y(i) = 0;
            num=num-1;
        
%         elseif x(i) > 1200 
%             y(i) = 0;
%             num=num-1;
         end
    end
    ct(j) = num;
end
