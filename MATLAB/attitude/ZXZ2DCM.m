function R =  zxz2dcm(phi, theta, psi)
% -------------------------------------------------------------------
%   calculate directional cosine matrix
%   for coordinate transformation around an axis (NOT vector rotation) 
%   DCM denotes a rotation from inertial frame to body frame
%   i.e. b = R*i
%   input: phi->theta->psi,  rotation angle, [rad], scalar
%   outut: DCM, rotation matrix, 3x3 matrix
%   R = ZXZ2DCM(phi, theta, psi)
%   (c) 2015  yasuhiro yoshimura
% -------------------------------------------------------------------

R = [cos(phi)*cos(psi)-sin(phi)*sin(psi)*cos(theta), sin(phi)*cos(psi)+sin(psi)*cos(phi)*cos(theta), sin(theta)*sin(psi)
    -sin(phi)*cos(theta)*cos(psi)-sin(psi)*cos(phi), cos(phi)*cos(theta)*cos(psi)-sin(phi)*sin(psi), sin(theta)*cos(psi)
    sin(phi)*sin(theta), -sin(theta)*cos(phi), cos(theta)];
end