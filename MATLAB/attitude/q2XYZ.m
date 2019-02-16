function Euler = q2XYZ(q)
%  2012/2/20 yy Quaternion to XYZ Euler angles
%  input: quaternion(nx4 vector) [q0, q1, q2, q3] = [cos(phi/2), sin....]
%  output: XYZ euler angles(nx3 vector), [phi, theta, psi] [rad]
% ----------------------------------------------------

% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i

% XYZ Euler angles
% Euler[phi (around x-axis); theta (around y-axis); psi (around z-axis)]

% R = [q(1)^2 + q(2)^2 - q(3)^2 - q(4)^2, 2*(q(2)*q(3) + q(1)*q(4)), 2*(q(2)*q(4) - q(1)*q(3))
%     2*(q(2) * q(3) - q(1) * q(4)), q(1)^2 - q(2)^2 + q(3)^2 - q(4)^2, 2*(q(3)*q(4) + q(1)*q(2))
%     2*(q(2)*q(4) + q(1)*q(3)), 2*(q(3)*q(4) - q(1)*q(2)), q(1)^2 - q(2)^2 - q(3)^2 + q(4)^2];

R32 = 2.0 * (q(:,3) .* q(:,4) - q(:,1) .* q(:,2));
R33 = q(:,1).^2 - q(:,2).^2 - q(:,3).^2 + q(:,4).^2;
R31 = 2.0 .* (q(:,2) .* q(:,4) + q(:,1) .* q(:,3));
R11 = q(:,1).^2 + q(:,2).^2 - q(:,3).^2 - q(:,4).^2;
R21 = 2.0 .* (q(:,2) .* q(:,3) - q(:,1) .* q(:,4));

phi   = atan2(-R32, R33);
theta = atan2(R31, sqrt(R11.^2 + R21.^2));
psi   = atan2(-R21, R11);

Euler = [phi theta psi]; % [rad]


end