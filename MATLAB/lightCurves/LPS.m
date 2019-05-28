function [L, face] = LPS(face, sun, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Lambertian and Perfect Specular model
%    20180816  y.yoshimura
%    Inputs: face,
%             sun,
%               v,
%   Outputs: L
%            face
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

L = 0;
u_bisec = sun + v;
u_bisec = u_bisec ./ norm(u_bisec);


for i = 1:size(face,2) % each face
    L_j = 0;
    
    for j = 1:size(face(i).area,2) % each small facet
        if face(i).normal(:,j)'*sun > 0 && face(i).normal(:,j)'* v > 0
                       
            c_total = face(i).Cd(j)...
                + 1.0 * face(i).Cs(j) * (u_bisec'*face(i).normal(:,j) >= cos(deg2rad(5)));
            
            tmp = c_total * face(i).area(j) * (face(i).normal(:,j)'*sun) * (face(i).normal(:,j)'*v);            
            L_j = L_j + tmp;
            face(i).m(1,j) = tmp;
        else
            face(i).m(1,j) = 0;
        end
    end
    L = L + L_j;
end

end
