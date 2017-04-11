function [f, r]= calcTA(a, e, M)
% ----------------------------------------------------------------------
%   calculate true nomaly and distance from eccicentricity and mean anomaly
%    20160630  y.yoshimura
%    Inputs:    a, semi-major axis, km
%               e, eccentricity
%               M, mean anomaly, rad
%   Outputs:    f, true anomaly, rad
%               r, distance, km
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

E = calcEccenAnomaly(M, e);
r = a * ( 1 - e * cos(E));

p = a * ( 1 - e^2); % semi-latus
temp = p / r;
f = acos((temp - 1) / e);

end