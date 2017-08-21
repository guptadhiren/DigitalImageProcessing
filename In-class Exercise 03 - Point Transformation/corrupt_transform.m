og=imread('corrupt/cameraman.png');
crpt1=imread('corrupt/corrupt1.png');
crpt2=imread('corrupt/corrupt2.png');
crpt3=imread('corrupt/corrupt3.png');
crpt4=imread('corrupt/corrupt4.png');


%for Corrupt Image 1

first=og+crpt1;
if(min(min(first)==255 & max(max(first))==255))
'inverse Corrupt1'
firstSOSD=uint8(sum(sum((double(255-og)-double(crpt1)).^2)))
end


%for Corrupt Image 2

second=og+100;
if(min(min(double(crpt2)-double(second)))==0 & max(max(double(crpt2)-double(second)))==0)
    'add intensity'
    secondSOSD=uint8(sum(sum((double(second)-double(crpt2)).^2)))

end

%for Corrupt Image 3
'linear contrast stretch'
gmin = min(min(og));
gmax = max(max(og));
temp = (255/(gmax - gmin) * (og - gmin));
temp=temp-1;
thirdSOSD=uint8(sum(sum((temp-crpt3).^2)))

%for Corrupt Image 4
'Log'
c = log(256);
temp = uint8(255/c*log(double(og)+1));

fourthSOSD=sum(sum(double(temp)-double(crpt4)).^2)



