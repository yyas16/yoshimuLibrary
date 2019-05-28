function [l, b, r] = sun(jd, earthVSOP)
% ----------------------------------------------------------------------
%   Calculates Sun's geocentric longitude, latitude, and
%   distance for a given Julian date. referred to the mean
%   ecliptic and equinox of date.
%    20190214  y.yoshimura
%    Inputs: (jd): Julian day number.
%            earthVSOP: the coefficients of earth VSOP87
%   Outputs:(l): Sun's geocentric longitude, in radians.
%           (b): Sun's geocentric latitude, in radians.
%           (r): Sun's geocentric distance, in AU.
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

[l, b, r] = earthVSOP87(jd, earthVSOP);

l = l + pi;
b = -1 .* b;

l = mod(l, 2*pi); % value between 0 and 2*pi

end