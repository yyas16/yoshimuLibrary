function q = earthFullRot_q(jd, UT1_UTC, scalar)
% ----------------------------------------------------------------------
%  calculate Earth rotation including precession and nutation
%   q = earthFullRot_q(jd, UT1_UTC)
%    20170516  y.yoshimura
%    Inputs: jd: Julian days [day]
%            UT1_UTC
%            scalar: quaternion definition
%                 scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%                 scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%   Outputs: quaternion from ECI to ECEF
%   related function files:
%   note:
%   cf:1	
%   revisions;
%   (c) 2017 yasuhiro yoshimura
%----------------------------------------------------------------------

% nutation
[dcm_n,  eps_a, deps, dpsi] = earthNutation(jd);

% precession 
dcm_p = earthPrecession(jd);

% calculate GMST
gmst = jd2GMST(jd, UT1_UTC);
GAST = gmst + dpsi * cos(eps_a + deps);

dcm_s = DCM1axis(3, GAST);

DCM = dcm_s * dcm_n * dcm_p;
q = DCM2q(4, DCM);

end