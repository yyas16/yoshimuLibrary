function face = calcNormal(vert, face)
% ----------------------------------------------------------------------
%   calculate normal vector
%    20180810  y.yoshimura
%    Inputs: vert
%            face
%   Outputs: face: face�\���̂�normal��t�����ďo��
%   related function files:
%   note:
%   cf:
%   revisions;
%   function face = calcNormal(vert, face)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
% //���@���x�N�g���v�Z�֐�

for k = 1:size(vert,1)
    for j = 1:size(vert,2)
        
        %	/* v1 = p1 - p2 */
        v1 = vert(k,j).coord(face(k,j).make(:,1),:)...
            - vert(k,j).coord(face(k,j).make(:,2),:); % Nx3 vector
        
        % 	/* v2 = p3 - p2 */
        v2 = vert(k,j).coord(face(k,j).make(:,3),:)...
            - vert(k,j).coord(face(k,j).make(:,2),:);
        
        % 	/* �O��v2�~v1�i= cross�j�����߂� */
        crossV = cross(v2, v1);
        
        % 	/* �O��v2�~v1�̒���|v2�~v1|�i= length�j�����߂� */
        crossV_norm = vecnorm(crossV, 2, 2);
        
        % 	/* ����|v2�~v1|��0�̂Ƃ��͖@���x�N�g���͋��߂��Ȃ� */
        crossV_norm = crossV_norm + (crossV_norm <= 1e-8) .*1e-8; % 0��������邽�ߔ�����������        
        
        %         if (crossV_norm == 0.0)
        %             fprintf('error at normal vector calculation \n');
        %             crossV = [0; 0 ; 1e-8];
        %             crossV_norm = 1e-8;
        %         end
        
        % 	/* �O��v2�~v1�𒷂�|v2�~v1|�Ŋ����Ė@���P�ʃx�N�g��n�����߂� *
        n = crossV ./ crossV_norm;
        %         n = n'; % norma vector n becomes 1x3 vector
        
        face(k,j).normal = n;
        
    end
end

end