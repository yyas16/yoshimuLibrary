function face = SRP_LPS(face, sun_b, d)
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
AU = AU2km(1.0) * 10^3; % m
Bf = 2/3;
kappa = 0;

d_AU = d / AU; % AU
sun_b = sun_b(:); % column vector
sun_b = sun_b ./ norm(sun_b);

coeff = -S0 / c / d_AU^2;

for k = 1:size(face,1) % each component
    for i = 1:size(face,2) % each face
        face(k,i).force = zeros(size(face(k,i).area,1), 3); % N x 3 matrix
        face(k,i).torque = zeros(size(face(k,i).area,1), 3); % N x 3 matrix
        
        for j = 1:size(face(k,i).area,1) % each small facet
            if face(k,i).normal(j,:)*sun_b > 0 % when the facet is sunlit            
                tmp = abs(face(k,i).normal(j,:)*sun_b) * (face(k,i).Ca(j)+face(k,i).Cd(j)) .* sun_b ...
                    + (face(k,i).normal(j,:)*sun_b) * (Bf*face(k,i).Cd(j)+kappa*face(k,i).Ca(j) ...
                    + 2.0 * face(k,i).Cs(j) * face(k,i).normal(j,:)*sun_b) .* face(k,i).normal(j,:)'; % 3x1
                face(k,i).force(j,:) = coeff .* face(k,i).area(j) .* tmp';                
            else
                face(k,i).force(j,:) = zeros(1,3);
            end
            face(k,i).torque(j,:) = cross(face(k,i).pos(j,:), face(k,i).force(j,:));
        end
    end
end

end
