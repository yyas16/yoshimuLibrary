function DCM = nutation_DCM(jd)
% ----------------------------------------------------------------------
%  calculate nutation rotational matrix from mean to TOD
%    20170310  y.yoshimura
%    Inputs: jd: Julian date at the epoch
%    outputs: DCM: rotational matrix from mean to TOD
%   related function files:
%   note:
%   cf:	Explanatory Supplement to the Astronomical Almanac, p. 114.
%       Satellite Orbits, p.180
%   revisions;
%   function DCM = nutation_DCM(jd)
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

% mean obliquity of the ecliptic at the epoch, rad
e = obliquity(jd);

% dPsi: nutation in longitude, rad
% dEpsi: nutation in obliquity, rad
[dPsi, dEpsi] = nutation(jd);

e_prime = dEpsi + e;

% from mean of date to true of date
DCM = DCM1axis(1, -e_prime) * DCM1axis(3, -dPsi) * DCM1axis(1, e);

end