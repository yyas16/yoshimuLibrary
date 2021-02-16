% ----------------------------------------------------------------------
%   sample script to draw Spherical Gaussian
%    20200911  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

clc
clear
close all

%% spherical Gaussian
azi = 0:deg2rad(1):2*pi;
ele = -pi/2:deg2rad(1):pi/2;
[x_, y_] = meshgrid(azi, ele);
[x, y, z] = sph2cart(x_, y_, 1);

figure
xi = [1, 0, 1];
xi = xi ./ norm(xi);
lam = 100;
mu = 1;

colormap bone
for i = 1:size(x,1)
    for j = 1:size(x,2)
        G(i,j) = sg([x(i,j) y(i,j) z(i,j)], xi, lam, mu);
    end
end
surf(x, y, z, G, 'EdgeColor', 'none')
grid on
colorbar
axis equal

figure
colormap bone
G = sg3(x, y, z, xi, lam, 1);
surf(x, y, z, G, 'EdgeColor', 'none')
grid on
colorbar
axis equal

