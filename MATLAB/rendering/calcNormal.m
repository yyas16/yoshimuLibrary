function face = calcNormal(vert, face)
% ----------------------------------------------------------------------
%   calculate normal vector
%    20180810  y.yoshimura
%    Inputs: vert
%            face
%   Outputs: face: face構造体にnormalを付加して出力
%   related function files:
%   note:
%   cf:
%   revisions;
%   function face = calcNormal(vert, face)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
% //■法線ベクトル計算関数

for k = 1:size(vert,1)
    for j = 1:size(vert,2)
        
        %	/* v1 = p1 - p2 */
        v1 = vert(k,j).coord(face(k,j).make(:,1),:)...
            - vert(k,j).coord(face(k,j).make(:,2),:); % Nx3 vector
        
        % 	/* v2 = p3 - p2 */
        v2 = vert(k,j).coord(face(k,j).make(:,3),:)...
            - vert(k,j).coord(face(k,j).make(:,2),:);
        
        % 	/* 外積v2×v1（= cross）を求める */
        crossV = cross(v2, v1);
        
        % 	/* 外積v2×v1の長さ|v2×v1|（= length）を求める */
        crossV_norm = vecnorm(crossV, 2, 2);
        
        % 	/* 長さ|v2×v1|が0のときは法線ベクトルは求められない */
        crossV_norm = crossV_norm + (crossV_norm <= 1e-8) .*1e-8; % 0割を避けるため微小項をたす        
        
        %         if (crossV_norm == 0.0)
        %             fprintf('error at normal vector calculation \n');
        %             crossV = [0; 0 ; 1e-8];
        %             crossV_norm = 1e-8;
        %         end
        
        % 	/* 外積v2×v1を長さ|v2×v1|で割って法線単位ベクトルnを求める *
        n = crossV ./ crossV_norm;
        %         n = n'; % norma vector n becomes 1x3 vector
        
        face(k,j).normal = n;
        
    end
end

end