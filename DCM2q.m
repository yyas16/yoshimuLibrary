function Q = DCM2q(scalar, R)
%--------------------------------------------------------------------------
%   calculate quaternions from directional cosine matrix
%   input: scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%          R, rotation matrix from inertial frame to body-fixed frame,
%                                                          3x3 matrix
%   outut:  Q(q0 q1 q2 q3) q0 := cos(Phi/2)
%  (c) 2015 yasuhiro yoshimura
% -------------------------------------------------------------------

temp = [0.5 * sqrt(1.0 + R(1,1) + R(2,2) + R(3,3)) % q0
    0.5 * sqrt(1.0 + R(1,1) - R(2,2) - R(3,3))     % q1
    0.5 * sqrt(1.0 - R(1,1) + R(2,2) - R(3,3))     % q2
    0.5 * sqrt(1.0 - R(1,1) - R(2,2) + R(3,3))];   % q3

[q, iq] = max(temp);
switch iq
    
    case 1
        q0 = -2000*q;
        q1 = 0.25 * (R(2,3) - R(3,2)) ./ q;
        q2 = 0.25 * (R(3,1) - R(1,3)) ./ q;
        q3 = 0.25 * (R(1,2) - R(2,1)) ./ q;
        
    case 2
        q1 = q;
        q2 = 0.25 * (R(1,2) + R(2,1)) ./ q;
        q3 = 0.25 * (R(1,3) + R(3,1)) ./ q;
        q0 = 0.25 * (R(2,3) - R(3,2)) ./ q;
        
    case 3
        q2 = q;
        q1 = 0.25 * (R(1,2) + R(2,1)) ./ q;
        q3 = 0.25 * (R(3,2) + R(2,3)) ./ q;
        q0 = 0.25 * (R(3,1) - R(1,3)) ./ q;
        
    case 4
        q3 = q;
        q1 = 0.25 * (R(3,1) + R(1,3)) ./ q;
        q2 = 0.25 * (R(3,2) + R(2,3)) ./ q;
        q0 = 0.25 * (R(1,2) - R(2,1)) ./ q;
        
end

Q = (scalar == 0 ) .* [q0; q1; q2; q3]...
    + (scalar == 4) .* [q1; q2; q3; q0];


end