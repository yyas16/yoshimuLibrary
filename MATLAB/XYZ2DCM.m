function R = XYZ2DCM(phi, theta, psi)
% -------------------------------------------------------------------
%   calculate directional cosine matrix
%   for coordinate transformation around an axis (NOT vector rotation) 
%   DCM denotes a rotation from inertial frame to body frame
%   i.e. b = R*i
%   input: phi->theta->psi,  rotation angle, [rad], scalar
%   outut: DCM, rotation matrix, 3x3 matrix
%   R = XY2DCM(phi, theta, psi)
%   (c) 2015  yasuhiro yoshimura
% -------------------------------------------------------------------

R = [cos(theta)*cos(psi) sin(theta)*cos(psi)*sin(phi)+sin(psi)*cos(phi) sin(psi)*sin(phi)-sin(theta)*cos(psi)*cos(phi)
    -cos(theta)*sin(psi) cos(psi)*cos(phi)-sin(theta)*sin(psi)*sin(phi) sin(theta)*sin(psi)*cos(phi)+cos(psi)*sin(phi)
    sin(theta) -cos(theta)*sin(phi) cos(theta)*cos(phi)];
    
end