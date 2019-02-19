function GMST = jd2GMST(jd, UT1_UTC)
% ----------------------------------------------------------------------
%    calculate Green-wich mean sidereal time from julian day
%    20160419  
%    Input: jd, julian day, nx1 vector
%           UT1_UTC, scalar
%   Output: GMST, [rad], nx1 vector
%   related function files:
%   note: output format is angle (rad)
%   cf:
%   revisions;
%   function GMST = jd2GMST(jd, UT1_UTC)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

MJD = jd - 2400000.5 + UT1_UTC / 86400.0;
ut1_ss = (MJD - floor(MJD)) .* 86400.0;
MJD = floor(MJD);

T = (MJD - 51544.5) / 36525.0;

GMST = 8640184.812866 .* T;

GMST = GMST + (-6.2e-6 .* T + 0.093104) .* T .* T + 24110.54841;

dsdmr = 1.002737909350795 + 5.9006e-11 .* T -5.9e-15 .* T .* T;

GMST = GMST + dsdmr .* ut1_ss;

GMST = GMST - 86400.0 * floor(GMST ./ 86400.0); % ŽžŠÔ‚Æ‚µ‚Ä‚Ì second

GMST = GMST .* 15.0 ./ 3600; % deg
GMST = GMST .* pi ./ 180.0; % rad