function q = earthFullRot_q(jd0, jd1, scalar)
% ----------------------------------------------------------------------
%  calculate Earth rotation including precession and nutation
%    20170516  y.yoshimura
%    Inputs: jd0: Julian days [day], scalar
%            jd1: Julian days [day], nx1 vector   
%            scalar: quaternion definition
%                 scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%                 scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%   Outputs: quaternion from epoch jd0 to jd1, nx4 matrix
%   related function files:
%   note:
%   cf:1	
%   revisions;
%   function q = earthFullRot_q(jd0, jd1, scalar)
%   (c) 2017 yasuhiro yoshimura
%----------------------------------------------------------------------

% nutation
q_n = nutation_q(jd1, scalar);

% precession 
q_p = precession_q(jd0, jd1, scalar);

% TOD = Nutation * Precession * J2000
q = qMult(scalar, 1, q_n, q_p);


end