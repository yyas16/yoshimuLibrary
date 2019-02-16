function Euler = q2ZYX(scalar, q_input)
%--------------------------------------------------------------------
%%   calculate ZYX Euler angles from quaternions
%   input: scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q_input: quaternions nx4 matrix
%  output: ZYX euler angles(nx3 vector), [phi, theta, psi] [rad]
%          phi: 1st rotation   @z-axis
%          theta: 2nd rotation @y-axis
%          psi:   3rd rotation @x-axis
%  (c) 2016 yasuhiro yoshimura
%     function Euler = q2ZYX(def, q)
% -------------------------------------------------------------------

% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i

% ZYX Euler angles
% Euler[phi (around z-axis); theta (around y-axis); psi (around x-axis)]

% R = [q(1)^2 + q(2)^2 - q(3)^2 - q(4)^2, 2*(q(2)*q(3) + q(1)*q(4)), 2*(q(2)*q(4) - q(1)*q(3))
%     2*(q(2) * q(3) - q(1) * q(4)), q(1)^2 - q(2)^2 + q(3)^2 - q(4)^2, 2*(q(3)*q(4) + q(1)*q(2))
%     2*(q(2)*q(4) + q(1)*q(3)), 2*(q(3)*q(4) - q(1)*q(2)), q(1)^2 - q(2)^2 - q(3)^2 + q(4)^2];


% calculate DCM using the definition that q0 = cos(theta/2)
q = (scalar == 0 ) .* q_input...
     + (scalar == 4) .* [q_input(:,4), q_input(:,1), q_input(:,2), q_input(:,3)];

R23 = 2.0 .* (q(:,3) .* q(:,4) + q(:,1) .* q(:,2));
R33 = q(:,1).^2 - q(:,2).^2 - q(:,3).^2 + q(:,4).^2;
R12 = 2.0 .* (q(:,2) .* q(:,3) + q(:,1) .* q(:,4));
R11 = q(:,1).^2 + q(:,2).^2 - q(:,3).^2 - q(:,4).^2;
R13 = 2.0 .* (q(:,2) .* q(:,4) - q(:,1) .* q(:,3));

psi   = atan2(R23, R33);
phi   = atan2(R12, R11);
theta = atan2(-R13, sqrt(R23.^2 + R33.^2));

Euler = [phi theta psi]; % [rad]

end