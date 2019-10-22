function [L, face] = LPS(face, sun, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Lambertian and Perfect Specular model
%    20180816  y.yoshimura
%    Inputs: face,
%             sun, sun vector from spacecraft to sun, unit vector,
%               v, observer vector from spacecraft to observer, unit vetor
%   Outputs: L: f_obs of whole object
%            face
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
sun = sun ./ norm(sun);                
v = v ./ norm(v);

L = 0;
u_bisec = sun + v; % bisector of sun and observer vectors
u_bisec = u_bisec ./ norm(u_bisec);

for k = 1:size(face,1) % each component    
    for i = 1:size(face,2) % each face
        L_j = 0;
        for j = 1:size(face(k,i).area,2) % each small facet
            if face(k,i).normal(:,j)'*sun > 0 && face(k,i).normal(:,j)'* v > 0
                
                c_total = face(k,i).Cd(j)./pi ...
                    + 2.0 * face(k,i).Cs(j) * (u_bisec'*face(k,i).normal(:,j) >= cos(deg2rad(5)));
                
                tmp = c_total * face(k,i).area(j) * (face(k,i).normal(:,j)'*sun) * (face(k,i).normal(:,j)'*v);
                L_j = L_j + tmp;
                face(k,i).m(1,j) = tmp;
            else
                face(k,i).m(1,j) = 0;
            end
        end
        L = L + L_j;        
    end
end

end
