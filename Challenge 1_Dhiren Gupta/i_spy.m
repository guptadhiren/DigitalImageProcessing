function [r,c] = i_spy ( object_im, big_im, x )

% note that this implementation does not use variable "x"

Ro = size(object_im, 1); 
Co = size(object_im, 2); 

Rb = x.Rb; 
Cb = x.Cb; 
Rs=x.startRow;
Cs=x.StartCol;


o_im = int16(object_im);

t=cputime;
sizeImage=x.Rb;
if(sizeImage>481)
   b_im=int16(rgb2gray(big_im));;
   o_im=int16(rgb2gray(o_im));
   for r = Rs : Rb - (Ro-1)
      %  if(cputime-t>7.5)
       %             return;
        % end
        for c = Cs : Cb - (Co-1)
                diff_val = b_im(r:35:r+(Ro-1), c:35:c+(Co-1) ) - o_im(1:35:end,1:35:end);
                if ( sum ( abs ( diff_val(:)) ) == 0 )
                return;
                end

        end
   end
   
else
    b_im = int16(big_im);
    for r = Rs : Rb - (Ro-1)
        for c = Cs : Cb - (Co-1)     
            for z=1:3
                 diff_val = b_im(r:20:r+(Ro-1), c:20:c+(Co-1), z ) - o_im(1:20:end,1:20:end,z); 
                   if ( sum ( abs ( diff_val(:)) ) ~= 0 )
                     break;
                    elseif (z==3)
                        return;
                    end
            end
         end 
    end      
end

