% ----------------------------------------------------------------------
%   Attitude and Orbit motion for light curves
%    20201112 y.yoshimura
%    Inputs: TLE file for initial condition (orbit)
%   Outputs: var.mat, all variables used
%   related function files: calcABC.m, calcCoeff.m
%   note:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
clc
clear
close all

global MOI % moment of inertia, 3x3 matrix
global jd GE

%% constant parameters
orbit_const
VSOP_const

%% set flags
TLE = 1; % 0: TLE not used, 1: TLE used for initial orbit
model = 0; % 0: box Wing

%% observer position
obs_lon = deg2rad(130.216544); % longitude
obs_lat = deg2rad(33.594649); % latitude
% とりあえず地球半径でobserver position
[obs_pos_ECEF(1), obs_pos_ECEF(2), obs_pos_ECEF(3)] = sph2cart(obs_lon, obs_lat, RE);

%% parameters and initial condition
ini_q = ZYX2q(4, deg2rad([0, 90, 40])); % initial quaternion(q1,q2,q3,q4): q4 is the scalar part
ini_w = [deg2rad(1), deg2rad(2), deg2rad(3)]; % initial angular rate, rad/s

% object position
if TLE == 1
    tle = readTLE('JCSAT2.txt');
else
    %初期値を数値で設定, to be added??
end

[ini_r, ini_v] = oe2rv(tle.oe); % km, km/s
jd = tle.jd; % Julian day

ini_x = [ini_q, ini_w, ini_r, ini_v]; % initial attitude and position
tspan = 0: 60*60*1.0; % s

% Sun position and Observer positions
[l_sun, b_sun, dis_sun] = sun(jd, earthVSOP); % rad, rad, AU
[sun_pos_i(1), sun_pos_i(2), sun_pos_i(3)] = sph2cart(l_sun, b_sun, AU2km(dis_sun)); % km, 1x3 vector

sun_i = sun_pos_i ./ norm(sun_pos_i); % normalized sun directional vector@inertial frame, 1x3
sun_b = q2DCM(4, ini_q) * sun_i'; % normalzied sun directional vector@body-fixed frame
sun_b = sun_b'; % 1x3 vector

%% satellite shape model
if model == 0
    % box-wing
    MOI = diag([80 80 150]);
    sat = readObj('boxWing.obj', 3);    
    
elseif model == 1
    % something you want
    
else
    error('set proper model flag');
end

% observer
q_ECI2ECEF = earthFullRot_q(tle.jd, 0, 4); % quaternion from ECI to ECEF
obs_ECI = qRotation(4, obs_pos_ECEF, qInv(4, q_ECI2ECEF)); % observer position@inertial frame, km, 1x3 vector
obs_rel = obs_ECI - ini_r; % relative position vector from satellite to observer@inertial frame, km, 1x3 vector
obs_b = normRow(qRotation(4, obs_rel, ini_q)); %observer directional vector from satellite@body-fixed frame, 1x3 vector

%% solve ODE
options = odeset('RelTol',1e-8,'AbsTol',1e-10); % お好きに
[t_, x_] = ode45(@attOrbEOM, tspan, ini_x, options);
jd_history = tle.jd + t_ ./ 86400; % Julian day history

%% state variables and inputs
q1 = x_(:,1);
q2 = x_(:,2);
q3 = x_(:,3);
q4 = x_(:,4);
q = [q1 q2 q3 q4]; % Nx4 matrix
w = x_(:,5:7); % Nx3 matrix
r = x_(:,8:10); % Nx3 matrix
v = x_(:,11:13); % Nx3 matrix

% Sun position and Observer positions
clear sun_pos_i % いったんclear
[l_sun, b_sun, dis_sun] = sun(jd_history, earthVSOP);
[sun_pos_i(:,1), sun_pos_i(:,2), sun_pos_i(:,3)] = sph2cart(l_sun, b_sun, AU2km(dis_sun)); % km, Nx3 matrix
sun_rel = sun_pos_i - r; % relative sun position from satellite, km, Nx3 matrix
sun_pos_b = qRotation(4, normRow(sun_rel), q);% sun directional vector from satellite@body-fixed frame, Nx3 matrix

q_ECI2ECEF = earthFullRot_q(jd_history, 0, 4); % quaternion from ECI to ECEF
% observer position@inertial frame, km, Nx3 matrix
obs_ECI = qRotation(4, kron(ones(length(jd_history),1),obs_pos_ECEF), qInv(4, q_ECI2ECEF)); 
% relative observer position from satellite@inertial frame, km, Nx3 matrix
obs_rel = obs_ECI - r;
% relative observer directional (normalized) vectors@body-fixed frame, Nx3 matrix
obs_b = qRotation(4, normRow(obs_rel), q);

%% Light curve
nu = shadow(r, sun_pos_i, RE, RS); % calc shadow
[m_app, sat] = lc_obj(jd_history, q, r, obs_ECI, sat, nu, sun_pos_i); % calc light curves
% d_ = vecnorm(obs_rel.*1000, 2, 2); % relative distance from satellite to observerm, Nx1

%% show figs
figure % satellite position
plot3(r(:,1), r(:,2),r(:,3))
hold on
plot3(obs_ECI(:,1), obs_ECI(:,2),obs_ECI(:,3),'r')
tmp = jd2GMST(jd_history(end),0);
drawEarth(tmp);
axis equal

figure
plot(t_./60, m_app)
xlabel('time [min]'), ylabel('Light curve relative magnitude')
set(gca, 'YDir', 'reverse')

% attitude
figure % quaternion
subplot(4,1,1)
plot(t_,q(:,1))
xlabel('Time [s]'), ylabel('q_1')
subplot(4,1,2)
plot(t_,q(:,2))
xlabel('Time [s]'), ylabel('q_2')
subplot(4,1,3)
plot(t_,q(:,3))
xlabel('Time [s]'), ylabel('q_3')
subplot(4,1,4)
plot(t_,q(:,4))
xlabel('Time [s]'), ylabel('q_4')

figure % angular rate, 
plot(t_, rad2deg(w(:,1))), hold on
plot(t_, rad2deg(w(:,2)))
plot(t_, rad2deg(w(:,3)))
xlabel('Time [s]'), ylabel('angular rate')

