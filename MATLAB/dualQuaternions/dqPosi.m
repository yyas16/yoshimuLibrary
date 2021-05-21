function r_i = dqPosi(scalar, dq)
% --------------------------------------------------------------------
%   calculate position vector at inertial frame from a dual quaternion
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0; q1; q2; q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1; q2; q3; q4]
%           dq: dual quaternion, Nx8 matrix (at least 1x8 vector)
%   Output: r_i, position vector at inertial frame, Nx3 matrix (at least 1x8 vector)
%   dq = dqPosi(scalar, dq)
%   (c) 2021 yasuhiro yoshimura
%-------------------------------------------------------------------------------------
% transform to row vector
if iscolumn(dq)
    dq = dq;
end

dq_r = dq(:,1:4);
dq_d = dq(:,5:8);

% position vector expressed in inertial frame
tmp = 2.0 .* qMult(scalar, 0, dq_d, qInv(scalar, dq_r)); % Nx4 matrix
r_i = tmp(:,2:4) .* (scalar == 0) + tmp(:,1:3) .* (scalar == 4);

end