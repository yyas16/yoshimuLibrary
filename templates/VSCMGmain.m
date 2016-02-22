% -------------------------------------------------------------------------------------
%   multiple Variable-Speed Control Moment Gyro(VSCMG)の数値シミュレーション
%   10月 28, 2013 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files: VSCMGeom.m
%   cf. Analytical Mechanics of Space Systems second edition
%-------------------------------------------------------------------------------------

clear all
close all

global Is Js Jt Jg Iws
global Gs0 Gg Gt0 gamma0
global mode numCMG

mode   = 0; % 0: VSCMG, 1: CMG, 2:RW
numCMG = 3; % the number of VSCMG 

MOI = [10; 20; 24]; % moment of inertia of satellite including CMG
Is   = diag(MOI);    % inertia tensor
Js  = 3.0 .* ones(numCMG,1);          % moment of inertia of CMG
Jt  = 2.3 .* ones(numCMG,1);
Jg  = 3.4 .* ones(numCMG,1);
Iws = 3.0 .* ones(numCMG,1);

% gimbal angles @ body-fixed frame
Gs0 = [1 0 0 % spin axis, 3 x numCMG matrix
    0 1 0
    0 0 1];
Gg  = [0 0 0 % gimbal axis
    0 0 0
    1 1 1];
Gt0 = cross(Gg, Gs0);

gamma0 = zeros(numCMG, 1); % initial gimbal angle
Omega0 = ones(numCMG, 1);  % initial spin rate

% state variables [q0, q1, q2, q3, wx, wy, wz, gamma, Omega]
ini = [1.0 % q0, scalar part
    0.0    % q1, vector part
    0.0
    0.0
    1.1    % wx, angular rate
    2.2
    4.3
    gamma0    % gamma, gimbal angle
    Omega0];   % Omega, wheel spin rate
    

tspan = [0; 30];

[t, y] = ode45(@VSCMGeom, tspan, ini);

% 
% data handling
% 
time = t;

q0 = y(:,1);
q1 = y(:,2);
q2 = y(:,3);
q3 = y(:,4);

wx = y(:,5);
wy = y(:,6);
wz = y(:,7);

gamma = y(:,8:numCMG+7);
Omega = y(:,numCMG+8: 2.0 * numCMG+7);

figure
plot(time, q0, time, q1, time, q2, time, q3);
legend('q_0', 'q_1', 'q_2', 'q_3');
xlabel('Time[s]'), ylabel('quarternion')
grid on

figure
plot(time, wx, time, wy, time, wz);
legend('\omega_x', '\omega_y', '\omega_z');
xlabel('Time[s]'), ylabel('Angular rates [rad/s]')
grid on

for i = 1:numCMG
figure
plot(time, rad2deg(gamma(:,i)))
xlabel('Time[s]'), ylabel('gimbal angle [deg]')
grid on

figure
plot(time, rad2deg(Omega(:,i)))
xlabel('Time[s]'), ylabel('Wheel spin rate [deg/s]');
grid on
end

% ---- data output -----------
% ZYXeuler = Q2ZYX([q0 q1 q2 q3]);
% ZYXeuler = rad2deg(ZYXeuler);
% gamma    = rad2deg(gamma);
% csvwrite('data.csv', [t, ZYXeuler, gamma])
