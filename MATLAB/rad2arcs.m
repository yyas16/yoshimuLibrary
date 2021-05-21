function arcs = rad2arcs(angle)
% ----------------------------------------------------------------------
%   radian to arcsecond
%    20210415  y.yoshimura
%    Inputs:  angle: angle to be transformed, rad
%   Outputs:  arcs: angle, arcsecond
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

arcs = angle .* 648000.0 ./ pi;

end