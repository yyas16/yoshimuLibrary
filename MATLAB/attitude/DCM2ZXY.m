function Euler = DCM2ZXY(R)
% ----------------------------------------------------------------------
%    Rotation matrix to ZYX Euler angles
%    20160606  y.yoshimura
%    Inputs: Rotation matrix from inertial coordinate to body-fixed one
%   Outputs: ZXY euler angles(1x3 vector), [phi, theta, psi] [rad]
%   Euler[phi (around z-axis); theta (around x-axis); psi (around y-axis)]
%   related function files:
%   note:% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i
%   cf:
%   revisions;
%
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

% ZXY Euler angles

phi = atan2(-R(2,1), R(2,2));
psi = atan2(-R(1,3), R(3,3));

cosTheta = -R(1,3) / sin(psi);
theta   = atan2(R(2,3), cosTheta);

Euler = [phi theta psi]; % [rad]

end