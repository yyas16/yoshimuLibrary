% ----------------------------------------------------------------------
%   calculate normal vector
%    20180810  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
% //■法線ベクトル計算関数

function face = calcNormal(vert, face)

for k = 1:size(vert,1)
    for j = 1:size(vert,2)
        for i = 1:size(face(k,j).make,1)
            
            %	/* v1 = p1 - p2 */
            v1 = vert(k,j).coord(face(k,j).make(i,1),:)'...
                - vert(k,j).coord(face(k,j).make(i,2),:)';
            
            % 	/* v2 = p3 - p2 */
            v2 = vert(k,j).coord(face(k,j).make(i,3),:)'...
                - vert(k,j).coord(face(k,j).make(i,2),:)';            
            
            % 	/* 外積v2×v1（= cross）を求める */
            crossV = cross(v2, v1);
            
            % 	/* 外積v2×v1の長さ|v2×v1|（= length）を求める */
            crossV_norm = norm(crossV);
            
            % 	/* 長さ|v2×v1|が0のときは法線ベクトルは求められない */
            if (crossV_norm == 0.0)
                %             fprintf('error at normal vector calculation \n');
                crossV = [0; 0 ; 1e-8];
                crossV_norm = 1e-8;
            end
            
            % 	/* 外積v2×v1を長さ|v2×v1|で割って法線ベクトルnを求める *
            n = crossV ./ crossV_norm;
            %         n = n'; % norma vector n becomes 1x3 vector
            
            face(k,j).normal(:,i) = n;
        end
    end
end
end