function Q = ZYX2q(scalar, eulerAngles)
% ----------------------------------------------------------------------
%   Transformation ZYX Euler angles to quaternion
%    20120130  y.yoshimura
%    Inputs:scalar, specify the definition of the quaternion
%             scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%             scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%                   eulerAngles := (Phi, Theta, Psi) [rad]
%               Phi: around z axis
%               Theta: around y axis
%               Psi: around x axis
%   Outputs:    Q(q0 q1 q2 q3) q0 := cos(phi/2) 
%                       or
%               Q(q1 q2 q3 q4) q4 := cos(phi/2)
%   related function files: DCM2q.m
%   note:
%   cf:
%   revisions; 20160711 change the order of rotation angles, phi, theta,
%   and psi.
%   Q = ZYX2q(eulerAngles)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

Phi   = eulerAngles(1);
Theta = eulerAngles(2);
Psi   = eulerAngles(3);

R = [cos(Phi)*cos(Theta), sin(Phi)*cos(Theta), -sin(Theta)
    -sin(Phi)*cos(Psi)+cos(Phi)*sin(Theta)*sin(Psi), cos(Psi)*cos(Phi)+sin(Psi)*sin(Theta)*sin(Phi), cos(Theta)*sin(Psi)
    sin(Phi)*sin(Psi)+cos(Psi)*sin(Theta)*cos(Phi), -cos(Phi)*sin(Psi)+sin(Phi)*sin(Theta)*cos(Psi), cos(Theta)*cos(Psi)];

Q = DCM2q(scalar, R);

end