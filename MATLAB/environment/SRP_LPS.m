function face = SRP_LPS(face, sun, d)
% ----------------------------------------------------------------------
%   calculate Solar Radiation Pressure (SRP) forces and torques
%                    with Lambertian and Perfect Specular model
%    20180816  y.yoshimura
%    Inputs: face,
%             sun, sun vector from sat to sun, 3x1 unit vector
%               d, distance between sat and sun, m
%   Outputs: face‚Ì’†‚Éforce‚Ætorque‚ð‰Á‚¦‚é
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
S0 = 1357; % Solar constant, W/m^2
c = 299792458; % light speed, m/s
AU = 1.496e+8 * 10^3; % m
Bf = 2/3;
kappa = 0;

d_AU = d / AU; % AU
sun = sun(:); % column vector
sun = sun ./ norm(sun);

coeff = -S0 / c / d_AU^2;

for k = 1:size(face,1) % each component
    for i = 1:size(face,2) % each face
        face(k,i).force = zeros(3, size(face(k,i).area,2));
        face(k,i).torque = zeros(3, size(face(k,i).area,2));
        
        for j = 1:size(face(k,i).area,2) % each small facet
            if face(k,i).normal(:,j)'*sun > 0 % when facet is sunlit
                tmp = abs(sun'*face(k,i).normal(:,j)) * (face(k,i).Ca(j)+face(k,i).Cd(j)) .* sun ...
                    + (sun' * face(k,i).normal(:,j)) * (Bf*face(k,i).Cd(j)+kappa*face(k,i).Ca(j) ...
                    + 2.0 * face(k,i).Cs(j)*abs(sun'*face(k,i).normal(:,j)) .* face(k,i).normal(:,j));
                face(k,i).force(:,j) = coeff .* face(k,i).area(j) .* tmp;
            else
                face(k,i).force(:,j) = zeros(3,1);
            end
            face(k,i).torque(:,j) = cross(face(k,i).pos(:,j), face(k,i).force(:,j));
        end
    end
end

end
