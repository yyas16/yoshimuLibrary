% ----------------------------------------------------------------------
%   1-05 適当な1000セットのクォータニオン（つまり，1000x4の行列）を準備し，
%   クォータニオン[1/\sqrt{4},1/\sqrt{4},1/\sqrt{4},1/\sqrt{4}]^T 
%   とのクォータニオン積を計算せよ．
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

q = ones(1,4) ./ sqrt(4); % column vectorで定義してもよい

%% 適当な1000セットのクォータニオン
N = 1000;
p = rand(N, 4);
p = p ./ vecnorm(p, 2, 2); % vecnormで2乗ノルムを計算して正規化するのがポイント
pv = p(:,1:3); % pのvector part

%% quaternion multiplication, p x qとする．
% \odotと\otimesの2通りの定義がある
% 自身が使ってる定義の意味等を理解していればどっちでもok
% .*やdot関数の次元（dim）をちゃんと指定することでfor文要らず

% \odotの定義で計算, p \odot q
Q = kron(ones(N,1), q); % qを1000個並べたmatrixを準備．
Qv = Q(:,1:3); % vector partが1から3と仮定

ans = [p(:,4) .* Qv + Q(:,4) .* pv + cross(pv, Qv), Q(:,4) .* p(:,4) - dot(pv, Qv, 2)]

% \otimesの定義で計算, p \otimes q
ans = [p(:,4) .* Qv + Q(:,4) .* pv - cross(pv, Qv), Q(:,4) .* p(:,4) - dot(pv, Qv, 2)]