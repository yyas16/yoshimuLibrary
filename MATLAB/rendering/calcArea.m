% -------------------------------------------------------------------
%   calculation area and position
%
%   2011-10-05  yasuhiro yoshimura
%        input: k: the number of facet
%       output: face.pos , face.area 
% -------------------------------------------------------------------

function face = calcArea(vert, face)


for j = 1:size(vert, 2) % the number of face
    
%     %         vector from index 1 to index 2
%     vA = vert{j}.coord(face{j}.make(:,2),:) - vert{j}.coord(face{j}.make(:,1),:);
%     
%     %          vector from index 1 to index 3
%     vB = vert{j}.coord(face{j}.make(:,3),:) - vert{j}.coord(face{j}.make(:,1),:);
%    
%     crossA = cross(vA', vB', 1)'; % cross product between vA and vB
%     areaA  = sqrt(diag(crossA * crossA')) ./ 2; % norm ./ 2
%     
%     % repeat...
%     % vector from index 1 to index 4
%     vC = vert{j}.coord(face{j}.make(:,4),:) - vert{j}.coord(face{j}.make(:,1),:);
%     % vector from index 1 to index 3
%     vD = vert{j}.coord(face{j}.make(:,3),:) - vert{j}.coord(face{j}.make(:,1),:);
%     
%     crossB = cross(vC', vD', 1)'; % cross product between vA and vB
%     areaB  = sqrt(diag(crossB * crossB')) ./ 2; % norm ./ 2
%     
%     Area = areaA + areaB;
%     
%     face{j}.area(1,:) = Area;
%     
%     posSum = vert{j}.coord(face{j}.make(:,1),:) + ...
%         vert{j}.coord(face{j}.make(:,2),:) + ...
%         vert{j}.coord(face{j}.make(:,3),:) + ...
%         vert{j}.coord(face{j}.make(:,4),:);
%     face{j}.pos = (posSum ./ 4.0)';

%         vector from index 1 to index 2
    vA = vert(j).coord(face(j).make(:,2),:) - vert(j).coord(face(j).make(:,1),:);
    
    %          vector from index 1 to index 3
    vB = vert(j).coord(face(j).make(:,3),:) - vert(j).coord(face(j).make(:,1),:);
   
    crossA = cross(vA', vB', 1)'; % cross product between vA and vB
    areaA  = sqrt(diag(crossA * crossA')) ./ 2; % norm ./ 2
    
    % repeat...
    % vector from index 1 to index 4
    vC = vert(j).coord(face(j).make(:,4),:) - vert(j).coord(face(j).make(:,1),:);
    % vector from index 1 to index 3
    vD = vert(j).coord(face(j).make(:,3),:) - vert(j).coord(face(j).make(:,1),:);
    
    crossB = cross(vC', vD', 1)'; % cross product between vA and vB
    areaB  = sqrt(diag(crossB * crossB')) ./ 2; % norm ./ 2
    
    Area = areaA + areaB;
    
    face(j).area(1,:) = Area;
    
    posSum = vert(j).coord(face(j).make(:,1),:) + ...
        vert(j).coord(face(j).make(:,2),:) + ...
        vert(j).coord(face(j).make(:,3),:) + ...
        vert(j).coord(face(j).make(:,4),:);
    face(j).pos = (posSum ./ 4.0)';
    
end

end