
% // 面座標生成 スラスタカバー
function Point4Cover(length,split)% //length[5]=下面x,下面y,上面x,上面y，高さ
global point m

offset = 0.00001;

for k=1:6
    switch k
        case 1% // X+面
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) = (i - 1) * length(5) / split(2);
                    point{m,k}.coord(num,1) = (point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / 2.0 / length(5);
                    
                    tempY = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / 2.0 / length(5);
                    point{m,k}.coord(num,2) = tempY - (j - 1) * tempY * 2.0 / split(1);
                
                end
            end
            
        case 2%// X-面
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(2);
                    point{m,k}.coord(num,1) = -(point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / 2.0 / length(5);
                    
                    tempY = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / 2.0 / length(5);
                    point{m,k}.coord(num,2) = tempY - (j - 1)* tempY * 2.0 / split(1);
                
                end
            end
            
        case 3 % // Y+面
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(2);
                    point{m,k}.coord(num,2) = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / 2.0 / length(5);
                    tempX = (point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / 2.0 / length(5);
                    point{m,k}.coord(num,1) = tempX - (j - 1) * tempX * 2.0 / split(1);
                end
            end
            
        case 4   % // X+面裏面
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(2);
                    point{m,k}.coord(num,1) = (point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / 2.0 / length(5) - offset;
                    tempY = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / 2.0 / length(5);
                    point{m,k}.coord(num,2) = tempY - (j - 1) * tempY * 2.0 / split(1);
                end
            end
            
        case 5%// X-面裏面
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(2);
                    point{m,k}.coord(num,1) = -(point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / 2.0 / length(5) + offset;
                    tempY = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / 2.0 / length(5);
                    point{m,k}.coord(num,2) = tempY - (j - 1) * tempY * 2.0 / split(1);
                end
            end
            
        case 6 % // Y+面裏面
            for i=1:split(2)+1
                for j=1:split(1)+1
                    
                    num = j + (i - 1) * (split(1) + 1);
                    
                    point{m,k}.coord(num,3) =  (i - 1) * length(5) / split(2);
                    point{m,k}.coord(num,2) = (point{m,k}.coord(num,3) + length(5) * length(2) / (length(4) - length(2))) * (length(4) - length(2)) / 2.0 / length(5) - offset;
                    tempX = (point{m,k}.coord(num,3) + length(5) * length(1) / (length(3) - length(1))) * (length(3) - length(1)) / 2.0 / length(5);
                    point{m,k}.coord(num,1) = tempX - (j - 1) * tempX * 2.0 / split(1);
                end
            end
    end
end
