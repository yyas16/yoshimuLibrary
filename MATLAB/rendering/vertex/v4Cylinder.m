
% ?// ñ ç¿ïWê∂ê¨ â~íå
function Point4Cylinder(length, split)
global m point
for k=1:3
    switch (k)
        case 1%: // â∫ñ 
            for i=1:split(1) + 1
                for j=1:split(2) + 1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    point{m,k}.coord(num,1) = length(1) / split(1) * (split(1) - i + 1) * cos((j-1) * 2.0 * pi / split(2));
                    point{m,k}.coord(num,2) = length(1) / split(1) * (split(1) - i + 1) * sin((j-1) * 2.0 * pi / split(2));
                    point{m,k}.coord(num,3)=  0;
                end
            end
            
            
        case 2%: // è„ñ 
            for i=1:split(1) + 1
                for j=1:split(2) + 1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    point{m,k}.coord(num,1) = length(2) / split(1) * (split(1) - i + 1) * cos((j-1)* 2.0 * pi / split(2));
                    point{m,k}.coord(num,2) = length(2) / split(1) * (split(1) - i + 1) * sin((j-1) * 2.0 * pi / split(2));
                    point{m,k}.coord(num,3)=  length(3);
                    
                end
            end
            
            
        case 3%: // ë§ñ 
            for i=1:split(3) + 1
                for j=1:split(2) + 1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    point{m,k}.coord(num,3)=  (i - 1) * length(3) / split(3);
                    if(length(1) == length(2))
                        temp = length(1);
                    else
                        temp = (point{m,k}.coord(num,3) + length(3) * length(1) / (length(2) - length(1))) * (length(2) - length(1)) / length(3);
                    end
                    point{m,k}.coord(num,1) = temp *  cos((j-1) * 2.0 * pi / split(2));
                    point{m,k}.coord(num,2) = temp *  sin((j-1) * 2.0 * pi / split(2));
                end
            end
    end
end

