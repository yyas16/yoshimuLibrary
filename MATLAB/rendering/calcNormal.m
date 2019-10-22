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
% //���@���x�N�g���v�Z�֐�

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
            
            % 	/* �O��v2�~v1�i= cross�j�����߂� */
            crossV = cross(v2, v1);
            
            % 	/* �O��v2�~v1�̒���|v2�~v1|�i= length�j�����߂� */
            crossV_norm = norm(crossV);
            
            % 	/* ����|v2�~v1|��0�̂Ƃ��͖@���x�N�g���͋��߂��Ȃ� */
            if (crossV_norm == 0.0)
                %             fprintf('error at normal vector calculation \n');
                crossV = [0; 0 ; 1e-8];
                crossV_norm = 1e-8;
            end
            
            % 	/* �O��v2�~v1�𒷂�|v2�~v1|�Ŋ����Ė@���x�N�g��n�����߂� *
            n = crossV ./ crossV_norm;
            %         n = n'; % norma vector n becomes 1x3 vector
            
            face(k,j).normal(:,i) = n;
        end
    end
end
end