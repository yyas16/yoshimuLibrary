function qKine = qKine(scalar, q, w)
% ----------------------------------------------------------------------
%   kinematic equation using quaternions
%    20200901  y.yoshimura
%    Inputs: scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q, quaternions, 1x4 vector
%           w, angular rate, rad/s, 1x3 vector
%   Outputs: qKine, kinematic equation, 1x4 vector
%   related function files:
%   note:
%   cf:
%   revisions;
%   function qKine = qKine(scalar, q, w)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

q = q(:);
wx = w(1);
wy = w(2);
wz = w(3);

if (scalar == 0)
    mat = [0 -wx -wy -wz
        wx 0 wz -wy
        wy -wz 0 wx
        wz wy -wx 0];
    qKine = 0.5 .* mat * q;
    
    qKine = qKine';
    
elseif (scalar == 4)
    mat = [0 wz -wy wx
        -wz 0  wx wy
        wy -wx 0 wz
        -wx -wy -wz 0];
    qKine = 0.5 .* mat * q;
    
    qKine = qKine';
    
else
    error('definition of quaternions is unclear');
    
end


end