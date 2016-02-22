function dxdt = VSCMGeom(t, x)
% -------------------------------------------------------------------------------------
%   Equations of motion for single VSCMG
%   10ŒŽ 28, 2013 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files: used in VSCMGmain.m
%-------------------------------------------------------------------------------------

global Is Js Jt Jg Iws
global Gs0 Gg Gt0 gamma0
global mode numCMG

% state variables
q0 = x(1);
q1 = x(2);
q2 = x(3);
q3 = x(4);

wx = x(5);
wy = x(6);
wz = x(7);

wVec = [wx; wy; wz];

gamma = [x(8: 7+numCMG)];                % gimbal angle, numCMG x 1 vector
Omega = [x(numCMG + 8: 2 * numCMG + 7)]; % wheel spin rate, numCMG x 1 vector

% update of wheel spin axis, gs
Gs = Gs0 * diag(cos(gamma - gamma0)) + Gt0 * diag(sin(gamma - gamma0)); % 3 x numCMG matrix
Gt = Gs0 * diag(-sin(gamma - gamma0))+ Gt0 * diag(cos(gamma - gamma0)); % 3 x numCMG matrix

ws = Gs' * wVec; % projection of angular rate on gs vector, numCMG x 1 vector
wt = Gt' * wVec;
wg = Gg' * wVec;
%------Equations of Motion---------------------



%--Quaternion-----------------
qMat = 1.0 / 2.0 .* [-q1 -q2 -q3
    q0 -q3 q2
    q3 q0 -q1
    -q2 q1 q0];

% control input, d(gamma)/dt, d(Omega)/dt
u = [0.1 .* (wt .* Iws .* Omega);
    0.01 .* (Iws .* ws)];




u(1:numCMG) = u(1:numCMG) .* (mode == 0);
u(1+numCMG: 2*numCMG) = u(1+numCMG: 2*numCMG) .* (mode == 0 || mode == 1);

dgamma = u(1:numCMG);           % numCMG x1 vector
dOmega = u(numCMG+1:2*numCMG);  % numCMG x1 vector

L       = zeros(3,1);
ddgamma = zeros(numCMG,1);


taus = [Js .* (dOmega + dgamma .* wt) - (Jt - Jg) .* wt .* dgamma];
taut = [Js .* (Omega + ws) .* dgamma - (Jt + Jg) .* ws .* dgamma + Js .* Omega .* wg];
taug = [Jg .* ddgamma - Js .* Omega .* wt];    

I = Is;
for i = 1:numCMG
I = I + Js(i) * Gs(:,i) * Gs(:,i)' + Jt(i) * Gt(:,i) * Gt(:,i)' + Jg .* Gg(:,i) * Gg(:,i)';
end

%------->state variables [q0, q1, q2, q3, wx, wy, wz, gamma, Omega]
dxdt = [ qMat * wVec
    I^(-1) * (-cross(wVec, (I * wVec)) - Gs * taus - Gt * taut - Gg * taug + L)
    u
    ];

