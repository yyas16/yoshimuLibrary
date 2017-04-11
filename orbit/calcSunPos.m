function sunPos = calcSunPos(jd)
% ----------------------------------------------------------------------
%    calculate the Sun position @J2000 
%    20161207  y.yoshimura
%    Inputs: jd: Julian day (TDT)
%   Outputs: sunPos: position vector of Sun @ J2000 IJK, 3x1 vector
%   related function files:
%   note:
%   cf: Hand book, p 280
%   revisions;
%   
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

T = (jd - 2451545.0) / 36525.0;

% mean anomaly of Sun
M   = 357.5256 + 35999.0454 * T; % deg
M   = deg2rad(M);
lam = 282.94 + rad2deg(M) + (6892 * sin(M) + 72 * sin(2*M) + 1250.09115 * T) / 3600 ...
 - 0.002652; % deg
lam = deg2rad(lam);
 
% distance from Earth to Sun @ mean ecliptic plane
 rs_norm = 149619000 - 2499000 * cos(M) - 21000 * cos(2 * M);
 
%  position vector of Sun@ mean ecliptic plane
 rs = rs_norm .* [cos(lam)
     sin(lam)
     0];
 
 epsi = deg2rad(23.493929111);
 
 %  position vector of Sun @ J2000 IJK
sunPos = rs_norm * [cos(lam)
    sin(lam) * cos(epsi)
    sin(lam) * sin(epsi)]; % km

     