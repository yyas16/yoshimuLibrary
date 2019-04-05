function ZYZ = DCM2ZYZ(R)
% ----------------------------------------------------------------------
%   Euler angles from DCM
%    20190405  y.yoshimura
%    Inputs: R: DCM from inertial frame to body-fixed frame, 3x3
%   Outputs: ZYZ Euler angles
% % [phi (around z-axis); theta (around y-axis); psi (around z-axis)]
%   related function files:
%   note:
%   cf:
%   revisions;
%   function ZYZ = DCM2ZYZ(R)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

phi = atan2(R(3,2), R(3,1));
psi = atan2(R(2,3), -R(1,3));
theta = acos(R(3,3));

ZYZ = [phi, theta, psi];

end