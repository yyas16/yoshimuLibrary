% -------------------------------------------------------------------------------------
%   Initial condition for Attitude Control in Simulink
%   2015/11/13 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files: eulerEom.m
%-------------------------------------------------------------------------------------

clc
clear all
close all

constants

% 	/*
%  	*   initial state
%  	*/

% quaternions, q = [q0 q1 q2 q3] = [cos(theta/2), e*sin(theta/2)]
ini_q = rand(4,1); 
ini_q = ini_q ./ norm(ini_q);

ini_w = [1
    2
    3]; % angular rates, deg/s

ini_w = deg2rad(ini_w);

iniAtti = [ini_q
    ini_w];


