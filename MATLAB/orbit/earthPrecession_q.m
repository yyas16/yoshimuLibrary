function q = earthPrecession_q(jd, scalar)
% ----------------------------------------------------------------------
%  calculate the Earth precession
%    20170310  y.yoshimura
%    Inputs: jd, Julian day, day, nx1 vector
%            scalar, quaternion definitions
%            scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%            scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]%   Outputs: DCM 
%   related function files:
%   note:
%   cf:1	Montenbruck, O., and Gill, E., 
%           Satellite Orbits, Berlin, Heidelberg: 
%           Springer Science & Business Media, 2012. p.176
%   revisions;
%   DCM = earthPrecession_q(jd, scalar)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

SEC2RAD = 1 / 3600 * pi / 180;

T = (jd - 2451545.0) / 36525.0;

zeta = 2306.2181 .* T + 0.30188 .* T.^2 + 0.017998 * T.^3;
theta = 2004.3109 .* T - 0.42665 .* T.^2 - 0.041833 * T.^3;
z = zeta + 0.7928 .* T.^2 + 0.000205 * T.^3;

zeta = zeta .* SEC2RAD;
theta = theta .* SEC2RAD;
z = z .* SEC2RAD;

% DCM1 = DCM1axis(3, -pi/2 - z);
% DCM2 = DCM1axis(1, theta);
% DCM3 = DCM1axis(3, pi/2 - zeta);

% forth part of quaternion is assumed to be scalar part
% i.e., q = [e.*sin(theta/2); cos(theta/2)]
phi = -pi/2 - z;
q1 = [zeros(length(jd),2), ones(length(jd),1).*sin(phi./2), cos(phi./2)];
phi = theta;
q2 = [ones(length(jd),1).*sin(phi./2), zeros(length(jd),2), cos(phi./2)];
phi = pi/2 - zeta;
q3 = [zeros(length(jd),2), ones(length(jd),1).*sin(phi./2), cos(phi./2)];

tmp_q = qMult(4, 1, q1, qMult(4, 1, q2, q3));

q = (scalar == 4 ) .* tmp_q...
     + (scalar == 0) .* [tmp_q(:,4), tmp_q(:,1), tmp_q(:,2), tmp_q(:,3)];

end