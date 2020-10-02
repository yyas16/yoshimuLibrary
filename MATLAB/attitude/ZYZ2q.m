function Q = ZYZ2q(scalar, eulerAngles)
% ----------------------------------------------------------------------
%   Transformation ZYZ Euler angles to quaternion
%    20120130  y.yoshimura
%    Inputs:scalar, specify the definition of the quaternion
%             scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%             scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%                   eulerAngles := (Phi, Theta, Psi) [rad], Nx3 matrix
%               Phi: around 1st axis (z axis)
%               Theta: around 2nd axis (y axis)
%               Psi: around 3rd axis (z axis)
%   Outputs:    Q(q0 q1 q2 q3) q0 := cos(phi/2), Nx4 matrix
%                       or
%               Q(q1 q2 q3 q4) q4 := cos(phi/2), Nx4 matrix
%   related function files: DCM2q.m
%   note:
%   cf:
%   revisions;
%   Q = ZYZ2q(eulerAngles)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
Q = zeros(size(eulerAngles,1), 4);

for i = 1:size(eulerAngles,1)
    phi   = eulerAngles(i,1);
    theta = eulerAngles(i,2);
    psi   = eulerAngles(i,3);
    
    R = [cos(phi)*cos(theta)*cos(psi)-sin(phi)*sin(psi), sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi), -sin(theta)*cos(psi)
        -sin(phi)*cos(psi)-sin(psi)*cos(phi)*cos(theta), cos(phi)*cos(psi)-sin(phi)*sin(psi)*cos(theta), sin(theta)*sin(psi)
        sin(theta)*cos(phi), sin(phi)*sin(theta), cos(theta)];
    
    Q(i,:) = DCM2q(scalar, R);
end


end