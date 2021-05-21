function [lon, lat, r] = sun(jd, earthVSOP)
% ----------------------------------------------------------------------
%   Calculates Sun's geocentric longitude, latitude, and
%   distance for a given Julian date. referred to the mean
%   ecliptic and equinox of date.
%    20190214  y.yoshimura
%    Inputs: (jd): Julian day number.
%            earthVSOP: the coefficients of earth VSOP87
%   Outputs: lon: Sun's geocentric longitude, rad
%            lat: Sun's geocentric latitude, rad
%            r: Sun's geocentric distance, AU
%   related function files:
%   note:
%   cf: AstroLib/VSOP87.c (confirmed)
%   and, Jean Meeus, "Astronomical Algorithms, 2nd edition", p.166 and
%                p. 217.  To obtain the geocentric longitude and latitude of
%                the Sun, add 180 (deg) to Earth's heliocentric longitude and
%                change the sign of Earth's heliocentric latitude.
%   revisions;
%   function [l, b, r] = sun(jd, earthVSOP)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
global const

% earth's heliocentric longitude, latitude, and distance
[lon, lat, r] = earthVSOP87(jd, earthVSOP);

lon = lon + pi;
lat = -1 .* lat;

[~, ~, ~, eta, p_ini, p] = precession(const.J2000, jd);

A = sin(eta) .* sin(lat) + cos(eta) .* cos(lat) .* sin(p + p_ini - lon);
B = cos(lat) .* cos(p + p_ini - lon);
C = cos(eta) .* sin(lat) - sin(eta) .* cos(lat) .* sin(p + p_ini - lon);

lon = p_ini - atan2(A,B);
lat = asin(C);

end