function [zeta, z, theta, eta, p_ini, p] = earthPrecession(jd0, jd1)
% ----------------------------------------------------------------------
%  calculate the Earth precession
%    20170310  y.yoshimura
%    Inputs: jd0, Julian day of initial epoch, day, nx1 vector
%            jd1, Julian day of final epoch, day, nx1 vector
%   related function files:
%   note:
%   cf:1	Montenbruck, O., and Gill, E., 
%           Satellite Orbits, Berlin, Heidelberg: 
%           Springer Science & Business Media, 2012. p.176
%   revisions;
%   function [zeta, z, theta, eta, p_ini, p] = earthPrecession(jd0, jd1)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------
orbit_const

T = (jd0 - J2000) ./ 36525.0;
t = (jd1 - jd0) ./ 36525.0;

zeta = (2306.2181 + 1.39656 .* T -0.000139 .* T.^2 ) .* t ...
    + (0.30188 - 0.000344 .* T) .* t.^2 ...
    + 0.017998 .* t.^3;
zeta = arcsec2rad(zeta);

z = (2306.2181 + 1.39656 .* T - 0.000139 .* T.^2 ) .* t ...
    + (1.09468 + 0.000066 .* T ) .* t.^2 ...
    + 0.018203 .* t.^3;
z = arcsec2rad(z);

theta = (2004.3109 - 0.85330 .* T - 0.000217 .* T.^2) .* t ...
    - (0.42665 + 0.000217 .* T) .* t.^2 ...
    - 0.041833 .* t.^3;
theta = arcsec2rad(theta);

eta =(47.0029 - 0.06603 .* T + 0.000598 .* T.^2) .* t ...
    + (-0.03302 + 0.000598 .* T ) .* t.^2 ...    
    + 0.000060 .* t.^3;
eta = arcsec2rad(eta);

p_ini = 3289.4789 .* T + 0.60622 .* T.^2 - (869.8089 + 0.50491 .* T) .* t ...    
    + 0.03536 .* t.^2;
p_ini = deg2rad(174.876384) + arcsec2rad(p_ini);

p = (5029.0966 + 2.222226 .* T -0.0000042 .* T.^2) .* t ...
    + (1.11113 - 0.000042 .* T ) .* t.^2 - 0.000006 .* t.^3;
p = arcsec2rad(p);

end