function [dcm,  eps_a, deps, dpsi]= earthNutation(jd)
% ----------------------------------------------------------------------
%   calculate the Earth nutation
%    20170310  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note: —vŠm”F
%   cf:
%   revisions;
%
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

SEC2RAD = 1 / 3600 * pi / 180;
T = (jd - 2451545.0) / 36525.0;

F   = ( 335778.877 + 1739527263.137 * T - 13.257 * T^2 + 0.011 * T^3 ) * SEC2RAD;
D   = (1072261.307 + 1602961601.328 * T -  6.891 * T^2 + 0.019 * T^3 ) * SEC2RAD;
Omg = ( 450160.280 -    6962890.539 * T +  7.455 * T^2 + 0.008 * T^3 ) * SEC2RAD;

eps_a = 84381.448 - 46.8150 * T - 0.00059 * T^2 + 0.001813 * T^3;

dpsi  = (-17.1996 - 0.01742 * T) * sin(Omg);
deps  = (  9.2025 + 0.00089 * T) * cos(Omg);

dpsi = dpsi + ( 0.2062 + 0.00002 * T) * sin(2.0 * Omg);
deps = deps + ( 0.5736 - 0.00031 * T) * cos(2.0 * (F-D+Omg));
dpsi = dpsi + (-1.3187 - 0.00016 * T) * sin(2.0 * (F-D+Omg));

dpsi = dpsi + (-0.2274 - 0.00002 * T) * sin(2.0 * (F+Omg));
deps = deps + ( 0.0977 - 0.00005 * T) * cos(2.0 * (F+Omg));

eps_a = eps_a * SEC2RAD;
dpsi  = dpsi * SEC2RAD;
deps  = deps * SEC2RAD;

R1 = DCM1axis(1, -eps_a - deps);
R2 = DCM1axis(3, -dpsi);
R3 = DCM1axis(1, eps_a);

dcm = R1 * R2 * R3;

end