function nu = shadow(sat_i, sun_i)
% ----------------------------------------------------------------------
%   calculate shadow function
%    20190220  y.yoshimura
%    Inputs: sat_i, satellite position@inertial frame, nx3
%            sun_i, sun position@inertial frame, nx3
%   Outputs: nu, shadow coefficient, nx1 vector
%            nu == 1 sunlit
%            nu == 0 eclipse
%            0< nu <1: partial eclipse
%   related function files:
%   note:
%   cf: Satellite Orbits, Montenbruck, Gill, p.81
%   revisions;
%   function nu = shadow(sat_i, sun_i)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

orbit_const

sun_rel = sun_i - sat_i;
a = asin(RS ./ vecnorm(sun_rel,2,2));
b = asin(RE ./ vecnorm(sat_i, 2, 2));
c = acos(dot(-sat_i,sun_rel,2)./vecnorm(sat_i,2,2)./vecnorm(sun_rel,2,2));

x = (c.^2 + a.^2 - b.^2) ./ (2.*c);
y = sqrt(a.^2 - x.^2);

A = a.^2 .* acos(x./a) + b.^2 .* acos((c-x)./b) - c .* y;

nu = (a + b <= c) .* 1 ... % no occultation
    + (abs(a-b) < c) .* (c < a + b) .* (1 - A ./ pi ./ a.^2)... % partial
    + (c < b - a) .* 0 ... % total occulation
    + (c < a - b) .* (1 - b.^2 ./ a.^2); % maximum

end