function [r, v] = oe2rv(oe)
% -------------------------------------------------------------------------------------
%   transform orbital elements to position and velocity vector
%    Input: oe: orbital elements consist of
%                    a: semimajor axis, km
%                    ecc: eccentricity
%                    incl: inclination, rad
%                    omega: longitude of ascending node,rad
%                    argp: argument of perigee/longitude of periapsis, rad
%                    nu: true anomaly/true longitude/true latitude, rad
%   Output: r: position vector, 1x3 vector, km
%           v: velocity vector, 1x3 vector, km/s
% cf. Vallado, D. A., and McClain, W. D.,
% Fundamentals of Astrodynamics and Applications,
%  note: if true anomaly is unknown, use calcTA.m function to obtain true
%  anomaly.
%  [r v] = oe2rv(oe);
%   (c) 2015 yasuhiro yoshimura
%----------------------------------------------------------------------
orbit_const

small = 1.0e-10;
mu = GE; % �n�S�d�͒萔 [km^3/s^2]

a = oe(1);
ecc = oe(2);
incl = oe(3);
ome = oe(4);
argp = oe(5);
nu = oe(6);

if ( ecc < small )
    % ----------------  circular equatorial  ------------------
    if ((incl < small) || ( abs(incl-pi)< small ))
        argp = 0.0;
        ome= 0.0;
        %         nu   = truelon;
    else
        % --------------  circular inclined  ------------------
        argp= 0.0;
        %         nu  = arglat;
    end
else
    % ---------------  elliptical equatorial  -----------------
    if ( ( incl < small) || (abs(incl-pi)<small) )
        %         argp = lonper;
        ome = 0.0;
    end
end

p    = a * (1 - ecc^2);
temp = p / (1.0  + ecc * cos(nu));
r_pqw = [temp * cos(nu) % position in orbital plane
    temp * sin(nu)
    0.0];

p = 0.0001 .* ( abs(p) < small) + p .* ( abs(p) >= small);

v_pqw = [-sin(nu) * sqrt(mu)  / sqrt(p)
    (ecc + cos(nu)) * sqrt(mu) / sqrt(p)
    0.0];

% ----------------  perform transformation to ijk  ------------

r = zxz2dcm(ome,incl,argp)' * r_pqw;
v = zxz2dcm(ome,incl,argp)' * v_pqw;

r = r'; % row vector
v = v';

end