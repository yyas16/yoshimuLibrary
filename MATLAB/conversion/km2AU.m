function AU = km2AU(km)
% ----------------------------------------------------------------------
%    transform km to AU
%    20190214  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
global const

AU = km ./ const.AU_km;

end