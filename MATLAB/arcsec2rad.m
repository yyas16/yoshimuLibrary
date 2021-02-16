function rad = arcsec2rad(sec)
% ----------------------------------------------------------------------
%   arcsecond to radians
%    20210215  y.yoshimura
%    Inputs: sec, arcsec
%   Outputs: rad, radiians
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

rad = sec .* 1 ./ 3600 .* pi ./ 180;


end