function [L, face] = lcAS(face, sun, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Ashikhmin-Shirley (anisotropic Phong) model
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
h = sun + v;
h = h ./ norm(h);
[beta_, alp_, ~] = cart2sph(h(1), h(2), h(3));
alp_ = pi/2 - alp_;

nu = 50;
nv = 50;
spe = 0.9;
dif = 0.1;


for k = 1:size(face,1) % each component
    for i = 1:size(face,2) % each face
        L_j = 0;
        for j = 1:size(face(k,i).area,2) % each small facet
            if face(k,i).normal(:,j)'*sun > 0 && face(k,i).normal(:,j)'* v > 0
                VH = v' * h;
                VN = v' * face(k,i).normal(:,j);
                
                rho = face(k,i).Cd(j) / dif;
                F0 = face(k,i).Cs(j) / spe;
                %                 diffuse
                k2 = (28 / 23 * rho / pi ) * (1 - spe * F0);
                cd_as = k2 * (1 - (1 - sun(3)/2)^5) * (1 - (1 - VN/2)^5);
                
                %         specular
                k1 = sqrt((nu+1) * (nv+1)) / 8 / pi;
                F_AS = F0 + (1/spe - F0) * (1 - VH)^5;
                cs_num = F_AS * cos(alp_)^(nu*cos(beta_)^2 + nv * sin(beta_)^2);
                cs_den = VH * max(sun(3), VN);
                cs_as = k1 * cs_num / cs_den;
                
                c_total = dif*cd_as + spe*cs_as;
                
                tmp = c_total * face(k,i).area(j) * (face(k,i).normal(:,j)'*sun) *(face(k,i).normal(:,j)'*v);
                face(k,i).m(1,j) = tmp; % f_obs                
                L_j = L_j + tmp;
            else
                face(k,i).m(1,j) = 0;
            end
        end
        L = L + L_j;
    end
end

end