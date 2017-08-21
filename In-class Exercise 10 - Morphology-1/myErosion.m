function g2 = myErosion(bw , s )
g2=false(size(bw));
[R,C]= size(bw);
[m,n]=size(s);
i=floor(m/2);
j=floor(n/2);
temp=padarray(bw,[i,j]);
for r= 1: (R)
    for c=1: (C)
        A=temp(r:r+2*i,c:c+2*j);
       
        if(all(all((A&s)==s))==true)
            g2(r,c)=true;
        else
            g2(r,c)=false;
        end
            
    end
end