function dxdt = attOrbEOM(~, x_)
% ----------------------------------------------------------------------
%   Attitude and Orbit equations of motion with quaternion
%    20201112 y.yoshimura
%    Inputs: t_: time, s
%            x_: state variables
%   Outputs: dxdt
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------
global MOI
global GE

%% state variables and inputs
q1 = x_(1); % vector part
q2 = x_(2);
q3 = x_(3);
q4 = x_(4); % scalar part
q = [q1; q2; q3; q4];
wx = x_(5);
wy = x_(6);
wz = x_(7);
w = [wx; wy; wz];

x = x_(8);
y = x_(9);
z = x_(10);
r = [x; y; z];

vx = x_(11);
vy = x_(12);
vz = x_(13);
v = [vx; vy; vz];

T = zeros(3,1); % external torque
F = zeros(3,1); % external force

 %% equations of motion 
%  quaternion kinematics
dqdt = qKine(4, q, w)'; % 4x1 vector 
dwdt = MOI^(-1) * (cross(-w, MOI*w) + T); % 3x1 vector

% do not rewrite the following script
dxdt = [dqdt
    dwdt 
    v
    -GE ./ norm(r)^3 .* r + F];

end