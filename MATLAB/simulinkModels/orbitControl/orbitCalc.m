% -------------------------------------------------------------------------------------
%   orbit calculation
%   11月 10, 2015 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files:
%-------------------------------------------------------------------------------------

clc
clear all
close all

AU = 1.496e+8; % 地球と太陽の距離 km
re = 6378;     % km, 地球半径
r_m = 1738.4;  % km, 月の半径
r_em = 384400; % 月と地球の距離, km

mu   = 3.986 * 10^5;             % 地心重力定数 [km^3/s^2]
mu_m = 4.902793 *  10^3;         % 月の重力定数 [km^3/s^2]
mu_s = 1.327 * 10^11;             % 太陽の重力定数 [km^3/s^2]
v_m  = 360 / 27.3 / 24 / 60 / 60; %月の自転速度 [deg/s]
v_m  = v_m * 180.0 / pi; % rad/s

alt = 200; % km 高度

v1 = sqrt(mu / (re + alt)) % 地球周回軌道 [km/s]

% 月から月の周回軌道（こうど100km）へ
alt_m = 100;
a1 = (r_m + r_m+alt_m) / 2;
dV0 = sqrt(mu_m * (2 / r_m - 1 / a1)) % 月の自転速度は小さいので無視

% Encke彗星の軌道要素
perihelion  = 0.339269 * AU % km; 近日点
e_enc = 0.847040;           % 離心率
aperihelion = (1 + e_enc) / (1 - e_enc) * perihelion % 遠日点, km
a_enc = (perihelion + aperihelion) / 2;     % 軌道長半径
n = sqrt(mu_s / a_enc^3)                    % mean motion, rad/s
va = sqrt((1+e_enc)/(1-e_enc)) * a_enc * n  % 近日点での速度


