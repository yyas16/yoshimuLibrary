function face = f4cube3(face, pNum, split, Ca)
% ----------------------------------------------------------------------
%   %// 面index生成 直方体ver.
%    20190620  y.yoshimura
%    Inputs: pNum: part number, scalar
%            split:
%            Ca
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
for k=1:6
    switch (k)
        case 1%: // X+面;
            for i=1:split(3)
                for j=1:split(2)
                    
                    num = j + 2 * (i - 1) * split(2);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(2) + 1);
                    face(pNum,k).make(num,2) = face(pNum,k).make(num,1) + 1;
                    tmp = j + 1 + i * (split(2) + 1);
                    face(pNum,k).make(num,3) = tmp - 1;
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                    
                    face(pNum,k).make(num+split(2),1) = tmp - 1;
                    face(pNum,k).make(num+split(2),2) = face(pNum,k).make(num,1) + 1;
                    face(pNum,k).make(num+split(2),3) = tmp;
                    
                    face(pNum,k).Ca(num+split(2)) = Ca(1);
                    face(pNum,k).Cd(num+split(2)) = Ca(2);
                    face(pNum,k).Cs(num+split(2)) = Ca(3);
                    face(pNum,k).Ct(num+split(2)) = Ca(4);
                    
                end
            end
            
        case 2%: // X-面
            for i=1:split(3)
                for j=1:split(2)
                    
                    num = j + 2 * (i - 1) * split(2);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(2) + 1);
                    tmp = j + i * (split(2)+1);
                    face(pNum,k).make(num,2) = tmp;
                    face(pNum,k).make(num,3) = face(pNum,k).make(num,1) + 1;
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                    
                    face(pNum,k).make(num+split(2),1) = tmp;
                    face(pNum,k).make(num+split(2),2) = tmp + 1;
                    face(pNum,k).make(num+split(2),3) = face(pNum,k).make(num,1) + 1;
                    
                    face(pNum,k).Ca(num+split(2)) = Ca(1);
                    face(pNum,k).Cd(num+split(2)) = Ca(2);
                    face(pNum,k).Cs(num+split(2)) = Ca(3);
                    face(pNum,k).Ct(num+split(2)) = Ca(4);
                end
            end
            
        case 3%: // Y+面
            for i=1:split(1)
                for j=1:split(3)
                    
                    num = j + 2 * (i - 1) * split(3);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(3) + 1);
                    face(pNum,k).make(num,2) = face(pNum,k).make(num,1) + 1;            
                    tmp = j + 1 + i * (split(3) + 1);
                    face(pNum,k).make(num,3) = tmp - 1;                    
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                                        
                    face(pNum,k).make(num+split(3),1) = tmp - 1;
                    face(pNum,k).make(num+split(3),2) = face(pNum,k).make(num,1) + 1;
                    face(pNum,k).make(num+split(3),3) = tmp;
                    
                    face(pNum,k).Ca(num+split(3)) = Ca(1);
                    face(pNum,k).Cd(num+split(3)) = Ca(2);
                    face(pNum,k).Cs(num+split(3)) = Ca(3);
                    face(pNum,k).Ct(num+split(3)) = Ca(4);
                end
            end
            
        case 4%: // Y-面
            for i=1:split(1)
                for j=1:split(3)
                    
                    num = j + 2 * (i - 1) * split(3);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(3) + 1);
                    tmp = j + i * (split(3) + 1);
                    face(pNum,k).make(num,2) = tmp;
                    face(pNum,k).make(num,3) = face(pNum,k).make(num,1) + 1;                    
                                        
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                                                    
                    face(pNum,k).make(num+split(3),1) = tmp ;
                    face(pNum,k).make(num+split(3),2) = tmp + 1;
                    face(pNum,k).make(num+split(3),3) = face(pNum,k).make(num,1) + 1;
                    
                    face(pNum,k).Ca(num+split(3)) = Ca(1);
                    face(pNum,k).Cd(num+split(3)) = Ca(2);
                    face(pNum,k).Cs(num+split(3)) = Ca(3);
                    face(pNum,k).Ct(num+split(3)) = Ca(4);
                    
                end
            end
            
        case 5%: // Z+面
            for i=1:split(2)
                for j=1:split(1)
                    
                    num = j + 2 * (i - 1) * split(1);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(1) + 1);
                    face(pNum,k).make(num,2) = face(pNum,k).make(num,1) + 1;
                    tmp = j + 1 + i * (split(1) + 1);
                    face(pNum,k).make(num,3) = tmp;                    
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                    
                    face(pNum,k).make(num+split(1),1) = tmp;
                    face(pNum,k).make(num+split(1),2) = tmp - 1;                    
                    face(pNum,k).make(num+split(1),3) = face(pNum,k).make(num,1);                   
                                        
                    face(pNum,k).Ca(num+split(1)) = Ca(1);
                    face(pNum,k).Cd(num+split(1)) = Ca(2);
                    face(pNum,k).Cs(num+split(1)) = Ca(3);
                    face(pNum,k).Ct(num+split(1)) = Ca(4);
                end
            end
        case 6%: // Z-面
            for i=1:split(2)
                for j=1:split(1)
                    
                    num = j + 2 * (i - 1) * split(1);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(1) + 1);
                    tmp =  j + i * (split(1) + 1);
                    face(pNum,k).make(num,2) = tmp;
                    face(pNum,k).make(num,3) = tmp + 1;                    
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);                 
                
                    face(pNum,k).make(num+split(1),1) = face(pNum,k).make(num,1);
                    face(pNum,k).make(num+split(1),2) = tmp + 1;
                    face(pNum,k).make(num+split(1),3) = face(pNum,k).make(num,1) + 1;
                    
                    face(pNum,k).Ca(num+split(1)) = Ca(1);
                    face(pNum,k).Cd(num+split(1)) = Ca(2);
                    face(pNum,k).Cs(num+split(1)) = Ca(3);
                    face(pNum,k).Ct(num+split(1)) = Ca(4);
                end
            end
    end
end