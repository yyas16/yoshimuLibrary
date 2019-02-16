function [L face] = AS(face, sun, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Ashikhmin-Shirley (modified Phong) model
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

theta = acos(v(3));

for i = 1:size(face,2) % each face
    L_j = 0;
    switch i % nu = nvの時は不要だが．．．
        case 1
            uu = [0; 0; -1];
            uv = [0; 1; 0];
        case 2
            uu = [0; 0; -1];
            uv = [0; -1; 0];
        case 3
            uu = [0; 0; -1];
            uv = [-1; 0; 0];
        case 4
            uu = [0; 0; -1];
            uv = [1; 0; 0];
        case 5
            uu = [1; 0; 0];
            uv = [0; 1; 0];
        case 6
            uu = [-1; 0; 0];
            uv = [0; 1; 0];
    end
    
    for j = 1:size(face{i}.area,2) % each small facet
        if face{i}.normal(:,j)'*sun > 0 && face{i}.normal(:,j)'* v > 0
            %         specular coefficient
            nu = 1000;
            nv = 1000;
            k1 = sqrt((nu+1) * (nv+1)) / 8 / pi;
            F_refl = face{i}.Cs(j) + (1/0.5 - face{i}.Cs(j)) * (1 - sun'*u_bisec)^5;
            %             z = (nu * (u_bisec'*uu)^2 + nv * (u_bisec' * uv)^2) / (1 - (u_bisec' * face{i}.normal(:,j))^2);
            z = nu; % nu = nvの時だけ
            rho_s_num = (u_bisec' * face{i}.normal(:,j))^z;
%                         rho_s_den = (v'*face{i}.normal(:,j)) + (sun'*face{i}.normal(:,j))...
%                             -(v'*face{i}.normal(:,j))*(sun'*face{i}.normal(:,j));
            rho_s_den = (u_bisec' * sun) * max([face{i}.normal(:,j)'*sun, face{i}.normal(:,j)'*v]);
            rho_s = k1 * rho_s_num / rho_s_den * F_refl;
            
            %         diffuse coefficient
            k2 = (28 * face{i}.Cd(j) / 23 / pi ) * (1 - 0.5*face{i}.Cs(j));
            rho_d = k2 * (1 - (1 - v'*face{i}.normal(:,j)/2)^5) * (1 - (1 - sun' * face{i}.normal(:,j)/2)^5);
            c_total = rho_s + rho_d;
            
            tmp = c_total * face{i}.area(j) * (face{i}.normal(:,j)'*sun) *(face{i}.normal(:,j)'*v);
            L_j = L_j + tmp;
            
            face{i}.m(1,j) = tmp;
            face{i}.Rd(1,j) = 0.5 * rho_d * cos(theta) * sin(theta);
            face{i}.Rs(1,j) = 0.5 * rho_s * cos(theta) * sin(theta);            
        else
            face{i}.m(1,j) = 0;
        end
    end
    L = L + L_j;
end

end