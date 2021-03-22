function qe = qErr(scalar, q, qd)
% -------------------------------------------------------------------------------------
%  calculate quaternion error
%  qd‚ð‰ñ“]‚³‚¹‚Äq‚Éˆê’v‚³‚¹‚é‚½‚ß‚Ìerror quaternions, qe
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q, current (or true ) quaternion, Nx4 matrix
%           qd, desired (or estimated ) quaternion, Nx4 matrix
%   Output: qd^(-1) \odot  q Nx4 matrix
%           = q \otimes qd^(-1)
%   qErr(scalar, q, qd)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv - cross(qv,pv)]

q_inv_d = qInv(scalar, qd);
qe = qMult(scalar, 1, q, q_inv_d);

end