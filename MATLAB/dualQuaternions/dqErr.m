function dqe = dqErr(scalar, dq, dq_d)
% -------------------------------------------------------------------------------------
%  calculate dual quaternion error
%  dq_dを回転させてdqに一致させるためのerror quaternion, dqe
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           dq, current (or true ) quaternion, Nx4 matrix
%           dqd, desired (or estimated ) quaternion, Nx4 matrix
%   Output: dqe = dqd^(-1) \odot dq, Nx4 matrix
%               = dq \otimes dqd^(-1)
%   dqErr(scalar, dq, dq_d)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv - cross(qv,pv)]

dq_inv_d = dqInv(scalar, dq_d);
dqe = dqMult(scalar, 1, dq, dq_inv_d);

end