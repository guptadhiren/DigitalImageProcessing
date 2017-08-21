function entropy= calEntropy(GLCM)
    entropy=0;
    [R C]=size(GLCM);
    for r=1:R
        for c=1:C
            if(GLCM(r,c)==0)
                entropy=entropy;
            else
                entropy=entropy-(GLCM(r,c).*log2(GLCM(r,c)));
            end
        end
    end

    
end