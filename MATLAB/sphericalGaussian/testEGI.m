% ----------------------------------------------------------------------
%
%    20210316  y.yoshimura
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

%% laod object
% いったん変数objに読み込む
obj = read_wobj('oneBoxWingFine.obj');
nCompo = 2; % the number of components, objectによって変更する
sat.vertices = obj.vertices; % all vertices, Nx3 matrix
tmp = [];
for i = 1:nCompo
    tmp = [tmp
        obj.objects(4*i).data.vertices];
end
sat.faces = tmp; % face indices
[sat.area, sat.pos] = calcArea_obj(sat);  % face areas

[sat.normal] = calcNormal_obj(sat); % face normal vectors
sat.Ca = ones(length(sat.faces),1) .* obj.material(3).data(1); % objファイルの定義はcolorだが，とりあえず
sat.Cd = ones(length(sat.faces),1) .* obj.material(4).data(1);
sat.Cs = ones(length(sat.faces),1) .* obj.material(5).data(1);

%% show object shape (for debug)
figure
patch('Faces',sat.faces,'Vertices',sat.vertices, 'facecolor', [0 0 1]);
alpha(0.4)
axis equal
grid on
xlabel('x'), ylabel('y'), zlabel('z')
view([28 40])

%% EGI mapping
% facetの法線ベクトルからazi, eleを計算．
[azi, ele, ~] = cart2sph(sat.normal(:,1), sat.normal(:,2), sat.normal(:,3));
ele = pi/2 - ele; % elevation angleを+z軸からの角度に変換

lam = 50; % sharpness．heatmapでいう分割数に近しい存在
[x, y, z, G, v] = sgHeatmap(azi, ele, lam);

%% show figs
figure
colormap jet
surf(x, y, z, G./max(G), 'EdgeColor', 'none')
grid on
colorbar
% caxis([0 500]) % colormapの軸幅を変更したいときに設定
axis equal
xlabel('x'), ylabel('y'), zlabel('z')


%% rotation test
phi = 0:0.1:2*pi;
for k = 1:length(phi)
    for i = 1:size(x,1)
        for j = 1:size(x,2)
            tmp = DCM1axis(3, phi(k)) * [x(i,j); y(i,j); z(i,j)];
            xNew(i,j,k) = tmp(1);
            yNew(i,j,k) = tmp(2);
            zNew(i,j,k) = tmp(3);
        end
    end
end


figure
colormap jet
grid on
colorbar
% caxis([0 500]) % colormapの軸幅を変更したいときに設定
axis equal
xlabel('x'), ylabel('y'), zlabel('z')
rotS = surf(xNew(:,:,1), yNew(:,:,1), zNew(:,:,1), G./max(G), 'EdgeColor', 'none');
hold on
for k = 1:length(phi)
   set(rotS, 'XData', xNew(:,:,k), 'YData', yNew(:,:,k), 'ZData', zNew(:,:,k))%, 'CData', G./max(G));
   pause(0.1);
   drawnow
end
