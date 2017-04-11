% -------------------------------------------------------------------------------------
%   Initial condition for orbit Control in Simulink
%   2015/11/13 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files: eulerEom.m
%-------------------------------------------------------------------------------------

clc
clear variables
close all

constants;

% 	/*
%  	*   read TLE
%  	*/
tleName = 'idea.txt';
satName = 'idea';

fp = fopen(tleName,'r');
if(fp == -1)
    error('Cannot open file');
end

[jDay, orbEle] = TLE2Oe(fp, satName);

semi_a  = orbEle(1) * 1000;      % semi-major axis, m
e  = orbEle(2);                  % eccentricity
i  = orbEle(3);                  % inclination, rad
W  = orbEle(4);                  % longitude of the ascending node, rad
ww = orbEle(5);                  % argument of perigee, rad
M  = orbEle(6);                  % mean anomaly
n  = sqrt (GE / semi_a^3);       % mean motion
p  = semi_a * (1.0 - e^2);
h  = sqrt(GE * p);

year = 2016;
day  = 306.00;
day = 365 + 306; % days since Jan 1, 2015 for magnetic field model



% 	/*
%  	*   initial state
%  	*/

ini_pos = [6.6428e+3 * 10^3     % x, [m]
    1.9679e+3 * 10^3
    0.0 * 10^3];

ini_vel = [  0.3023 * 10^3           % vx, [m/s]
    -1.0205 * 10^3
    7.5776 * 10^3];

