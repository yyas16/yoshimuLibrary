function [figPos, width, height] = calcFigPos(m, n)
% -------------------------------------------------------------------------------------
%   m x nÅ@Ç…figureÇï¿Ç◊ÇÈÇΩÇﬂÇÃà íuåvéZ
%   2015/10/2 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files:
%-------------------------------------------------------------------------------------

ss = get(0, 'ScreenSize'); % Get a Screen Size, 1x4 vector
ss_width  = ss(3);
ss_height = ss(4);

matFig = [m, n];
nFigs = matFig(1) * matFig(2);

index = 1:nFigs;
index = index';

figPosH = fix((index-0.5) / matFig(1)) * ss_width / matFig(2);
figPosV = ss_height - ss_height / matFig(1) - mod(index-1 , matFig(1)) * ss_height / matFig(1);

[figPos] = [figPosH figPosV];
width  = ss_width;
height = ss_height;