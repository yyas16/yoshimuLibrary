% -------------------------------------------------------------------
%   calculation area and position
%
%   2011-10-05  yasuhiro yoshimura
%        input: k: the number of facet
%       output: face.pos , face.area
% -------------------------------------------------------------------

function face = calcArea3(vert, face)

for i = 1:size(vert, 1)
    for j = 1:size(vert, 2) % the number of face
        
        % vector from index 1 to index 2
        vA = vert(i,j).coord(face(i,j).make(:,2),:) - vert(i,j).coord(face(i,j).make(:,1),:);
        
        % vector from index 1 to index 3
        vB = vert(i,j).coord(face(i,j).make(:,3),:) - vert(i,j).coord(face(i,j).make(:,1),:);
        
        crossA = cross(vA, vB); % cross product between vA and vB
        areaA  = vecnorm(crossA,2,2) ./ 2; % (norm of cross product) ./ 2        
        
        face(i,j).area(1,:) = areaA;
        
        posSum = vert(i,j).coord(face(i,j).make(:,1),:) + ...
            vert(i,j).coord(face(i,j).make(:,2),:) + ...
            vert(i,j).coord(face(i,j).make(:,3),:);            
        face(i,j).pos = (posSum ./ 3.0);
        
    end
    
end
end