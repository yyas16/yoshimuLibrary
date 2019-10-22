function vert = v4cube(vert, pNum,length, split)
% ----------------------------------------------------------------------
%    ñ ç¿ïWê∂ê¨ íºï˚ëÃ
%    20190620  y.yoshimura
%    Inputs: pNum: part number, scalar
%             length =
%             split =
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   function vert = v4cube(vert, pNum,length, split)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

for k=1:6
    switch (k)
        case 1%: // X+ñ 
            for i=1:split(3)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    
                    vert(pNum,k).coord(num,1) = length(1) / 2.0;
                    vert(pNum,k).coord(num,2) = length(2) / 2.0 - (j - 1) * length(2) / split(2);
                    vert(pNum,k).coord(num,3) = length(3) / 2.0 - (i - 1) * length(3) / split(3);
                end
            end
            
        case 2%: // X-ñ 
            for i=1:split(3)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    
                    vert(pNum,k).coord(num,1) = -1.0 * length(1) / 2.0;
                    vert(pNum,k).coord(num,2) = length(2) / 2.0 - (j - 1) * length(2) / split(2);
                    vert(pNum,k).coord(num,3) = length(3) / 2.0 - (i - 1) * length(3) / split(3);
                    
                end
            end
            
        case 3%: // Y+ñ 
            for i=1:split(1)+1
                for j=1:split(3)+1
                    
                    num = j + (i - 1) * (split(3) + 1);
                    vert(pNum,k).coord(num,1) = length(1) / 2.0 - (i - 1) * length(1) / split(1);
                    vert(pNum,k).coord(num,2) = length(2) / 2.0;
                    vert(pNum,k).coord(num,3)=  length(3) / 2.0 - (j - 1) * length(3) / split(3);
                    
                end
            end
        case 4%: // Y-ñ 
            for i=1:split(1)+1
                for j=1:split(3)+1
                    
                    num = j + (i - 1) * (split(3) + 1);
                    vert(pNum,k).coord(num,1) = length(1) / 2.0 - (i - 1) * length(1) / split(1);
                    vert(pNum,k).coord(num,2) = -1.0 * length(2) / 2.0;
                    vert(pNum,k).coord(num,3)=  length(3) / 2.0 - (j - 1) * length(3) / split(3);
                end
            end
            
            
        case 5%: // Z+ñ 
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    vert(pNum,k).coord(num,1) = length(1) / 2.0 - (j - 1) * length(1) / split(1);
                    vert(pNum,k).coord(num,2) = length(2) / 2.0 - (i - 1) * length(2) / split(2);
                    vert(pNum,k).coord(num,3)=  length(3) / 2.0;
                end
            end
            
        case 6%: // Z-ñ 
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    vert(pNum,k).coord(num,1) = length(1) / 2.0 - (j - 1) * length(1) / split(1);
                    vert(pNum,k).coord(num,2) = length(2) / 2.0 - (i - 1) * length(2) / split(2);
                    vert(pNum,k).coord(num,3)=  -1.0 * length(3) / 2.0;
                end
            end
    end
end

end
