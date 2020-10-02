function q = zxz2q(scalar, eulerAngles)
% ----------------------------------------------------------------------
%    ZXZ Euler angles to quaternion
%    20200904  y.yoshimura
%    Inputs:scalar, specify the definition of the quaternion
%             scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%             scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%              eulerAngles := (phi, theta, psi) [rad], nx3 matrix
%               phi: around z axis, 1st rotation
%               theta: around x axis, 2nd rotation
%               psi: around z axis, 3rd rotation
%   Outputs:    q(q0 q1 q2 q3) q0 := cos(phi/2), nx4 matrix
%                       or
%               q(q1 q2 q3 q4) q4 := cos(phi/2), nx4 matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%   function q = zxz2q(4, eulerAngles)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

q = zeros(length(eulerAngles), 4);
for i = 1:length(eulerAngles)
    dcm = zxz2dcm(eulerAngles(i,1), eulerAngles(i,2),eulerAngles(i,3));
    q(i,:) = DCM2q(scalar, dcm);
end

end