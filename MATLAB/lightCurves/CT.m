function [L, face] = CT(face, sun, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Cook-Torrance model
%    20180816  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf: Wetterer, C. J., Linares, R., Crassidis, J. L., Kelecy, T. M., Ziebart, M. K., Jah, M. K., & Cefola, P. J.  (2014).
% Refining Space Object Radiation Pressure Modeling with Bidirectional Reflectance Distribution Functions. Journal of Guidance, Control, and Dynamics, 37(1), 185?196. https://doi.org/10.2514/1.60577
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

L = 0;
v = v ./ norm(v);

h = sun + v;
h = h ./ norm(h);

m = 0.2;
spe = 0.9;
dif = 0.1;

for k = 1:size(face,1) % each component
    for i = 1:size(face,2) % each face
        L_j = 0;
        for j = 1:size(face(k,i).area,2) % each small facet
            if face(k,i).normal(:,j)'*sun > 0 && face(k,i).normal(:,j)'* v > 0
                nh = face(k,i).normal(:,j)' * h;
                nv = face(k,i).normal(:,j)' * v;
                vh = v' * h;
                ns = face(k,i).normal(:,j)' * sun;
                
                alpha = acos(nh);
                
                % diffuse
                cd_ct = face(k,i).Cd(j) / pi; % difä‹Çﬁ
                
                % specular
                D = 1 / pi / (m^2 * (cos(alpha))^4) * exp(-(tan(alpha)/m)^2);
                G = min([1, ...
                    2 * nh * nv / vh, ...
                    2 * nh * ns / vh]);
                F0 = face(k,i).Cs(j) / spe;
                n_est = (1 + sqrt(F0)) / (1 - sqrt(F0));
                g = sqrt(n_est^2 + vh^2 - 1);
                temp = (vh * (g + vh) -1)^2 / (vh * (g - vh) + 1)^2;
                F = (g - vh)^2 / 2 / (g + vh)^2 * (1 + temp);
                cs_ct = D * G * F / (4 * ns * nv);
                
                c_total = cd_ct + spe*cs_ct;
                
                tmp = c_total * face(k,i).area(j) * ns * nv;
                face(k,i).m(1,j) = tmp;
                L_j = L_j + tmp;
            else
                face(k,i).m(1,j) = 0;
            end
        end
        L = L + L_j;
    end
end
end