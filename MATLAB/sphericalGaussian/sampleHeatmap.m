% ----------------------------------------------------------------------
%   Spherical heatmap using spherical Gaussians
%    20210206  y.yoshimura
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

%% input data (files)
N = 1000;
azi_in = 360 .* rand(N,1); % deg
ele_in = 180 .* rand(N,1);

azi_in = deg2rad(azi_in); % deg to rad
ele_in = deg2rad(ele_in);


lam = 100;
[x, y, z, G, v] = sgHeatmap(azi_in, ele_in, lam);



%% show figs
figure
[X, Y, Z] = sphere;
surf(0.9.*X, 0.9.*Y,0.9.*Z); % sphereの半径をちょっと小さくしないとplot点と重なるので．．
hold on
plot3(v(:,1), v(:,2), v(:,3), 'o')
axis equal
xlabel('x'), ylabel('y'), zlabel('z')

figure
colormap jet
surf(x, y, z, G, 'EdgeColor', 'none')
grid on
colorbar
% caxis([0 500]) % colormapの軸幅を変更したいときに設定
axis equal
xlabel('x'), ylabel('y'), zlabel('z')