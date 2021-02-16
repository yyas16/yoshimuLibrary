function output = qMult(scalar, def, q, p)
% -------------------------------------------------------------------------------------
%   Quaternion multiplication
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0; q1; q2; q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1; q2; q3; q4]
%           def, specifies the definition of the product of quaternions
%           def == 0, q \odot p
%           def == 1, q \otimes p
%           q: quaternion, Nx4 matrix (at least 1x4 vector)
%           p: quaternion, Nx4 matrix (at least 1x4 vector)
%           cf. Markley, F. L., and Crassidis, J. L.,
%               Fundamentals of Spacecraft Attitude Determination and Control,
%               New York, NY: Springer, 2014.
%   Output: q * p, Nx4 matrix (at least 1x4 vector)%           
%   qMult(scalar, def, q, p)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------
if iscolumn(q) % transform to row vector
q = q';
end

if iscolumn(p)
p = p';
end

% q \odot p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv + cross(qv,pv)]
% q \otimes p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv - cross(qv,pv)]

% �v�Z��4xN matrix�ɂ��čs���D
q = q';
p = p';

if (scalar == 0)
    
    q0 = q(1,:);
    q1 = q(2,:);
    q2 = q(3,:);
    q3 = q(4,:);
    qv = [q1; q2; q3];
    
    p0 = p(1,:);
    p1 = p(2,:);
    p2 = p(3,:);
    p3 = p(4,:);
    pv = [p1; p2; p3];
    
    output = (def == 0) .* [q0 .* p0 - dot(qv, pv, 1)
        q0 .* pv + p0 .* qv + cross(qv, pv)] ...
        + (def == 1) .* [q0 .* p0 - dot(qv, pv, 1)
        q0 .* pv + p0 .* qv - cross(qv, pv)];
    
    output = output';
    
    %     ��������ver
    %     output = (def == 0) .*   [q0 -q1 -q2 -q3
    %         q1 q0 -q3 q2
    %         q2 q3 q0 -q1
    %         q3 -q2 q1 q0 ] * [p0; p1; p2; p3]...
    %         + (def == 1) .* [q0 -q1 -q2 -q3
    %         q1 q0 q3 -q2
    %         q2 -q3 q0 q1
    %         q3 q2 -q1 q0 ] * [p0; p1; p2; p3];
    
else % (scalar == 4)
    q1 = q(1,:);
    q2 = q(2,:);
    q3 = q(3,:);
    q4 = q(4,:);
    qv = [q1; q2; q3];
    
    p1 = p(1,:);
    p2 = p(2,:);
    p3 = p(3,:);
    p4 = p(4,:);
    pv = [p1; p2; p3];
    
    output = (def == 0) .* [q4 .* pv + p4 .* qv + cross(qv,pv)
        q4 .* p4 - dot(qv, pv, 1)] ...
        + (def == 1) .* [q4 .* pv + p4 .* qv - cross(qv,pv)
        q4 .* p4 - dot(qv, pv, 1)];
    
    output = output';
    
    %     ��������ver
    %     output = (def == 0) .* [q4 -q3 q2 q1
    %         q3 q4 -q1 q2
    %         -q2 q1 q4 q3
    %         -q1 -q2 -q3 q4] * [p1; p2; p3; p4]...
    %         + (def == 1) .* [ q4 q3 -q2 q1
    %         -q3 q4 q1  q2
    %         q2 -q1 q4 q3
    %         -q1 -q2 -q3 q4] * [p1; p2; p3; p4];
    
end