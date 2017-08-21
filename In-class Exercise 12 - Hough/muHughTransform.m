f=false(100,100);
f(25,25:75)=1;
f(75,25:75)=1;
f(25:75,25)=1;
f(25:75,75)=1;

d=ceil(sqrt(100^2+100^2));
a=zeros(2*d+1,180,'uint16');
for r=1:100
    for c=1:100
        if(f(r,c)==1)
            for angle=1:180
                p=floor(r*cosd(angle-1)+c*sind(angle-1));
                p=p+d+1;
                a(p,angle)=a(p,angle)+1;
            end
        end
        if r==25 && c==25
        figure;imshow(a,[]);
        end 
    end
end
figure;imshow(a,[])
[rho,th]= find(a==max(max(a)));
Ans = [rho,th];
Ans(:,2) = Ans(:,2)-1;
Ans
Ans(:,1) = Ans(:,1)-d-1;

Ans
