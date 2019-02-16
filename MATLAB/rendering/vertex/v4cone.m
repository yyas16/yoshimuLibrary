function vert = v4cone(length, split)
% ----------------------------------------------------------------------
% // ñ ç¿ïWê∂ê¨ â~êç circular cone
%    20180831  y.yoshimura
%    Inputs: length = [height, radius], split = [height, circumferential]
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   function v4cone(length, split)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
vert = cell(1,2);

% äOñ 
for i=1:split(1) + 1
    for j=1:split(2) + 1
        num = j + (i - 1) * (split(2) + 1);
        
        vert{1}.coord(num,3) = (i - 1) * length(1) / split(1);
        Z = vert{1}.coord(num,3);
        
        temp = (Z + length(1) * length(2) / (0 - length(2))) * (0 - length(2)) / length(1);
        
        vert{1}.coord(num,1) = temp * cos((j-1) * 2.0 * pi / split(2));
        vert{1}.coord(num,2) = temp * sin((j-1) * 2.0 * pi / split(2));
        vert{1}.coord(num,3) = (i - 1) * length(1) / split(1);
    end
end

vert{2}.coord(:,:) = vert{1}.coord(:,:);




end
