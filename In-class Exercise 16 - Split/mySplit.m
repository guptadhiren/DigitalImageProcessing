clear;clc,close all
f= imread('split-data/input.png');
imshow(f);title('Input Image')
figure;
T = 20;
f_test = ones(size(f),'int16');
processList = 1;

while numel(processList) ~= 0
   temp = processList(1);
  [r c]  = find(f_test == temp);
   a1 = min(r);
    b1 = min(c);
    a2 = max(r);
    b2 = max(c);
    block = f(a1:a2,b1:b2);
     
  
  
    if std2(block)>T
      f_test(a1:floor((a1+a2)/2),b1:floor((b1+b2)/2)) = max(processList)+1;
        f_test(a1:floor((a1+a2)/2),floor((b1+b2)/2)+1:b2) = max(processList)+2;
        f_test(floor((a1+a2)/2)+1:a2,b1:floor((b1+b2)/2)) = max(processList)+3;
        f_test(floor((a1+a2)/2)+1:a2,floor((b1+b2)/2)+1:b2) = max(processList)+4;
    
     processList = [processList max(processList)+1:max(processList)+4];
    end
    processList = processList(2:end);  
        
    
end

visualize_sp(f,f_test);
figure; imshow(f_test,[]);title('Output Image')