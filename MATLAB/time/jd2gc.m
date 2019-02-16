function [year, month, day, hour, minute, second] = jd2gc(jd)
% ----------------------------------------------------------------------
%   calculate the Gregorian calendar date from the Julian date
%    20160419  y.yoshimura
%    Inputs: jd, julian day
%   Outputs: year,
%            month,
%            day,
%            hour,
%            minute,
%            second,
%   related function files:
%   note:
%   cf: checked with: http://eco.mtk.nao.ac.jp/cgi-bin/koyomi/cande/jd2date.cgi
%   revisions;
%   [year, month, day, hour, minute, second] = jd2gc(jd)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

fday   = jd + 0.5 - floor(jd + 0.5);
jd     = floor(jd + 0.5);
in2    = floor(floor((jd - 4479.5) / 36524.25) * 0.75 + 0.5) - 37;
in2    = jd + in2;

year   = floor(in2 / 365.25) - 4712;
an2    = in2 - 59.25;
an2    = floor(an2 - floor(an2 / 365.25) * 365.25) + 0.5;
mon2   = floor(an2 / 30.6) + 2;

month  = mon2 - floor(mon2 / 12) * 12 + 1;
day    = floor(an2 - floor(an2 / 30.6) * 30.6 + 1);
hour   = floor(fday * 24);
minute = floor((fday * 24 - floor(fday * 24)) * 60);
second = fday * 24.0 * 60.0 * 60.0 - floor(fday * 24) * 60.0 * 60.0...
    - floor((fday * 24 - floor(fday * 24)) * 60) * 60.0;


end