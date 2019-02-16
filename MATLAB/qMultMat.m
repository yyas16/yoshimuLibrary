function output = qMultMat(scalar, def, q)
% -------------------------------------------------------------------------------------
%   calculate the quaternion multiplication matrix
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           def, specifies the definition of the product of quaternions
%           def == 0, q \odot 
%           def == 1, q \otimes 
%           cf. Markley, F. L., and Crassidis, J. L.,
%               Fundamentals of Spacecraft Attitude Determination and Control,
%               New York, NY: Springer, 2014.
%   Output: [q *]
%   qMult(scalar, def, q, p)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------


% q \odot p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv + cross(qv,pv)]
% q \otimes p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv - cross(qv,pv)]

if (scalar == 0)
    
    q0 = q(1);
    q1 = q(2);
    q2 = q(3);
    q3 = q(4);
    qv = [q1; q2; q3];
    
    output = (def == 0) .* [q0 -qv'
        qv q0.*eye(3)+skew(qv)] ...
        + (def == 1) .* [q0 -qv'
        qv q0.*eye(3)-skew(qv)];
    
else % (scalar == 4)
    q4 = q(4);
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    qv = [q1; q2; q3];
    
    output = (def == 0) .* [q4.*eye(3)+skew(qv) qv
        -qv' q4] ...
        + (def == 1) .* [q4.*eye(3)-skew(qv) qv
        -qv' q4];
    
end