clear;
f=imread('input\input1.png');

bcv=findTotsu(f);
% for T=0:255
%     g=f>=T;
%     w2=sum(g(:));
%     w1=numel(f)-w2;
%     m2=mean(f(g));
%     m1=mean(f(~g));
%     bcv(T+1)=w1*w2*(m1-m2).^2;
% end

[mv,mindex]=max(bcv);
Totsu=mindex-1;
%Totsu=find(bcv==max(bcv)-1);
plot(bcv);
titlestr=sprintf('Totsu=%d\n',Totsu);
title(titlestr);
figure;imshow(f>=Totsu);

