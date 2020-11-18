% ----------------------------------------------------------------------
%   Check object shape and its normal vectors and other parameters(?)
%    20201112  y.yoshimura
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

%% load object
% いったん変数objに読み込む
obj = read_wobj('boxWingR10.obj');

nCompo = 3; % the number of components, objectによって変更する
sat.vertices = obj.vertices; % all vertices, Nx3 matrix
tmp = [];
for i = 1:nCompo
    tmp = [tmp
        obj.objects(4*i).data.vertices];
end
sat.faces = tmp; % face indices
sat = calcArea_obj(sat);  % face areas
sat = calcNormal_obj(sat); % face normal vectors
sat.Ca = ones(length(sat.faces),1) .* obj.material(3).data(1); % objファイルの定義はcolorだが，とりあえず
sat.Cd = ones(length(sat.faces),1) .* obj.material(4).data(1);
sat.Cs = ones(length(sat.faces),1) .* obj.material(5).data(1);

disp('number of vertices')
size(sat.vertices) % nVertices
disp('number of faces')
size(sat.faces) % nFaces

%% show object shape (for debug)
figure
patch('Faces',sat.faces,'Vertices',sat.vertices, 'facecolor', [0 0 1]);
hold on
quiver3(sat.pos(:,1), sat.pos(:,2), sat.pos(:,3), ...
    3*sat.normal(:,1), 3*sat.normal(:,2), 3*sat.normal(:,3),'r');
axis equal
grid on
xlabel('x'), ylabel('y'), zlabel('z')