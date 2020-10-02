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

vert = struct;
face = struct;

ca = ones(1,6); % surface optical properties
length = [2;2;3]; % cube length
split = [2;4;3]; % the number of split 

vert = v4cube(vert, 1, length, split);
face = f4cube3(face, 1, split, ca);

m = 1;
kN = 6;

for k = 1:kN
    figure(4460)
    
    cb     = colorbar;
    h(m,k) = patch('Vertices', vert(m,k).coord, 'Faces', face(m,k).make);
    
    set(h(m,k), 'FaceColor', 'b');
    set(h(m,k),'FaceLighting','phong','EdgeLighting','phong');
    axis vis3d equal;
    axis([-5,5, -5, 5, -5,5])
    grid on;
    xlabel('X'),ylabel('Y'),zlabel('Z')
    view(130,30);
    
end

face = calcNormal(vert, face);