%-------------------------------------------------------------------------------------
%   Transformation ZYX Euler angles to Eigen axis and angle
%   12/01/30  yoshimura yasuhiro 
%       Input; (phi, theta, psi) [deg]
%       Output;(theta, lambda) [rad]
%       
%-------------------------------------------------------------------------------------


function [eig_ang eig_axis] = ZYX2Eigen(Phi, Theta, Psi)

%------translate ZYX Euler angles to wz-parameters----------------------
deg2rad = pi ./ 180;


Psi   = deg2rad .* Psi;
Theta = deg2rad .* Theta;
Phi   = deg2rad .* Phi;

% Rotational matrix
R = [cos(Psi)*cos(Theta) sin(Psi)*cos(Theta) -sin(Theta)
    -sin(Psi)*cos(Phi)+cos(Psi)*sin(Theta)*sin(Phi) cos(Psi)*cos(Phi)+sin(Psi)*sin(Theta)*sin(Phi) cos(Theta)*sin(Phi)
    sin(Psi)*sin(Phi)+cos(Psi)*sin(Theta)*cos(Phi) -cos(Psi)*sin(Phi)+sin(Psi)*sin(Theta)*cos(Phi) cos(Theta)*cos(Phi)];

trR = trace(R);
eig_ang = acos(0.5 * (trR - 1));

vector = [ R(2,3) - R(3,2)
    R(3,1) - R(1,3)
    R(1,2) - R(2,1)];

eig_axis = 1.0 / (2.0 * sin(eig_ang)) .* vector;


end