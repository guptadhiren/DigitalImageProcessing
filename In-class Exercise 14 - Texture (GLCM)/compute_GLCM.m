function [G]= compute_GLCM(f, O)
G=zeros(256,256);
[R C]=size(f);
for r=1:R-O(1)
    for  c=1:C-O(1)
        G(f(r,c),f(r+O(1),c+O(1)))=G(f(r,c),f(r+O(1),c+O(1)))+1;
    end
end


end