function [lam M lam_ecliptic phi_ecliptic] = calcLonSun(jd)
% ----------------------------------------------------------------------
%   calculate the mean longitude of the Sun and other parameters
%    20170328  y.yoshimura
%    Inputs: jd: Julian days
%   Outputs: lam: longitude of the Sun, rad
%            M: mean anomaly of the Sun, rad
%              lam_ecliptic, rad
%              phi_ecliptic, rad
%   related function files:
%   note:
%   cf: Fundamentals of Astrodynamics and Applications, p280
%   revisions;
%   
%   (c) 2016 yasuhiro yoshimura
%   [lam M lam_ecliptic phi_ecliptic] = calcLonSun(jd)
%----------------------------------------------------------------------

T_UT1 = (jd - 2451545.0) / 36525.0;

% approximation: T_TDB = T_UT1
T_TDB = T_UT1;
lam = 280.460 + 36000.771 * T_TDB;
lam = rem(lam, 360); % deg
M   = 357.5291092 + 35999.05034 * T_TDB;
M   = rem(M, 360);  % deg

lam_ecliptic = lam + 1.914666471 * sin(deg2rad(M)) ...
    + 0.019994643 * sin(deg2rad(2*M)); % deg

phi_ecliptic = 0; % deg

lam = deg2rad(lam);
M   = deg2rad(M);
lam_ecliptic = deg2rad(lam_ecliptic);
phi_ecliptic = deg2rad(phi_ecliptic);

end