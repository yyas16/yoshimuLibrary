% ----------------------------------------------------------------------
%   constant parameters for orbital motion
%    20190214  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf: Satellite Orbits
%   revisions;
%   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

const.c = 299792458; % light speed, m/s

% The maen obliquity for J2000.0, in rad???
const.EPS_0 = arcs2rad(84381.448);

%% Earth
const.GE = 398600.4415;  % kfm^3/s^2
const.GE_day = const.GE *  86400 * 86400;  % GE, km^3/day^2
const.GE_m = const.GE * 10^3 * 10^3 * 10^3; % m^3/s^2

const.J2 = 0.00108263;
const.RE = 6378.137; % Earth radius, km, WGS-84
const.WE = 7.2921151467 * 10^(-5); % Earth rotation rate, rad/s, WGS-84

const.fE = 1.0 / 298.257; % earth flattening

%% Sun
const.GS_day = 990693056236769280000.0;  % km^3/day^2
const.GS = const.GS_day / 86400 /86400; % km^3/s^2
const.RS = 696000.0; % Sun radius, km
const.AU = 149597870.0; % 1 AU, km

const.S0 = 1357; % Solar constant, W/m^2


%% moon
const.GM = 36599213352960.0;     % km^3/day^2


const.J2000 = 2451545.0; % Julian day

% save('orbit_const.mat')