
clear all;
close all;

%% 関数の定義
f = (@(x) sqrt(x));     % aの遷移式を定義

%% 関数のプロット
figure(1);
fplot(@(x) f(x), [0,2], 'b'); hold on;
fplot(@(x) x,[0,2], 'k:')

%% 所与の初期値に対するxの変化を計算し，プロット (t=0,1,...,T)
T = 10;     % 計算する期間の最終期を設定
a = zeros(1,T+1);
a(1) = 0.01;    % aの初期値 a(0) を設定

% a(t) を繰り返し計算し，変化を図にプロット
for t=1:T
    a(t+1) = f(a(t)); % a(t) をもとに a(t+1) を計算
    
    figure(1);
    arrow([a(t),a(t)],[a(t),f(a(t))],'Length',8,'Linestyle',':','FaceColor','r');  % a(t)からa(t+1)=sqrt(a(t))を求めるための垂直な矢印を引く．
    arrow([a(t),f(a(t))],[f(a(t)),f(a(t))],'Length',8,'Linestyle','-','EdgeColor','g','FaceColor','g');  % 45度線を使ってa(t+1)を横軸に写すための水平な矢印を引く．
end