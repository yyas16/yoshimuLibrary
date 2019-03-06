function fyear = jd2fyear(jd)
% ----------------------------------------------------------------------
%  Julian day to fractional year, e.g., 2019.3 
%    20190301  y.yoshimura
%    Inputs: jd, julian day
%   Outputs: fyear, fractional year (decimal year)
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

[year, month, day, hour, minute, second] = jd2gc(jd);


days_in_prev_months = [0 31 59 90 120 151 181 212 243 273 304 334]';

% Day in given month.
fyear = days_in_prev_months(month) ...                % days in prev. months
   + (isleapyear(year) & (month > 2)) ...          % leap day
   + day ...                                       % day in month
   + (second + 60 * minute + 3600 * hour) / 86400; % part of day
fyear = year + (fyear - 1) / (365 + isleapyear(year));

function t = isleapyear(year)
	t = (~rem(year, 4) & rem(year, 100)) | ~rem(year, 400);