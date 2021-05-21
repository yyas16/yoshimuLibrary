function DCM = earthFullRot_DCM(jd0, jd1)
% ----------------------------------------------------------------------
%  calculate Earth rotation including precession and nutation
%  from epoch j0 to j1
%    20170516  y.yoshimura
%    Inputs: jd0: Julian days [day]
%            jd1: Julian days [day]
%   Outputs: DCM from jd0 to jd1
%   related function files:
%   note:
%   cf:1	
%   revisions;
%   DCM = earthFullRot(jd0, jd1)
%   (c) 2017 yasuhiro yoshimura
%----------------------------------------------------------------------

% nutation
DCM_N = nutation_DCM(jd1);

% precession 
DCM_P = precession_DCM(jd0, jd1);

DCM = DCM_N * DCM_P;

end