% ----------------------------------------------------------------------
%  drawing test
%    20180809  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

clc
clear
close all

ca = ones(1,6);
length = [1;2;3];
split = [1;1;3];

vert = v4cube(length, split);
face = f4cube(split, ca);

m = 1;
kN = 6;

for k = 1:kN
    figure(4460)
    
    cb     = colorbar;
    h(m,k) = patch('Vertices', vert(k).coord, 'Faces', face(k).make);
    
    set(h(m,k), 'FaceColor', 'b');
    set(h(m,k),'FaceLighting','phong','EdgeLighting','phong');
    axis vis3d equal;
    axis([-5,5, -5, 5, -5,5])
    grid on;
    xlabel('X'),ylabel('Y'),zlabel('Z')
    view(130,30);
    
end