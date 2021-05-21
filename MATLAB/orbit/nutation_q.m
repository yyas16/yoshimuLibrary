function q = nutation_q(jd, scalar)
% ----------------------------------------------------------------------
%  calculate nutation quaternion from mean to TOD
%    20170310  y.yoshimura
%    Inputs: jd: Julian date at the epoch
%                scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%                scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%    outputs: q: quaternion from mean to TOD
%   related function files:
%   note:
%   cf:	Explanatory Supplement to the Astronomical Almanac, p. 114.
%       Satellite Orbits, p.180
%   revisions;
%   function q = nutation_q(jd, scalar)
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

% mean obliquity of the ecliptic at the epoch, rad
e = obliquity(jd);

% dPsi: nutation in longitude, rad
% dEpsi: nutation in obliquity, rad
[dPsi, dEpsi] = nutation(jd);

e_prime = dEpsi + e;

% R1 = DCM1axis(1, -e_prime);
% R2 = DCM1axis(3, -dPsi);
% R3 = DCM1axis(1, e);
% dcm = R1 * R2 * R3;

% forth part of quaternion is assumed to be scalar part
% i.e., q = [e.*sin(theta/2); cos(theta/2)]

N = length(jd);

theta = -e_prime;
q1 = [ones(N,1).*sin(theta./2), zeros(N,2), cos(theta./2)];

theta = -dPsi;
q2 = [zeros(N,2), ones(N,1).*sin(theta./2), cos(theta./2)];

theta = e;
q3 = [ones(N,1).*sin(theta./2), zeros(N,2), cos(theta./2)];

tmp_q = qMult(4, 1, q1, qMult(4, 1, q2, q3));

q = (scalar == 4 ) .* tmp_q...
     + (scalar == 0) .* [tmp_q(:,4), tmp_q(:,1), tmp_q(:,2), tmp_q(:,3)];

end