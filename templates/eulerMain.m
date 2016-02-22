% -------------------------------------------------------------------------------------
%   Rigid body rotation
%   12ŒŽ 2, 2013 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files: eulerEom.m
%-------------------------------------------------------------------------------------

clc
clear all
close all

global MOI

MOI = [2.0, 0.0, 0.0
    0.0, 1.4, 0.0
    0.0, 0.0, 1];  % moment of inertia of satellite

% state variables [q0, q1, q2, q3, wx, wy, wz]
ini = [0.0 % q0, scalar part
    1.0    % q1, vector part
    0.0
    0.0
    deg2rad(1.0)    % wx, angular rate
    deg2rad(0.2)
    deg2rad(1.3)];

tspan = [0; 22 * 60 * 60];

[t, y] = ode45(@eulerEom, tspan, ini);

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

figure
plot(time, q0, time, q1, time, q2, time, q3);
legend('q_0', 'q_1', 'q_2', 'q_3');
xlabel('Time[s]'), ylabel('quaternion')
grid on

ZYXeuler = Q2ZYX([q0 q1 q2 q3]);
ZYXeuler = rad2deg(ZYXeuler);
figure
plot(time, ZYXeuler(:,1),time, ZYXeuler(:,2),time, ZYXeuler(:,3))
legend('\phi', '\theta', '\psi');
xlabel('Time[s]'), ylabel('ZYX euler angles[deg]')
grid on


figure
plot(time, rad2deg(wx), time, rad2deg(wy), time, rad2deg(wz));
legend('\omega_x', '\omega_y', '\omega_z');
xlabel('Time[s]'), ylabel('Angular rates [deg/s]')
grid on

% ---- data output -----------
% ZYXeuler = Q2ZYX([q0 q1 q2 q3]);
% ZYXeuler = rad2deg(ZYXeuler);
% gamma    = rad2deg(gamma);
% csvwrite('data.csv', [t, ZYXeuler, gamma])
