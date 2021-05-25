function q = precession_q(jd0, jd1, scalar)
% ----------------------------------------------------------------------
%  calculate the Earth precession
%    20170310  y.yoshimura
%    Inputs: jd0: Julian days [day] at epoch at jd0
%            jd1: Julian days [day] at epoch at jd1
%                 scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%                 scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%   Outputs: q: quaternion from jd0 to jd1
%            when jd0 = J2000.0 means the rotation from ICRF to TOD frame
%   related function files: earthPrecession.m
%   note:
%   cf:1	Montenbruck, O., and Gill, E., 
%           Satellite Orbits, Berlin, Heidelberg: 
%           Springer Science & Business Media, 2012. p.176
%   revisions;
%   DCM = precession_q(jd0, jd1, scalar)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

% forth part of quaternion is assumed to be scalar part in calculation
% i.e., q = [e.*sin(theta/2); cos(theta/2)]

[zeta, z, theta, ~, ~, ~] = precession(jd0, jd1);

the_q = -pi / 2 - z;
N = length(the_q);
q1 = [ zeros(N,2) sin(the_q/2) cos(the_q/2)];

the_q = theta;
q2 = [sin(the_q/2) zeros(N,2) cos(the_q/2)];

the_q = pi / 2 - zeta;
q3 = [zeros(N,2) sin(the_q/2) cos(the_q/2)];

tmp_q = qMult(4, 1, q1, qMult(4, 1, q2, q3));

q = (scalar == 4 ) .* tmp_q...
     + (scalar == 0) .* [tmp_q(:,4), tmp_q(:,1), tmp_q(:,2), tmp_q(:,3)];

end