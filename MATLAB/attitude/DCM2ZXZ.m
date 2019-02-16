function Euler = DCM2ZXZ(R)
%  2012/2/20 yy Rotation matrix to ZXZ Euler angles
%  input : Rotation matrix from inertial coordinate to body-fixed one
%  output: ZXZ euler angles(3x1 vector), [theta1, theta2, theta3] [rad]
% ----------------------------------------------------

% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i

% ZXZ Euler angles
% Euler[theta1 (first rotation); theta2 (second rotation); theta3 (third rotation)]


theta2 = acos(R(3,3));

sig = sign(sin(theta2));

if (abs(sin(theta2)) < 1e-6)
    if ( R(3,3) >= 0)
        temp = atan2(R(1,2)-R(2,1), R(1,1)+R(2,2));
        theta3 = 0.0; % gimbal lock‚È‚Ì‚Å“K“–‚ÉŒˆ‚ß‚é
        theta1 = temp - theta3;
    else
        temp = atan2(R(1,2)+R(2,1), R(1,1)-R(2,2));
        theta3 = 0.0;
        theta1 = temp + theta3;
    end
else
    theta3 = atan2(sig*R(1,3), sig*R(2,3));
    theta1 = atan2(sig*R(3,1), -sig*R(3,2));
end
Euler = [theta1
    theta2
    theta3];


end