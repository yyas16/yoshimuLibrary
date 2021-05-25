function e = obliquity(jd)
% ----------------------------------------------------------------------
%   calculate the mean obliquity of the ecliptic for a given epoch
%    20210419  y.yoshimura
%    Inputs: jd: julian day, nx1 vector
%   Outputs: e: the mean obliquity of the ecliptic for epoch (jd), rad
%   related function files:
%   note:
%   cf: The Astronomical Almanac for the Year 1984.
%       Astronomical Algorithms, 2nd Editions. p.147, Eq.(22.2)
%   revisions;
%   function e = obliquity(jd)
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

t = (jd - 2451545.0) ./ 36525.0;

% deg
e = 23.0 + hms2deg(0, 26, 21.448) - t .* hms2deg(0,0,46.8150)...
    -t.^2 .* hms2deg(0, 0, 0.00059) + t.^3 .* hms2deg(0, 0, 0.001813);
% rad
e = deg2rad(e);

end


