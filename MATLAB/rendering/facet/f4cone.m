% ----------------------------------------------------------------------
%
%    20180831  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
% // ñ indexê∂ê¨ â~íåver.
function face = f4cone(split, Ca)

for i=1:split(1)
    for j=1:split(2)
        
        num = j + (i - 1) * split(2);
        
        face(1).make(num,1) = j + (i - 1) * (split(2) + 1);
        face(1).make(num,2) = face(1).make(num,1) + 1;
        face(1).make(num,3) = j + 1 + i * (split(2) + 1);
        face(1).make(num,4) = face(1).make(num,3) - 1;
        face(1).Ca(num) = Ca(1);
        face(1).Cd(num) = Ca(2);
        face(1).Cs(num) = Ca(3);
        face(1).Ct(num) = Ca(4);
        face(1).m(num) = 0; % initialize brightness
        
        %ó†ñ 
        face(2).make(num,1) = face(1).make(num,1);
        face(2).make(num,2) = face(1).make(num,4);
        face(2).make(num,3) = face(1).make(num,3);
        face(2).make(num,4) = face(1).make(num,2);
        face(2).Ca(num) = Ca(1);
        face(2).Cd(num) = Ca(2);
        face(2).Cs(num) = Ca(3);
        face(2).Ct(num) = Ca(4);
        face(2).m(num) = 0;
    end
end

end
