function beta = calcBetaAngle(jd, Omega, inc)
% ----------------------------------------------------------------------
%
%    20170328  y.yoshimura
%    Inputs: jd: Julian days, day
%            Omega: right ascention of ascending node, rad
%            i: inclination, rad
%   Outputs: beta: beta angle of the Sun, rad
%   related function files:
%   note:
%   cf:Fundamentals of Astrodynamics and Applications, p280
%      and p. 305
%   revisions;
%   
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

T_UT1 = (jd - 2451545.0) / 36525;

% approximation: T_TDB = T_UT1
T_TDB = T_UT1;

[lam M lam_e phi_e] = calcLonSun(jd);

epsi = 23.439291 - 0.0130042 * T_TDB;
epsi = rem(epsi, 360); % deg
epsi = deg2rad(epsi);  % rad

sinBeta = sin(epsi) * cos(inc) * sin(lam_e) ...
    - cos(epsi) * sin(inc) * cos(Omega) * sin(lam_e) ...
    + sin(inc) * sin(Omega) * cos(lam_e);

beta = asin(sinBeta); % rad

end