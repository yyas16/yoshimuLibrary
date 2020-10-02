% ----------------------------------------------------------------------
%   constant parameters for orbital motion
%    20190214  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

%% Earth
GE_day = 2.975536351779840e+15;   % GE, in km^3/day^2
GE = GE_day / 86400 / 86400; % km^3/s^2

J2 = 0.00108263;
RE = 6378.137; % Earth radius, km, WGS-84
WE = 7.2921151467 * 10^(-5); % Earth rotation rate, rad/s, WGS-84

%% Sun
GS_day = 990693056236769280000.0;  % km^3/day^2
GS = GS_day / 86400 /86400; % km^3/s^2
RS = 696000.0; % Sun radius, km
AU = 149597870.0; % 1 AU, km

%% moon
GM = 36599213352960.0;     % km^3/day^2


J2000 = 2451545.0; % Julian day

% save('orbit_const.mat')