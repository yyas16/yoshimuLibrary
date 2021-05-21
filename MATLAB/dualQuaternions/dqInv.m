function dq_inv = dqInv(scalar, dq)
% -------------------------------------------------------------------------------------
%   dual quaternion inversion
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           dq = dual quaternion to be inverted, Nx8 matrix (real, dual)
%   Output: q^\ast Nx8 matrix
%    function dq_inv = dqInv(scalar, dq)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------
if iscolumn(dq) % transform to row vector
    dq = dq';
end

dq_inv = (scalar == 0 ) .* [dq(:,1) -dq(:,2:4) dq(:,5) -dq(:,6:8)] ...
    + (scalar == 4) .* [-dq(:,1:3) dq(:,4) -dq(:,5:7) dq(:,8)];

end