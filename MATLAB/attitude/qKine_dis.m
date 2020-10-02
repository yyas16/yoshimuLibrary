function q_out = qKine_dis(scalar, q_in, w, dt)
% ----------------------------------------------------------------------
%   discrete kinematic equation using quaternions
%    20200901  y.yoshimura
%    Inputs: scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q, quaternions, 1x4 vector
%           w, angular rate, rad/s, 1x3 vector
%           dt, time step for propagation, s
%   Outputs: q_out, quaternion at (t+dt), 1x4 vector
%   related function files:
%   note:
%   cf:
%   revisions;
% function qKine_dis = qKine_dis(scalar, q, w, dt)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

q_in = q_in(:);
w = w(:);

q = (scalar == 0) .* [q_in(2); q_in(3); q_in(4); q_in(1)] ...
    + (scalar == 4) .* q_in;

% scalar == 4の定義で計算
psi = sin(0.5 * dt * norm(w)) .* w ./ norm(w);
mat = [cos(0.5*norm(w)*dt).*eye(3)-skew(psi) psi
    -psi' cos(0.5*norm(w)*dt)];

q_tmp = mat * q;

q_out = (scalar == 0) .* [q_tmp(4), q_tmp(1), q_tmp(2), q_tmp(3)] ...
    + (scalar == 4) .* q_tmp';

end