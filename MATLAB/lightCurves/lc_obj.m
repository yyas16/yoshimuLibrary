function [m, sat] = lc_obj(jd, q, satPos, obs_ECI, sat, nu, sunPos, varargin)
% ----------------------------------------------------------------------
%   calculate Light Curves for the object defined with sat
%    20190219  y.yoshimura
%    Inputs: jd, Julian day, day, nx1 vector
%            q, quaternion, -, nx4 matrix
%            pos, satellite position vector@inertial frame, m, nx3 matrix
%            obs, observer position vector@inertial frame, m, nx3 matrix
%            sat, satellite shape,
%            nu, flag if object is sunlit, nx1 vector
%            nu == 1 sunlit
%            nu == 0 eclipse
%            sun_pos, sun position@inertial frame, m, nx3 vecto
%            BRDF, BRDF used in light curve clculation:
%                  default = Lambertian diffuse and mirror-like specular
%                  AS = Ashikhmin–Shirley model
%                  CT = Cook–Torrance model
%   Outputs: m, relative magnitude of light curve w.r.t Sun
%   related function files:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
switch nargin %入力引数の数で場合わけ
    case 7
        BRDF = 'simple'; % Lambertian diffuse and mirror-like specular
    case 8
        if strcmp(varargin{:}, 'AS')
            BRDF = 'AS'; %最後の引数にGaussという文字列を入れた場合Gaussian NDF
        elseif strcmp(varargin{:}, 'CT')
            BRDF = 'CT';
        else
            BRDF = 'simple';
        end
    otherwise
        BRDF = 'simple';
end

%% a priori variable allocation w.r.t. time history
f_obs = zeros(length(jd), 1);

%% Sun position
sunRelDir = sunPos - satPos; % m, relative direction from sat to sun@ECI

%% observer position
obsRelDir = obs_ECI - satPos;  % m, relative from sat to observer;

sun_b = qRotation(4,normRow(sunRelDir), q); % sun direction (unit) vector@body-fixed frame, Nx3 mat
obs_b = qRotation(4,normRow(obsRelDir), q); % observer direction (unit) vector@body-fixed frxame, Nx3 mat

%% relative magnitude of light curves
if strcmp(BRDF, 'simple')
    sat = lps_obj(sat, sun_b, obs_b);    
elseif strcmp(BRDF, 'AS')
    sat = lps_obj(sat, sun_b, obs_b);
else % Cook–Torrance model
    sat = lps_obj(sat, sun_b, obs_b);
end
f_obs = sum(sat.f_obs);

obs2Sun = normRow(sunPos - obs_ECI); % relative directional vector from obs to Sun
obs2Sat = normRow(satPos - obs_ECI); % relative directional vector from obs to sat

f_obs = f_obs .* nu; % consider umbra, penumbra
f_obs = f_obs .* (dot(obs2Sun, normRow(obs_ECI),2) <= 0.0); % when observer cannot see Sun
f_obs = f_obs .* (dot(obs2Sat, normRow(obs_ECI),2) > 0.0); % when observer can see Satellite
m = -26.7 - 2.5 * log10(f_obs ./ vecnorm(obsRelDir,2,2).^2);

end