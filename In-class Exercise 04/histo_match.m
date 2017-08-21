%part-1
f = imread('input.jpg');
r = imread('ref.jpg');
h = imhist(f);
figure; imshow(f);
title('Input Image');
hn = h / numel(f);
figure; plot(h);
title('Input Image Histogram');
c = cumsum(hn);
figure; plot(c);
title('Input Image CDF');

%Part-2
g = c(f+1);
figure; plot(g);
imshow(g);
title('Histogram Equalised Image ');
gh = imhist(g);
figure; plot(gh);
title('Equalised Image Histogram');
ghn = gh / numel(g);
ch = cumsum(ghn);
figure; plot(ch);
title('input Image cdf (red) vs  Histogram Equalised Image CDF(blue)')';
hold on;
plot (c, '-r');
cdfi = c;
h = imhist(r);
hn = h / numel(r);
cdfo = cumsum(hn);
figure; plot(cdfi, '-r');
hold on;
plot(cdfo, '-b');
title('CDF of Input(Red) vs CDF of Refrence(Blue)');
%Part3
for i=1:256
    for j=1:256
        if(cdfo(j)>=c(i))
            T(i)=j-1;
            break;
        else
            T(i)=255;
        end
    end
end
g_Equal=uint8(T(f+1));
hist_equal=imhist(g_Equal);
figure;imshow(g);
title('Histogram matched output image');
figure;imshow(r);
title('Refrence Image');
gh_equal = imhist(g_Equal);
ghn_equal = gh_equal / numel(g_Equal);
cdf_equal = cumsum(ghn_equal);
%figure; plot(ch_equal);
%title('Histogram matched output image CDF');

%part4
figure; plot(c,'-r');
hold on;
plot(cdfo,'-b');
hold on;
plot(cdf_equal,'-g');
title('CDF(input-Red) vs CDF(Ref-Blue) vs CDF(Hist Matched - Green)');


