function q = GRP2q(scalar, f, a, p)
% ----------------------------------------------------------------------
%   transform generalized Rodrigues parameters to quaternios
%    20190121  y.yoshimura
%    Inputs: scalar, specify the definition of the quaternion
%            scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%            scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%            f, scaling parameter for Rodrigues parameters, scalara
%            a, parameter for Rodrigues parameters, scalar
%            p, generalized Rodrigues parameters, Nx3 matrix
%   Outputs: q, quaternions, Nx4 matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%   function q = GRP2q(scalar, f, a, p)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

q4_num = -a .* vecnorm(p, 2, 2).^2 + f .* sqrt(f^2 + (1-a^2) .* vecnorm(p, 2, 2).^2);
q4_den = f^2 + vecnorm(p, 2, 2).^2;

q4 = q4_num ./ q4_den;

qv = (a + q4) .* p ./ f;

q = (scalar == 0) .* [q4 qv]...
    + (scalar == 0) .* [qv q4];

end