function tle = readTLE(TLEname)
% ----------------------------------------------------------------------
%    read TLE(Two-Line-Elements) files 
%    20190201  y.yoshimura
%    Inputs: %   Orbital elements :
%      a [km]   : semi-major axis
%      e         : eccentricity
%      i [rad] : inclination
%      W [rad] : longitude of the ascending node
%      w [rad] : argument of perigee
%      M [rad] : mean anomaly at EPOCH
%      P [s]    : Revolution Number at Epoch
%   Outputs:
%   related function files:
%   note: ‚¢‚Ü‚Ì‚Æ‚±‚ësatellite name‚Ì‚È‚¢TLE‚µ‚©‘Î‰‚µ‚Ä‚¢‚È‚¢
%         TLE‚ª•¡”•À‚ñ‚Å‚¢‚é‚Ì‚Í‰Â”\
%   cf:
%   revisions;
%   function tle = readTLE(TLEname)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
global const % const.GE, in km^3/day^2

%% scan TLE file
data = importdata(TLEname, '');
n = length(data); % the number of data
line1 = cell2mat(data(1:2:n)); % •¡”‚ ‚é‚Æ‚«‚Í2s‚¨‚«‚É’Šo
line2 = cell2mat(data(2:2:n));

%% Information from LINE1
satid = line1(:,3:7);
launchYear = str2double(line1(:,10:11));
launchNum = str2double(line1(:,12:14));
launchPiece = str2double(line1(:,15:17));

year = line1(:,19:20);
epochDayOfYear = str2double(line1(:,21:32));
tmp = (year(:,1)>'4') .* '19'...
    + (year(:,1)<='4') .* '20';
syear = strcat(tmp, year); % 4-digit year
epochYear = str2double(syear);

ep = datevec(datenum(epochYear, zeros(n/2,1), epochDayOfYear));
jd = gc2jd(ep(:,1),ep(:,2),ep(:,3),ep(:,4),ep(:,5),ep(:,6));

%% Information from LINE2
rpd = str2double(line2(:,53:63));           % rounds per day

oe = [(const.GE_day .* (1 ./ rpd ./ 2 ./pi).^2).^(1/3) ...  % semimajor axis
    str2double(strcat(ones(n/2,1).*'0.', line2(:,27:33)))...      % eccentricity
    str2double(line2(:,9:16)) ...            % [deg] inclination
    str2double(line2(:,18:25))...         % [deg] longitude (or right ascension) of the ascending node
    str2double(line2(:,35:42)) ...            % [deg] argument of periapsis (or perigee)
    str2double(line2(:,44:51))];          % [deg] mean anomaly at epoch

oe(:,3:6) = deg2rad(oe(:,3:6)); % nx6 matrix

% TLE structure
tle.satID = satid;
tle.launchYear = launchYear;
tle.launchNum = launchNum;
tle.launchPiece = launchPiece;
tle.oe = oe;
tle.jd = jd;

end