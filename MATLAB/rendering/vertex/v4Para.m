
%// –ÊÀ•W¶¬ •ú•¨–Ê
function Point4Para(length, split) %length[2], split[3]
global point
global m

offset =0.0005;

for k=1:2
    switch (k)
        case 1
            for i = 1:(split(2)+1) %‚‚³•ªŠ„
                for j = 1:(split(1)+1) %‰~ü•ªŠ„
                    
                    num = j + (i-1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(2) / split(2);
                    if (i == (split(2)+1))%//“ÁˆÙ“_ˆ—
                        temp = 0.0001;
                    else
                        temp = sqrt((length(2) - point{m,k}.coord(num,3)) / length(2) * length(1) * length(1));
                        
                        point{m,k}.coord(num,1) = temp * cos((j - 1) * 2.0 * pi / split(1));
                        point{m,k}.coord(num,2) = temp * sin((j - 1) * 2.0 * pi / split(1));
                        
                    end
                end
            end
        case 2
            for i = 1:(split(2)+1) %‚‚³•ªŠ„
                for j = 1:(split(1)+1) %‰~ü•ªŠ„
                    
                    num = j + (i-1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(2) / split(2);
                    if (i == (split(2)+1) )%//“ÁˆÙ“_ˆ—
                        temp = 0.0001;
                    else
                        temp = sqrt((length(2) - point{m,k}.coord(num,3)) / length(2) * length(1) * length(1));
                        
                        point{m,k}.coord(num,1) = (temp - offset)* cos((j-1) * 2.0 * pi / split(1));
                        point{m,k}.coord(num,2) = (temp - offset)* sin((j-1) * 2.0 * pi / split(1));
                        
                    end
                end
            end
            
    end
end
end