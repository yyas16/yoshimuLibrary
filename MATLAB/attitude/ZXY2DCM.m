function dcm = ZXY2DCM(phi, theta, psi)
% ----------------------------------------------------------------------
%   ZXY Euler angles to rotation matrix
%    20200616  y.yoshimura
%    Inputs: phi [rad]: around z-axis
%            theta [rad]: around x-axis
%            psi [rad]: around y-axis
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

dcm = DCM1axis(2,psi) * DCM1axis(1,theta) * DCM1axis(3,phi);


end