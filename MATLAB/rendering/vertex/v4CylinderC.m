
%// 面座標生成 円筒
function Point4CylinderC(length,split)
global m point

for k=1:4
    switch (k)
        case 1% // 下面
            for i=1:split(1)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    radi = length(1) - (length(1) - length(2)) / split(1) * (i - 1);
                    point{m,k}.coord(num,:) = [radi * cos( (j -1) * 2.0 * pi / split(2)), radi * sin( (j -1) * 2.0 * pi /split(2)), 0];
                end
            end
        case 2% // 上面
            for i=1:split(1)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    radi = length(3) - (length(3) - length(4)) / split(1) * (i - 1);
                    point{m,k}.coord(num,:) = [radi * cos((j-1) * 2.0 * pi / split(2)), radi * sin((j-1) * 2.0 * pi / split(2)), length(5)];
                end
            end
        case 3% // 側面（外）
            for i=1:split(3)+1
                for j=1:split(2)+1
                    num = j + (i - 1) * (split(2) + 1);
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(3);
                    if(length(1) == length(3))
                        temp = length(1);
                    else
                        temp = (point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / length(5);
                    end
                    
                    
                    point{m,k}.coord(num,1:2) = [temp *  cos((j-1) * 2.0 * pi / split(2)), temp *  sin((j-1) * 2.0 * pi / split(2))];
                end
            end
            
        case 4% // 側面（内）
            for i=1:split(3)+1
                for j=1:split(2)+1
                    
                    num = j + (i - 1) * (split(2) + 1);
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(3);
                    if(length(2) == length(4))
                        temp = length(2);
                    else
                        temp = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / length(5);
                    end
                    
                    point{m,k}.coord(num,1:2) = [temp *  cos((j-1) * 2.0 * pi / split(2)), temp *  sin((j-1) * 2.0 * pi / split(2))];
                end
            end
    end
end
