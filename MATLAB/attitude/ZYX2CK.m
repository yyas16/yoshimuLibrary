function [alpha beta] = ZYX2CK(Phi, Theta, Psi)
%   Transformation ZYX Euler angles to Caley-Klein parameters
%   11/12/02  yy    
%       Input; (phi, theta, psi)
%       Output;(alpha beta)
%-------------------------------------------------------------------------------------

%------translate ZYX Euler angles to Cayley-Klein parameters----------------------
deg2rad = pi ./ 180;

Psi   = deg2rad .* Psi;
Theta = deg2rad .* Theta;
Phi   = deg2rad .* Phi;

alpha = exp(1i * Psi / 2.0) .* (cos(Phi / 2.0) .* cos(Theta / 2.0) -...
    1i .* sin(Phi / 2.0) .* sin(Theta / 2.0));

beta =  exp(1i * Psi / 2.0) .* (cos(Phi / 2.0) .* sin(Theta / 2.0) -...
    1i .* sin(Phi / 2.0) .* cos(Theta / 2.0));


end