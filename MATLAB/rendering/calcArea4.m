% -------------------------------------------------------------------
%   calculation area and position
%
%   2011-10-05  yasuhiro yoshimura
%        input: k: the number of facet
%       output: face.pos , face.area
% -------------------------------------------------------------------

function face = calcArea4(vert, face)

for i = 1:size(vert, 1)
    for j = 1:size(vert, 2) % the number of face
        
        % vector from index 1 to index 2
        vA = vert(i,j).coord(face(i,j).make(:,2),:) - vert(i,j).coord(face(i,j).make(:,1),:);
        
        % vector from index 1 to index 3
        vB = vert(i,j).coord(face(i,j).make(:,3),:) - vert(i,j).coord(face(i,j).make(:,1),:);
        
        crossA = cross(vA, vB); % cross product between vA and vB, Nx3
        areaA  = vecnorm(crossA,2,2) ./ 2; % (norm of cross product) ./ 2        
                
        % repeat...
        % vector from index 1 to index 4
        vC = vert(i,j).coord(face(i,j).make(:,4),:) - vert(i,j).coord(face(i,j).make(:,1),:);
        % vector from index 1 to index 3
        vD = vert(i,j).coord(face(i,j).make(:,3),:) - vert(i,j).coord(face(i,j).make(:,1),:);
        
        crossB = cross(vC, vD); % cross product between vA and vB
        areaB  = vecnorm(crossB, 2, 2) ./ 2;
        
        Area = areaA + areaB;
        
        face(i,j).area(:,1) = Area;
        
        posSum = vert(i,j).coord(face(i,j).make(:,1),:) + ...
            vert(i,j).coord(face(i,j).make(:,2),:) + ...
            vert(i,j).coord(face(i,j).make(:,3),:) + ...
            vert(i,j).coord(face(i,j).make(:,4),:);
        face(i,j).pos = (posSum ./ 4.0);
        
    end
end

end