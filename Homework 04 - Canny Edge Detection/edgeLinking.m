function bEdge = edgeLinking(gLoc , tLow , tHigh)

    sz = size(gLoc);
    bEdge = zeros(sz(1) , sz(2));
     sMap = zeros(sz(1) , sz(2));
      wMap = zeros(sz(1) , sz(2));
    frontier = [];
    for r = 1 : sz(1) 
        for c  = 1 : sz(2) 
            if gLoc(r , c) >= tHigh
                frontier = [ frontier , r , c];
                bEdge(r , c) = 1;
                sMap(r , c) = 1;
            end;
            fsz = size(frontier);
            while(fsz(2) >= 2)     
                x = frontier(fsz(2) - 1);%row
                y = frontier(fsz(2) );%colo
                
                %disp(x);
                %disp(y);
                frontier = frontier( 1 : fsz(2) - 2);
                if( x > 1 && gLoc(x - 1 , y) >= tLow)  %left
                    bEdge(x - 1 , y) = 1;
                    if(wMap(x - 1 , y) ~= 1 && sMap(x - 1 , y) ~= 1)
                     wMap(x - 1 , y) = 1;
                     frontier = [ frontier : x - 1 , y];
                    end;
                end;
                if(x < sz(1) &&  gLoc(x + 1 , y) >= tLow)  % r
                    bEdge(x + 1 , y) = 1;
                    if(wMap(x + 1 , y) ~= 1 && sMap(x + 1 , y) ~= 1)
                    wMap(x + 1 , y) = 1;
                    frontier = [ frontier : x + 1 , y];
                     end;
                end;
                
                if(y > 1 && gLoc(x  , y - 1) >= tLow)  % r
                    bEdge(x  , y - 1) = 1;
                    if(wMap(x , y - 1) ~= 1 && sMap(x , y - 1) ~= 1 )
                    wMap(x  , y - 1) = 1;
                     frontier = [ frontier : x  , y - 1];
                    end;
                end;
                
                if(y < sz(2) && gLoc(x  , y + 1) >= tLow)  % r
                    bEdge(x , y + 1) = 1;
                    if(wMap(x  , y + 1) ~= 1 && sMap(x  , y + 1) ~= 1)
                    wMap(x , y + 1) = 1;
                     frontier = [ frontier : x  , y + 1];
                    end;
                end;
                
                
                 if(x > 1 && y > 1 && gLoc(x - 1  , y - 1) >= tLow)  % r
                    bEdge(x - 1 , y - 1) = 1;
                    if(wMap(x - 1 , y - 1) ~= 1 && sMap(x - 1 , y - 1) ~= 1)
                    wMap(x - 1 , y - 1) = 1;
                     frontier = [ frontier : x  - 1, y - 1];
                    end;
                end;
                
                 if( y < sz(2) && x > 1 && gLoc(x - 1  , y + 1) >= tLow)  % r
                    bEdge(x - 1 , y + 1) = 1;
                    if(wMap(x - 1 , y + 1) ~= 1 && sMap(x - 1 , y + 1) ~= 1)
                    wMap(x - 1 , y + 1) = 1;
                     frontier = [ frontier : x  - 1, y + 1];
                    end;
                 end
                
                if(x < sz(1) &&  y < sz(2) &&  gLoc(x + 1  , y + 1) >= tLow)  % r
                    bEdge(x + 1 , y + 1) = 1;
                    if(wMap(x + 1 , y + 1) ~= 1 && sMap(x + 1 , y + 1) ~= 1)
                    wMap(x + 1 , y + 1) = 1;
                     frontier = [ frontier : x  + 1, y + 1];
                    end;
                end;
                
                if(x < sz(1) &&  y > 1 && gLoc(x + 1  , y - 1) >= tLow)  % r
                    bEdge(x + 1 , y - 1) = 1;
                    if(wMap(x + 1 , y - 1) ~= 1 && sMap(x + 1 , y - 1) ~= 1)
                    wMap(x + 1 , y - 1) = 1;
                     frontier = [ frontier : x  + 1, y - 1];
                    end;
                end;
                
                 fsz = size(frontier);
            end;
        end;
    end;

figure; imshow(sMap ,[]); 
titlestr=sprintf('Strong Edge :\t Alpha=10,  Tmax=%d',tHigh);
title(titlestr);
figure; imshow(wMap ,[]); 
titlestr=sprintf('Weak Edge :\t alpha=10, beta=0.2, Tmax=%d and Tmin=%d',tHigh,tLow);
title(titlestr);

end