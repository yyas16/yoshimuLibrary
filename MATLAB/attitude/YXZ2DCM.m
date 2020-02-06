function R = YXZ2DCM(phi, theta, psi)
%  2012/2/20 yy  YXZ Euler angles to rotation matrix
%  input : YXZ euler angles(3x1 vector), [phi, theta, psi] [rad]
%  output: Rotation matrix from inertial coordinate to body-fixed one
% ----------------------------------------------------
% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i
% ZYX Euler angles
% Euler[phi (around y-axis); theta (around x-axis); psi (around z-axis)]
% function R = YXZ2DCM(phi, theta, psi)

% R = [sin(theta)*sin(psi)*sin(phi)+cos(psi)*cos(phi) cos(theta)*sin(psi) sin(theta)*sin(psi)*cos(phi)-cos(psi)*sin(phi)
%     sin(theta)*cos(psi)*sin(phi)-sin(psi)*cos(phi) cos(theta)*cos(psi) sin(theta)*cos(psi)*cos(phi)+sin(psi)*sin(phi)
%     cos(theta)*sin(phi) -sin(theta) cos(theta)*cos(phi)];


R = DCM1axis(3,psi) * DCM1axis(1,theta) * DCM1axis(2,phi);

end