function vert = v4cube(length, split)
% ----------------------------------------------------------------------
%   generate vertices of cube
%    20180809  y.yoshimura
%    Inputs: length[3] = [x, y, z]
%            split[3] = [the number of partitions along x-axis, y, z]
%   Outputs: vertex coordinates
%   related function files:
%   note:
%   cf:
%   revisions;
%   vert = v4cube(length, split)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
%// ñ ç¿ïWê∂ê¨ íºï˚ëÃ

for k=1:6
    switch (k)
        case 1%: // X+ñ 
            for i=1:split(3)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                   
                    vert(k).coord(num,1) = length(1) / 2.0;
                    vert(k).coord(num,2) = length(2) / 2.0 - (j - 1) * length(2) / split(2);
                    vert(k).coord(num,3) = length(3) / 2.0 - (i - 1) * length(3) / split(3);
                end
            end
            
        case 2%: // X-ñ 
            for i=1:split(3)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    
                    vert(k).coord(num,1) = -1.0 * length(1) / 2.0;
                    vert(k).coord(num,2) = length(2) / 2.0 - (j - 1) * length(2) / split(2);
                    vert(k).coord(num,3) = length(3) / 2.0 - (i - 1) * length(3) / split(3);
                    
                end
            end
            
        case 3%: // Y+ñ 
            for i=1:split(1)+1
                for j=1:split(3)+1
                    
                    num = j + (i - 1) * (split(3) + 1);
                    vert(k).coord(num,1) = length(1) / 2.0 - (i - 1) * length(1) / split(1);
                    vert(k).coord(num,2) = length(2) / 2.0;
                    vert(k).coord(num,3)=  length(3) / 2.0 - (j - 1) * length(3) / split(3);
                    
                end
            end
        case 4%: // Y-ñ 
            for i=1:split(1)+1
                for j=1:split(3)+1
                    
                    num = j + (i - 1) * (split(3) + 1);
                    vert(k).coord(num,1) = length(1) / 2.0 - (i - 1) * length(1) / split(1);
                    vert(k).coord(num,2) = -1.0 * length(2) / 2.0;
                    vert(k).coord(num,3)=  length(3) / 2.0 - (j - 1) * length(3) / split(3);
                end
            end
            
            
        case 5%: // Z+ñ 
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    vert(k).coord(num,1) = length(1) / 2.0 - (j - 1) * length(1) / split(1);
                    vert(k).coord(num,2) = length(2) / 2.0 - (i - 1) * length(2) / split(2);
                    vert(k).coord(num,3)=  length(3) / 2.0;
                end
            end
            
        case 6%: // Z-ñ 
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    vert(k).coord(num,1) = length(1) / 2.0 - (j - 1) * length(1) / split(1);
                    vert(k).coord(num,2) = length(2) / 2.0 - (i - 1) * length(2) / split(2);
                    vert(k).coord(num,3)=  -1.0 * length(3) / 2.0;
                end
            end
    end
end

end
