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

function [L face] = cook(face, sun, v)

L = 0;
u_bisec = sun + v;
u_bisec = u_bisec ./ norm(u_bisec);

m = sqrt(2/1000); % related to n in Ashikhin-Shirley model (n=1000 in  this case)

for i = 1:size(face,2) % each face
    L_j = 0;
    for j = 1:size(face{i}.area,2) % each small facet
        if face{i}.normal(:,j)'*sun > 0 && face{i}.normal(:,j)'* v > 0
            nh = face{i}.normal(:,j)' * u_bisec;
            nv = face{i}.normal(:,j)' * v;
            vh = v' * u_bisec;
            nl = face{i}.normal(:,j)' * sun;
            
            alpha = acos(nh);
            
            % specular coefficient
            D = 1 / (pi * m^2 * (cos(alpha))^4) * exp(-(tan(alpha)/m)^2);            
            G = min([1, ...
                2 * nh * nv / vh, ...
                2 * nh * nl / vh]);
            nest = (1 + sqrt(face{i}.Cs(j))) / (1 - sqrt(face{i}.Cs(j)));
            g = sqrt(nest^2 + vh^2 - 1);
            F = (g - vh)^2 / 2 / (g + vh)^2 ...
                * (1 + (vh * (g + vh) - 1)^2 / (vh * (g - vh) + 1)^2);
            rho_s = D * G * F / (4 * nl * nv);
            %         diffuse coefficient
            rho_d = face{i}.Cd(j) / pi;
            
            c_total = rho_s + rho_d;
            tmp = c_total * face{i}.area(j) * nl * nv;
            L_j = L_j + tmp;
            face{i}.m(1,j) = tmp;
        else
            face{i}.m(1,j) = 0;
        end
    end
    L = L + L_j;
end

end