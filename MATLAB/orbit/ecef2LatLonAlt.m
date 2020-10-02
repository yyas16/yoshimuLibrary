function [lat, lon, alt] = ecef2LatLonAlt(r)
% -------------------------------------------------------------------------------------
%   calculate geodetic longitude, latitude, and altitude above the sea from
%   position vector @ ECEF
%   3ŒŽ 14, 2016 yasuhiro yoshimura
%    Input: r: position vector@ECEF, km, nx3 vector
%   Output: [geodetic latitude, longitue, altitude], [rad, rad, km],
%   nx1, nx1, nx1 vectors
%   cf. Fundamentals of Astrodynamics and Applications, 3.4.4, p.169
%   related function files:
%-------------------------------------------------------------------------------------

% constants and parameters for iteration
% Re = 6378.137; % Earth radius, km
load('orbit_const.mat', 'RE');
e2 = 0.006694385000;

small = 1e-6; % tolerance
iterMax = 10; % itermation max

n_ = size(r,1);
r_norm = vecnorm(r,2,2);
r_IJ = sqrt(r(:,1).^2 + r(:,2).^2); % nx1 vector

% calc longitude
lon = (r(:,3) ./ abs(r(:,3)) .* 0.5 * pi) .* (abs(r_IJ) < small) ... % near pole
    + atan2(r(:,2), r(:,1)) .* (abs(r_IJ) >= small);

% calc geodetic latitude
lat_temp  = asin(r(:,3) ./ r_norm);

for j = 1:n_
    old_delta = lat_temp(j) + 10.0;  % initialization
    i = 0;
    while((abs(old_delta - lat_temp(j)) >= small) && (i < iterMax))
        old_delta = lat_temp(j);
        c = RE ./ (sqrt(1.0 - e2 * sin(lat_temp(j))^2));
        
        lat_temp(j) = atan((r(j,3) + c * e2 * sin(lat_temp(j))) / r_IJ(j));
        i = i + 1;
    end    
end

lat = lat_temp;

% calc altitude
C = RE ./ (sqrt(1.0 - e2 .* sin(lat).^2));
alt = (r_IJ ./ cos(lat) - C) .* ((pi * 0.5 - abs(lat)) > pi / 180.0)...
    + (r(:,3) ./ sin(lat) -  C .* (1.0 - e2)) .* ((pi * 0.5 - abs(lat)) <= pi / 180.0); % near pole

end