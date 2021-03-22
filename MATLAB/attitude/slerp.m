function qt = slerp(t, scalar, q1, q2)
% ----------------------------------------------------------------------
%   Spherical Linear Interpolation of quaternions (slerp)
%    20210223  y.yoshimura
%    Inputs: t: normalized time, i.e., 0 <= t <= 1
%            scalar: specifies the definition of the quaternion
%            scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%            scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]         
%            q1: starting quaternion, 1x4
%            q2: ending quaternion, 1x4
%   Outputs: qt: interpolated quaternions, Nx4
%   related function files:
%   note:
%   cf:
%   revisions;
%   function qt = slerp(t, scalar, q1, q2)
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

t = t(:); % column vector

qtmp = qMult(scalar, 0 , qInv(scalar,q1), q2);

eTheta = (scalar == 0) .* acos(qtmp(1)) ...
    + (scalar == 4) .* acos(qtmp(4)); % Euler angle of rotation
eTheta = eTheta * 2;
eAxis =  (scalar == 0) .* qtmp(2:4) ... 
    + (scalar == 4) .* qtmp(1:3);
eAxis = eAxis ./ sin(eTheta/2); % Euler axis of rotation


q1tmp = kron(ones(length(t),1), q1); % Nx4

qt = (scalar == 0) .* qMult(scalar, 0, q1tmp, [cos(t.*eTheta/2) eAxis.*sin(t.*eTheta/2)]) ...
    + (scalar == 4) .* qMult(scalar, 0, q1tmp, [eAxis.*sin(t.*eTheta/2) cos(t.*eTheta/2)]);

end