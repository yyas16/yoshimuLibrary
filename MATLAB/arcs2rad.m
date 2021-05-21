function rad = arcs2rad(angle)
% ----------------------------------------------------------------------
%   arcsecond to radian
%    20210415  y.yoshimura
%    Inputs: angle: angle to be transformed, arcs
%   Outputs: rad: angle, rad
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

rad = angle .* pi ./ 3600 ./ 180.0;

end