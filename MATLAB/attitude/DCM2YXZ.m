function YXZ = DCM2YXZ(R)
% ----------------------------------------------------------------------
%   Euler angles from DCM
%    20190405  y.yoshimura
%    Inputs: R: DCM from inertial frame to body-fixed frame, 3x3
%   Outputs: YXZ Euler angles
% % [phi (around y-axis); theta (around x-axis); psi (around z-axis)]
%   related function files:
%   note:
%   cf:
%   revisions;
%   function YXZ = DCM2YXZ(R)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

phi = atan2(R(3,1), R(3,3));
psi = atan2(R(1,2), R(2,2));
theta = asin(-R(3,2));

YXZ = [phi, theta, psi];

end