function [lat, lon, alt] = ecef2LatLonAlt(r)
% -------------------------------------------------------------------------------------
%   calculate geodetic longitude, latitude, and altitude above the sea from
%   position vector @ ECEF
%   3ŒŽ 14, 2016 yasuhiro yoshimura
%    Input: r: position vector@ECEF, km, 3x1 vector
%   Output: [latitude, longitue, altitude], [rad, rad, km]
%   related function files:
%-------------------------------------------------------------------------------------

Re = 6378.137; % Earth radius, km

small = 1e-6; % tolerance
iterMax = 10;

e2 = 0.006694385000;

r_norm = norm(r);
temp   = sqrt(r(1)^2 + r(2)^2);

lon = (r(3) / abs(r(3)) * 0.5 * pi) * (abs(temp) < small) ...
    + atan2(r(2), r(1)) * (abs(temp) >= small);

lat_temp  = asin(r(3)/r_norm); % temporary
old_delta =  lat_temp + 10.0;  % initialization

i = 0;
while((abs(old_delta - lat_temp) >= small) && (i < iterMax))
    old_delta = lat_temp;
    s_lat     = sin(lat_temp);
    c = Re / (sqrt(1.0 - e2 * s_lat^2));
    
    lat_temp = atan((r(3) + c * e2 * s_lat) / temp);
    i = i + 1;
end

lat = lat_temp;

% // altitude%       s = c * (1.0 - e2);
    alt = (temp / cos(lat) - c) * ((pi * 0.5 - abs(lat)) > pi / 180.0)...
        + (r(3) / sin(lat) -  c * (1.0 - e2)) * ((pi * 0.5 - abs(lat)) <= pi / 180.0);
    
end