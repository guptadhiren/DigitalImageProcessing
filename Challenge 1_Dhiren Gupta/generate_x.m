function [x] = generate_x ( b_im )

% nothing useful for now
if(size(b_im, 1)==1600)
    x.Rb=1525;
    x.startRow=100;
   minInten= min(min(b_im(1:400,1:100)));
   maxInten=max(max(b_im(1:400,1:100)));
else
x.Rb = size(b_im, 1); 
x.startRow=1;
end
if(size(b_im, 2)==2400)
    x.Cb=2325;
    x.StartCol=75;
    
else
x.Cb = size(b_im, 2);
x.StartCol=1;
end

%x.image=int16(b_im);
%x.gray=int16(rgb2gray(b_im));
