function [r, v] = oe2rv(oe)
% -------------------------------------------------------------------------------------
%   transform orbital elements to position and velocity vector
%    Input: oe: orbital elements consist of
%                    a: semimajor axis, km
%                    e: eccentricity
%                    inc: inclination, rad
%                    raan: longitude of ascending node,rad
%                    ome: argument of perigee/longitude of periapsis, rad
%                    f: true anomaly/true longitude/true latitude, rad
%   Output: r: position vector, Nx3 vector, km
%           v: velocity vector, Nx3 vector, km/s
% cf. Vallado, D. A., and McClain, W. D.,
% Fundamentals of Astrodynamics and Applications,
%  note: if true anomaly is unknown, use calcTA.m function to obtain true
%  anomaly.
%  [r v] = oe2rv(oe);
%   (c) 2015 yasuhiro yoshimura
%----------------------------------------------------------------------
orbit_const

small = 1.0e-10;
mu = GE; % ’nSd—Í’è” [km^3/s^2]

a = oe(:,1);
e = oe(:,2);
inc = oe(:,3);
raan = oe(:,4);
ome = oe(:,5);
f = oe(:,6);

% if orbit is circular, ome = 0.0;
ome = ome .* (e > small);

%  if orbit is equatorial, raan = 0.0;
raan = raan .* (inc > small) .* (abs(inc - pi) > small);

p = a .* (1 - e.^2); % semi-latus rectum
p = 0.0001 .* (abs(p) < small) + p .* ( abs(p) >= small);

temp = p ./ (1.0  + e .* cos(f));
% position in orbital plane
r_pqw = [temp .* cos(f), temp .* sin(f), zeros(length(f),1)];
v_pqw = [-sin(f).*sqrt(mu)./sqrt(p), (e+cos(f)) .* sqrt(mu) ./ sqrt(p), zeros(length(f),1)];

% transformation to IJK by quaternion
q = zxz2q(4,[raan, inc, ome]); % quaternion from IJK to PQW
q = qInv(4, q);% quaternion from PQW to IJK
r = qRotation(4, r_pqw, q); % Nx3 matrix
v = qRotation(4, v_pqw, q); % Nx3 matrix

end