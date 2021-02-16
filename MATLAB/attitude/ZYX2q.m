function q = zyx2q(scalar, euler)
% ----------------------------------------------------------------------
%    ZYX Euler angles to quaternion
%    20200904  y.yoshimura
%    Inputs:scalar, specify the definition of the quaternion
%             scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%             scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%              eulerAngles := (phi, theta, psi) [rad], nx3 matrix
%               phi: around z axis, 1st rotation
%               theta: around y axis, 2nd rotation
%               psi: around x axis, 3rd rotation
%   Outputs:    q(q0 q1 q2 q3) q0 := cos(phi/2), nx4 matrix
%                       or
%               q(q1 q2 q3 q4) q4 := cos(phi/2), nx4 matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%   function q = zyx2q(4, euler)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------
phi = euler(:,1);
theta = euler(:,2);
psi = euler(:,3);

n = size(euler,1);

% q4: scalar partで計算
q_phi = [zeros(n,2), sin(phi/2), cos(phi/2)];
q_theta = [zeros(n,1), sin(theta/2), zeros(n,1), cos(theta/2)];
q_psi = [sin(psi/2), zeros(n,2), cos(psi/2)];
q = qMult(4,1, q_psi, qMult(4,1, q_theta, q_phi));

q = (scalar == 0) .* [q(:,4), q(:,1:3)] ...
    + (scalar == 4) .* q;

end