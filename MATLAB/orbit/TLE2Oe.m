function [jd, oe] = TLE2Oe(fp, satName)
%   Orbital elements :
%      a [km]   : semi-major axis
%      e         : eccentricity
%      i [rad] : inclination
%      W [rad] : longitude of the ascending node
%      w [rad] : argument of perigee
%      M [rad] : mean anomaly at EPOCH
%      P [s]    : Revolution Number at Epoch
% 

OE=zeros(6,1);

mu=2975536351779840.0;   %GE, in km^3/day^2. ----- */
mu=2.9759063040e+15;   %GE, in km^3/day^2. by yoshimura----- */


% scan file until satname found
while ~feof(fp)
    line=fgetl(fp);
    found = strcmp(line, satName);
    if found
        break
    end   
end

% read two lines
line1 = fgetl(fp);
line2 = fgetl(fp); 
fclose(fp);

% Information from LINE1
satid        = line1(3:7);
launchYear   = str2double(line1(10:11));
launchNumber = str2double(line1(12:14));
launchpiece  = str2double(line1(15:17));

year = line1(19:20);

epochDayOfYear=str2double(line1(21:32));

if str2double(year(1))>4
      syear = ['19' year];
else
      syear = ['20' year];
end

epochYear = str2double(syear);
ep        = datevec(datenum(epochYear,0,epochDayOfYear));
JD        = gc2jd(ep(1),ep(2),ep(3),ep(4),ep(5),ep(6));

% Information from LINE2
rpd=str2double(line2(53:63));           % rounds per day

OE = [(mu * (1 / rpd / 2 /pi)^2)^(1/3)  % semimajor axis
    str2double(['.' line2(27:33)])      % eccentricity
    str2double(line2(9:16))             % [deg] inclination
    str2double(line2(18:25))            % [deg] longitude (or right ascension) of the ascending node 
    str2double(line2(35:42))            % [deg] argument of periapsis (or perigee)
    str2double(line2(44:51))];          % [deg] mean anomaly at epoch

OE(3) = deg2rad(OE(3));
OE(4) = deg2rad(OE(4));
OE(5) = deg2rad(OE(5));
OE(6) = deg2rad(OE(6));

% outputs
jd = JD;
oe =OE';

