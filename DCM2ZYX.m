function Euler = DCM2ZYX(R)
% ----------------------------------------------------------------------
%    Rotation matrix to ZYX Euler angles
%    20160606  y.yoshimura
%    Inputs: Rotation matrix from inertial coordinate to body-fixed one
%   Outputs: ZYX euler angles(3x1 vector), [phi, theta, psi] [rad]
%   Euler[phi (around z-axis); theta (around y-axis); psi (around x-axis)]
%   related function files:
%   note:% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i
%   cf:
%   revisions;
%
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

% ZYX Euler angles

psi = atan2(R(2,3), R(3,3));
phi = atan2(R(1,2), R(1,1));

temp = sqrt(R(1,1)^2 + R(1,2)^2);
theta   = atan2(-R(1,3), temp);

Euler = [phi; theta; psi]; % [rad]

end