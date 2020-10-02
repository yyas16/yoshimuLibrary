function p = q2GRP(scalar, f, a, q_in)
% ----------------------------------------------------------------------
%   transform quaternions to generalized Rodrigues parameters
%    20190121  y.yoshimura
%    Inputs: scalar, specify the definition of the quaternion
%            scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%            scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%            f, scaling parameter for Rodrigues parameters, scalara
%            a, parameter for Rodrigues parameters, scalar
%            q, quaternions, Nx4 matrix
%   Outputs: p, generalized Rodrigues parameters, Nx3 matrix
%            
%   related function files:
%   note:
%   cf:
%   revisions;
%   function p = q2GRP(scalar, f, a, q_in)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

q = (scalar == 0) .* [q_in(:,2:4), q_in(:,1)] ...
    + (scalar == 4) .* q_in;
% p = f .* sign(q(:,4)) .* q(:,1:3) ./ (a + abs(q(:,4))) ;
p = f .* q(:,1:3) ./ (a + q(:,4));

end