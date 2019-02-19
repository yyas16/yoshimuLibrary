clc

clear
close all

global F ind

AU = 1.496e+11; % m

ind = 1;
F = struct('cdata',[], 'colormap', []);
figure
axis([-1e+12 1e+12 -1e+12 1e+12 -1e+12 1e+12]);
axis  equal
for i = 0:0.1:2*pi
    drawEarth(i);
%     hold on
%     drawSun(i);
end

% fig = figure;
% movie(fig,F,1) % movie