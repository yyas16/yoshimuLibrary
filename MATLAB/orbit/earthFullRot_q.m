function q = earthFullRot_q(jd, UT1_UTC, scalar)
% ----------------------------------------------------------------------
%  calculate Earth rotation including precession and nutation
%   q = earthFullRot_q(jd, UT1_UTC)
%    20170516  y.yoshimura
%    Inputs: jd: Julian days [day], nx1 vector
%            UT1_UTC, scalar
%            scalar: quaternion definition
%                 scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%                 scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%   Outputs: quaternion from ECI to ECEF, nx4 matrix
%   related function files:
%   note:
%   cf:1	
%   revisions;
%   function q = earthFullRot_q(jd, UT1_UTC, scalar)
%   (c) 2017 yasuhiro yoshimura
%----------------------------------------------------------------------

% nutation
[q_n,  eps_a, deps, dpsi] = earthNutation_q(jd, 4);

% precession 
q_p = earthPrecession_q(jd, 4);

% calculate GMST
gmst = jd2GMST(jd, UT1_UTC);
GAST = gmst + dpsi .* cos(eps_a + deps);
q_s = [zeros(length(jd),2), ones(length(jd),1).*sin(GAST./2), cos(GAST./2)];

% DCM = dcm_s * q_n * dcm_p;
tmp_q = qMult(4, 1, q_s, qMult(4, 1, q_n, q_p));

q = (scalar == 4 ) .* tmp_q...
     + (scalar == 0) .* [tmp_q(:,4), tmp_q(:,1), tmp_q(:,2), tmp_q(:,3)];

end