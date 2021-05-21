% ----------------------------------------------------------------------
%   1-02 適当な3次元回転行列を設定し，適当な3次元ベクトルbの回転を計算せよ．
%    20210510  y.yoshimura
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

% 3次元ベクトルa
b = [1
    2
    3]; % 横ベクトル（row vector）でもいい
b = b ./ norm(b); % 正規化（しなくてもいい）

%% 回転行列 R
% 問題文はあえて曖昧に書いている．
% 座標系の回転とベクトルの回転の区別がわかって計算しているならどちらでもok
phi = 0.1; % rad, 回転角
theta = 0.2; % rad, 回転角
psi = 0.3; % rad, 回転角

% 座標系の回転
% x軸周り
Rx = [1 0 0
    0 cos(phi) sin(phi)
    0 -sin(phi) cos(phi)];

% y軸周り
Ry = [cos(theta) 0 -sin(theta)
    0 1 0
    sin(theta) 0 cos(theta)];

% z軸周り
Rz = [cos(psi) sin(psi) 0
    -sin(psi) cos(psi) 0 
    0 0 1];

% ３次元回転行列であればどういうものでもok
c = Rx * Ry * Rz * b

%% おまけ 無名関数を使ってみる
DCMx = @(x) [1 0 0
    0 cos(x) sin(x)
    0 -sin(x) cos(x)];

DCMy = @(y)  [cos(y) 0 -sin(y)
    0 1 0
    sin(y) 0 cos(y)];

DCMz = @(z) [cos(z) sin(z) 0
    -sin(z) cos(z) 0 
    0 0 1];

c = DCMx(phi) * DCMy(theta) * DCMz(psi) * b
