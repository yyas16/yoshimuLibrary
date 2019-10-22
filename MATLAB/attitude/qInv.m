function q_inv = qInv(scalar, q)
% -------------------------------------------------------------------------------------
%   Quaternion multiplication
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q = quaternion to be inverted, Nx4 matrix
%   Output: q^\ast Nx4 matrix
%    q_inv = qInv(scalar, q)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------
if iscolumn(q) % transform to row vector
q = q';
end


q_inv = (scalar == 0 ) .* [q(:,1) -q(:,2) -q(:,3) -q(:,4)] ...
    + (scalar == 4) .* [-q(:,1) -q(:,2) -q(:,3) q(:,4)];

end