function face = f4cube(face, pNum, split, Ca)
% ----------------------------------------------------------------------
%   %// ñ indexê∂ê¨ íºï˚ëÃver. triangular patch ver.
%    20190620  y.yoshimura
%    Inputs: pNum: part number, scalar
%            split: split number, along [x, y, z] axis
%            Ca: surface optical properties [Ca, Cd, Cs, Ct]
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
        case 1%: // X+ñ ;
            for i=1:split(3)
                for j=1:split(2)
                    
                    num = j + (i - 1) * split(2);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(2) + 1);
                    face(pNum,k).make(num,2) = face(pNum,k).make(num,1) + 1;
                    face(pNum,k).make(num,3) = j + 1 + i * (split(2)+1);
                    face(pNum,k).make(num,4) = face(pNum,k).make(num,3) - 1;
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                end
            end
            
        case 2%: // X-ñ 
            for i=1:split(3)
                for j=1:split(2)
                    
                    num = j + (i - 1) * split(2);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(2) + 1);
                    face(pNum,k).make(num,2) = j + i * (split(2)+1);
                    face(pNum,k).make(num,3) = face(pNum,k).make(num,2) + 1;
                    face(pNum,k).make(num,4) = face(pNum,k).make(num,1) + 1;
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                end
            end
            
        case 3%: // Y+ñ 
            for i=1:split(1)
                for j=1:split(3)
                    
                    num = j + (i - 1) * split(3);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(3) + 1);
                    face(pNum,k).make(num,2) = face(pNum,k).make(num,1) + 1;
                    face(pNum,k).make(num,3) = j + 1 + i * (split(3) + 1);
                    face(pNum,k).make(num,4) = face(pNum,k).make(num,3) - 1;
                    
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                end
            end
            
        case 4%: // Y-ñ 
            for i=1:split(1)
                for j=1:split(3)
                    
                    num = j + (i - 1) * split(3);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(3) + 1);
                    face(pNum,k).make(num,2) = j + i * (split(3) + 1);
                    face(pNum,k).make(num,3) = face(pNum,k).make(num,2) + 1;
                    face(pNum,k).make(num,4) = face(pNum,k).make(num,1) + 1;                    
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                end
            end
            
        case 5%: // Z+ñ 
            for i=1:split(2)
                for j=1:split(1)
                    
                    num = j + (i - 1) * split(1);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(1) + 1);
                    face(pNum,k).make(num,2) = face(pNum,k).make(num,1) + 1;
                    face(pNum,k).make(num,3) = j + 1 + i * (split(1) + 1);
                    face(pNum,k).make(num,4) = face(pNum,k).make(num,3) - 1;
                    
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                end
            end
        case 6%: // Z-ñ 
            for i=1:split(2)
                for j=1:split(1)
                    
                    num = j + (i - 1) * split(1);
                    
                    face(pNum,k).make(num,1) = j + (i - 1) * (split(1) + 1);
                    face(pNum,k).make(num,2) = j + i * (split(1) + 1);
                    face(pNum,k).make(num,3) = face(pNum,k).make(num,2) + 1;
                    face(pNum,k).make(num,4) = face(pNum,k).make(num,1) + 1;
                    
                    face(pNum,k).Ca(num) = Ca(1);
                    face(pNum,k).Cd(num) = Ca(2);
                    face(pNum,k).Cs(num) = Ca(3);
                    face(pNum,k).Ct(num) = Ca(4);
                end
            end
    end
end
