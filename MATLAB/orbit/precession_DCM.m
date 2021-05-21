function DCM = precession_DCM(jd0, jd1)
% ----------------------------------------------------------------------
%  calculate the Earth precession DCM from epoch jd0 to epoch jd1
%    20170310  y.yoshimura
%    Inputs: jd0: Julian days [day] at epoch at jd0
%            jd1: Julian days [day] at epoch at jd1
%   Outputs: DCM: rotation matrix from jd0 to jd1
%            when jd0 = J2000.0 means the rotation from ICRF to TOD frame
%   related function files:
%   note:
%   cf:1	Montenbruck, O., and Gill, E., 
%           Satellite Orbits, Berlin, Heidelberg: 
%           Springer Science & Business Media, 2012. p.176
%   revisions;
%   DCM = precession_DCM(jd0, jd1)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

[zeta, z, theta, ~, ~, ~] = precession(jd0, jd1);

DCM = DCM1axis(3, -pi/2 - z) * DCM1axis(1, theta) * DCM1axis(3, pi/2 - zeta);


end