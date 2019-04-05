function R = ZYZ2DCM(phi, theta, psi)
%  2012/2/20 yy  ZYZ Euler angles to rotation matrix
%  input : ZYZ euler angles(3x1 vector), [phi, theta, psi] [rad]
%  output: Rotation matrix from inertial coordinate to body-fixed one
% ----------------------------------------------------
% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i
% ZYZ Euler angles
% Euler[phi (around z-axis); theta (around y-axis); psi (around z-axis)]
% function R = ZYZ2DCM(phi, theta, psi)

R = [cos(phi)*cos(theta)*cos(psi)-sin(phi)*sin(psi) sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi) -sin(theta)*cos(psi)
    -sin(phi)*cos(psi)-sin(psi)*cos(phi)*cos(theta) cos(phi)*cos(psi)-sin(phi)*sin(psi)*cos(theta) sin(theta)*sin(psi)
    sin(theta)*cos(phi) sin(phi)*sin(theta) cos(theta)];
    

end