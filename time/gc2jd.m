function jd = gc2jd(year, month, day, hour, minute, second)
% ----------------------------------------------------------------------
%    calculate Julian days from Gregorian calendar date
%    20160419  y.yoshimura
%    Input: year,   e.g., 2016
%           month,  e.g., 8
%           day,    e.g., 4
%           hour,   e.g., 17
%           minute, e.g., 12
%           second, e.g., 32.1
%   Output: Julian day
%   related function files:
%   note: check with: http://eco.mtk.nao.ac.jp/cgi-bin/koyomi/cande/date2jd.cgi
%   cf: Meeus, J., Astronomical Algorithms, 1998., p61, Eq.(7.1)
%   revisions;
%   jd = gc2jd(year, month, day, hour, minute, second)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

M_ = (month > 2) * month + (month <= 2) * (month + 12);
Y_ = (month > 2) * year  + (month <= 2) * (year  -  1 );
 
A_ = floor(Y_ / 100);
B_ = 2 - A_ + floor(A_ / 4);

jd = floor(365.25 * (Y_ + 4716)) + floor(30.6001 * (M_ + 1))...
    + day + B_ - 1524.5 + hour / 24 + minute / 1440 + second / 86400;

end