function [x, y, z, G, v] = sgHeatmap(azi_in, ele_in, lam)
% ----------------------------------------------------------------------
%   spherical heatmap using spherical Gaussians
%    20210207  y.yoshimura
%    Inputs: azi, azimuth angle, rad, Nx1 vector
%            ele, elevation angle, rad, Nx1 vector, (angle from +z axis)
%            lam, sharpness
%   Outputs: x, y, z: spherical coordinates, NxM matrix
%            G: heatmap values, NxM matrix
%            v: point coordinates on a unit sphere, Nx3 matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------


%% spherical Gaussian計算のための球面座標
azi = 0:deg2rad(1):2*pi;
ele = -pi/2:deg2rad(1):pi/2;
[x_, y_] = meshgrid(azi, ele);
[x, y, z] = sph2cart(x_, y_, 1);


% 3D points on sphere (= lobe axes of spherical Gaussians), Nx3 matrix
v = [cos(azi_in).*sin(ele_in), sin(azi_in).*sin(ele_in), cos(ele_in)];

G = zeros(size(x)); % pre allocaiton

% lam はsharpness, この値を大きくすると粒度を高くできる．100くらいが良さそう．

mu = 1; % amplitude of SG

for i = 1:size(v,1) % このfor文はいつか消したい．
G = G + sg3(x, y, z, v(i,:), lam, mu);
end


end