f = imread('circle.png');
title('Input Image');

f = imfilter(f,ones(13,13)/13^2);
rand5 = [1:1:5];
[R C] = size(f);
stepSize=5;

pts = zeros(40,2);
pts(1:10,1) = 1;
pts(1:10,2) = floor(1:C/10:C);

pts(11:20,1) = floor(1:R/10:R);
pts(11:20,2) = C;

pts(21:30,1) = R;
pts(21:30,2) = floor(C:-C/10:1);

pts(31:40,1) = floor(R:-R/10:1);
pts(31:40,2) = 1;

Npts = size(pts,1);


x = vis_acm(f,pts);
imshow(x);

gx = imfilter(single(f),[-1 1]);
gy = imfilter(single(f),[-1 1]');


pts_old = pts;
Etotal_old = inf;

for i=1:100000
    

   % computation of external energy
    for j=1:40
     Eex(j) = gx(pts(j,1))^2 + gy(pts(j,2))^2;
    end;
    
   
    % computation of internal energy
    
    for k = 1:40
          % elasticity
        %pts_old
         if k<40 
          x1= sqrt((pts(k,1)-pts(k+1,1))^2  + (pts(k,2) - pts(k+1,2))^2);
         % x2 = sqrt((pts(k+1,1)-pts(k+1,1))^2  + (pts(k+2,2) - pts(k+2,2))^2);
         Ein1(k) = x1;
         %+x2;
         end
         if k == 40
            Ein1(k) =sqrt((pts(40,1)-pts(1,1))^2  + (pts(40,2) - pts(1,2))^2);
         end 
        
    end;
        
        % Ein2 stiffness   
   
    for l = 1:40
          if  l >0 && l<39
           Ein2(l) = sqrt((pts(l,1)+pts(l+2,1)-2*pts(l+1,1))^2 + (pts(l,2)+pts(l+2,2)-2*pts(l+1,2))^2);
           end
          if l == 40
           Ein2(l) = sqrt((pts(l,1)+pts(2,1)-2*pts(1,1))^2 + (pts(l,2)+pts(2,2)-2*pts(1,2))^2);
          end 
         
         if l ==39
           Ein2(l) = sqrt((pts(l,1)+pts(1,1)-2*pts(l+1,1))^2 + (pts(l,2)+pts(1,2)-2*pts(l+1,2))^2);
         end    
       
    end; 
     
   Etotal =   sum(Ein1)+sum(Ein2)-sum(Eex);
 
   Etotal_old = Etotal;
   pts_temp = pts;
   
   % ------change of points
    k = randi(Npts);
    s1 = randi([-stepSize stepSize]);
    s2 = randi([-stepSize stepSize]);
    if s1<0
        pts_temp(k,1) = max(pts_temp(k,1)+s1,1);
    else
        pts_temp(k,1) = min(pts_temp(k,1)+s1,R);
    end
    if s2<0
        pts_temp(k,2) = max(pts_temp(k,2)+s2,1);
    else
        pts_temp(k,2) = min(pts_temp(k,2)+s2,C);
    end
   
   %----recalculate energy
   
     for j=1:40
     Eex2(j) = gx(pts_temp(j,1))^2 + gy(pts_temp(j,2))^2;
    end;
    
    % computation of internal energy
    
    for k = 1:40
          % elasticity
        
         if k<40 
          x1= sqrt((pts_temp(k,1)-pts_temp(k+1,1))^2  + (pts_temp(k,2) - pts_temp(k+1,2))^2);
         
         Ein11(k) = x1;
         
         end
         if k == 40
            Ein11(k) =sqrt((pts_temp(40,1)-pts_temp(1,1))^2  + (pts_temp(40,2) - pts_temp(1,2))^2);
         end 
        
    end;
        
        % Ein2 stiffness   
   
    for l = 1:40
          if  l >0 && l<39
           Ein22(l) = sqrt((pts_temp(l,1)+pts_temp(l+2,1)-2*pts_temp(l+1,1))^2 + (pts_temp(l,2)+pts_temp(l+2,2)-2*pts_temp(l+1,2))^2);
           end
          if l == 40
           Ein22(l) = sqrt((pts_temp(l,1)+pts_temp(2,1)-2*pts_temp(1,1))^2 + (pts_temp(l,2)+pts_temp(2,2)-2*pts_temp(1,2))^2);
          end 
         
         if l ==39
           Ein22(l) = sqrt((pts_temp(l,1)+pts_temp(1,1)-2*pts_temp(l+1,1))^2 + (pts_temp(l,2)+pts_temp(1,2)-2*pts_temp(l+1,2))^2);
         end    
       
    end; 
   
      Etotal =   sum(Ein11)+sum(Ein22)-sum(Eex2);
      
       if Etotal<Etotal_old
        pts = pts_temp;
    end
    
   
  

end;
figure;
z = vis_acm(f,pts);
imshow(z);

