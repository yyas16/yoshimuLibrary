function DCM =earthPrecession_DCM(jd)
% ----------------------------------------------------------------------
%  calculate the Earth precession
%    20170310  y.yoshimura
%    Inputs: jd: Julian days [day]
%   Outputs: DCM 
%   related function files:
%   note:
%   cf:1	Montenbruck, O., and Gill, E., 
%           Satellite Orbits, Berlin, Heidelberg: 
%           Springer Science & Business Media, 2012. p.176
%   revisions;
%   DCM =earthPrecession(jd)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

SEC2RAD = 1 / 3600 * pi / 180;

T = (jd - 2451545.0) / 36525.0;

zeta  = 2306.2181 * T + 0.30188 * T^2 + 0.017998 * T^3;
theta = 2004.3109 * T - 0.42665 * T^2 - 0.041833 * T^3;
z     = zeta + 0.7928 * T^2 + 0.000205 * T^3;

zeta  = zeta * SEC2RAD;
theta = theta * SEC2RAD;
z     = z * SEC2RAD;

DCM1 = DCM1axis(3, -pi/2 - z);
DCM2 = DCM1axis(1, theta);
DCM3 = DCM1axis(3, pi/2 - zeta);

DCM = DCM1 * DCM2 * DCM3;