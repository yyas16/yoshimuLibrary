function DCM = earthFullRot_DCM(jd, UT1_UTC)
% ----------------------------------------------------------------------
%  calculate Earth rotation including precession and nutation
%    20170516  y.yoshimura
%    Inputs: jd: Julian days [day]
%   Outputs: DCM from ECI to ECEF
%   related function files:
%   note:
%   cf:1	
%   revisions;
%   DCM = earthFullRot(jd, UT1_UTC)
%   (c) 2017 yasuhiro yoshimura
%----------------------------------------------------------------------

% nutation
[dcm_n,  eps_a, deps, dpsi] = earthNutationo(jd);

% precession 
dcm_p = earthPrecession(jd);

% calculate GMST
gmst = jd2GMST(jd, UT1_UTC);
GAST = gmst + dpsi * cos(eps_a + deps);

dcm_s = DCM1axis(3, GAST);

DCM = dcm_s * dcm_n * dcm_p;

end