function DCM = NED2ECEF(lon, lat)
% ----------------------------------------------------------------------
%   DCM from NED coordinate to ECEF coordiante
%    20190228  y.yoshimura
%    Inputs: lon, longitude, rad
%            lat, latitude, rad
%   Outputs: DCM, directional cosine matrix from NED coordinate to ECEF coordiante
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
DCM = ZYX2DCM(lon, -(pi/2 + lat), 0)';
