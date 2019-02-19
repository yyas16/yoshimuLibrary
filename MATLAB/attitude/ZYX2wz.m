%-------------------------------------------------------------------------------------
%   Transformation ZYX Euler angles to wz-parameteres
%   11/11/14  yy
%       Input; (phi, theta, psi) [deg]
%       Output;(w1 w2 z)
%-------------------------------------------------------------------------------------


function [w1 w2 z] = ZYX2wz(Phi, Theta, Psi)

%------translate ZYX Euler angles to wz-parameters----------------------
deg2rad = pi ./ 180;


Psi   = deg2rad .* Psi;
Theta = deg2rad .* Theta;
Phi   = deg2rad .* Phi;

if sin(Phi) ==0.0
    z = Psi;
else
    alpha = tan(Theta) ./ sin(Phi);     % just a parameter for calculation
    p     = alpha ./ sqrt(1+alpha.^2);   % just a parameter for calculation
    z     = Psi + asin(p .* cos(Phi)) - asin(p);
end

w1 = sin(Phi) .* cos(Theta) ./ (1 + cos(Phi) .* cos(Theta));
w2 = sin(Theta) ./ (1 + cos(Phi) .* cos(Theta));


end