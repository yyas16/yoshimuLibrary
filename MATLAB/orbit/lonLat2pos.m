function pos = lonLat2pos(lon, lat, r)
% ----------------------------------------------------------------------
%   transform longitude, latitude, and distance to Cartesian(x,y,z)
%    20190214  y.yoshimura
%    Inputs: lon: longitude, rad, nx1 vector
%            lat: latitude, rad, nx1 vector
%            r: distance, nx1 vector
%   Outputs: pos: Cartesian position, [the same unit as r], nx3 matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

pos = [r.*cos(lat).*cos(lon) r.*cos(lat).*sin(lon) r.*sin(lat)];

end