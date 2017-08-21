function [m, duration]=findMedianDuration(f)
tic
f=sort(f,2);
[r,c]=size(f);

if(mod(c,2)==0)
   m= (f(1,c/2)+f(1,c/2+1))/2;
else 
    m=f(1,(c+1)/2);
end
duration=toc;