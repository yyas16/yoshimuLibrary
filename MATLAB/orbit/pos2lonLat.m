function [lon, lat, r] = pos2lonLat(pos)
% ----------------------------------------------------------------------
%   transform Cartesian position(x,y,z) to longitude, latitude, and distance
%    20190214  y.yoshimura
%    Inputs: pos, nx3 matrix
%   Outputs: lon: longitude, [rad], nx1 vector
%            lat: latitude, [rad], nx1 vector
%            r: distance, [the same unit of pos] nx1 vector
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

lon = atan2(pos(:,2), pos(:,1));

tmp = vecnorm(pos(:,1:2), 2, 2); % cos(lat) vector
lat = atan2(pos(:,3), tmp);

r = vecnorm(pos, 2, 2);

end