% ----------------------------------------------------------------------
%   check and visualize calculation results
%    20210108  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

clc
clear
close all

%% screw motion
% s0 = [0 0 3];
% s = [0 1 0];
% s = s ./ norm(s);
% s_hat = s + cross(s0, s) % dual vector
% 
% d = 2.0;
% theta = deg2rad(30);
% theta_hat = theta + d;
% 
% q_hat_dual = [d/2*cos(theta/2).*s + sin(theta/2).*cross(s0,s) d/2*sin(theta/2)]

eAxis = [0 0 1];
theta = deg2rad(45);
q = [eAxis.*sin(theta/2) cos(theta/2)];

r_i = [0 1 0];
qpos = 0.5 * qMult(4, 0, [r_i, 0],  q)
2*qMult(4, 1, qInv(4,q), qpos)
