function Q = DCM2q(scalar, R)
%--------------------------------------------------------------------------
%   calculate quaternions from directional cosine matrix
%   input: scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%          R, rotation matrix from inertial frame to body-fixed frame,
%                                                          3x3 matrix
%   outut:  Q(q0 q1 q2 q3) q0 := cos(Phi/2)
%   cf. 1	Markley, F. L., ÅgUnit Quaternion from Rotation Matrix,Åh
%           Journal of Guidance Control, and Dynamics, vol. 31, Mar. 2008, 
%           pp. 440?442.
%  (c) 2015 yasuhiro yoshimura
%     function Q = DCM2q(scalar, R)
% -------------------------------------------------------------------

trR =  R(1,1) + R(2,2) + R(3,3); % trace
temp = [R(1,1)
    R(2,2)
    R(3,3)
    trR];

[val, iq] = max(temp);
switch iq
    
    case 1
        x1 = [1 + 2*R(1,1) - trR
            R(1,2) + R(2,1)
            R(1,3) + R(3,1)
            R(2,3) - R(3,2)];
        
        q = x1 ./ norm(x1);
        
    case 2
        x2 = [R(2,1) + R(1,2)
            1 + 2 * R(2,2) - trR
            R(2,3) + R(3,2)
            R(3,1) - R(1,3)];
        
        q = x2 ./ norm(x2);
    case 3
        x3 = [R(3,1) + R(1,3)
            R(3,2) + R(2,3)
            1 + 2 * R(3,3) - trR
            R(1,2) - R(2,1)];
        
        q = x3 ./ norm(x3);
    case 4
        x4 = [R(2,3) - R(3,2)
            R(3,1) - R(1,3)
            R(1,2) - R(2,1)
            1 + trR];
        
        q = x4 ./ norm(x4);
end


Q = (scalar == 0 ) .* [q(4); q(1); q(2); q(3)]...
    + (scalar == 4) .* q;

end