function bcv=findTotsu(f)
   %bcv=zeros(1,256,'uint8'); 
   
    for T=0:255
        g=f>=T;
        w2=sum(g(:));
        w1=numel(f)-w2;
        m2=mean(f(g));
        m1=mean(f(~g));
        bcv(T+1)=w1*w2*(m1-m2).^2;
    end
end