% ----------------------------------------------------------------------
%   1-01 適当な2次元回転行列を設定し，適当な2次元ベクトルaの回転を計算せよ．
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

% 2次元ベクトルa
a = [0
    2]; % 横ベクトル（row vector）でもいい
a = a ./ norm(a); % 正規化（しなくてもいい）

% 回転行列 R
% 問題文はあえて曖昧に書いている．
% 座標系の回転とベクトルの回転の区別がわかって計算しているならどちらでもok
phi = 0.3; % rad, 回転角

% 回転行列，ただし座標系の回転
R = [cos(phi) sin(phi)
    -sin(phi) cos(phi)];
b = R * a 

% ベクトルの回転
% 回転行列，ただしベクトルの回転
% R = [cos(phi) -sin(phi)
%     sin(phi) cos(phi)]; 
b = R' * a;