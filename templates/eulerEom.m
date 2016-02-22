function dxdt = eulerEom(t, x)
% -------------------------------------------------------------------------------------
%   Equations of motion for rigid body
%   12ŒŽ 2, 2013 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files: used in eulerMain.m
%-------------------------------------------------------------------------------------

global MOI

% state variables
q0 = x(1);
q1 = x(2);
q2 = x(3);
q3 = x(4);

wx = x(5);
wy = x(6);
wz = x(7);

wVec = [wx; wy; wz];



%------Equations of Motion---------------------

%--Quaternion-----------------
qMat = 1.0 / 2.0 .* [-q1 -q2 -q3
    q0 -q3 q2
    q3 q0 -q1
    -q2 q1 q0];

% control inputs
u = [0.0
    0.0
    0.0];

u = (- 4.*wVec + 2.*[q1; q2; q3]);
u = u./ norm(u) .* 1e-4;
%------->state variables [q0, q1, q2, q3, wx, wy, wz]
dxdt = [ qMat * wVec
    -MOI^(-1) * cross(wVec, (MOI * wVec)) + MOI^(-1) * u];

