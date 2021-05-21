function [dPsi, dEpsi] = nutation(jd)
% ----------------------------------------------------------------------
%  calculate nutation
%    20170310  y.yoshimura
%    Inputs: jd, Julian day of epoch, day, nx1 vector
%    outputs: dPsi: nutation in longitude, rad
%             dEpsi: nutation in obliquity, rad
%   related function files:
%   note:
%   cf: Explanatory Supplement to the Astronomical Almanac, pp. 109-116.
%       Jean Meeus, "Astronomical Algorithms, 2nd Edition", pp. 143-144.
%   revisions;
%   function [dPsi, dEpsi] = nutation(jd)
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------
global const

T = (jd - const.J2000 ) / 36525.0;

% longitude of the ascending node of the Moon's mean orbit on the ecliptic,
Ome = mod(125.04452 - 1934.136261 .* T + 0.0020708 .* T.^2 + T.^3 ./ 450000.0, 360.0);
Ome = deg2rad(Ome);

% mean longitude of the Sun, deg
L = mod(280.4665 + 36000.7698 .* T, 360.0);
L = deg2rad(L);

% mean longitude of the Moon
L_prime = mod(218.3165 + 481267.8813 .* T, 360.0 );
L_prime = deg2rad(L_prime);

dPsi = -17.20 .* sin(Ome) -1.32 .* sin(2*L) - 0.23 .* sin(2*L_prime) + 0.21 .* sin(2*Ome);
dPsi = arcs2rad(dPsi);

dEpsi = 9.20 .* cos(Ome) + 0.57 .* cos(L) + 0.10 .* cos(L_prime) - 0.09 .* cos(2*Ome);
dEpsi = arcs2rad(dEpsi);

end

