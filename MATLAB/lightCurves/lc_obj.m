function [m, sat] = lc_obj(jd, q, pos, obs_ECI, sat, nu, sun_pos)
% ----------------------------------------------------------------------
%   calculate Light Curves for the object defined with sat
%    20190219  y.yoshimura
%    Inputs: jd, Julian day, day, nx1 vector
%            q, quaternion, -, nx4 matrix
%            pos, satellite position vector@inertial frame, km, nx3 matrix
%            obs, observer position vector@inertial frame, km, nx3 matrix
%            sat, satellite shape,
%            nu, flag if object is sunlit, nx1 vector
%            nu == 1 sunlit
%            nu == 0 eclipse
%            sun_pos, sun position, km, nx3 vector
%   Outputs: m, relative magnitude of light curve w.r.t Sun
%   related function files:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

%% a priori variable allocation w.r.t. time history
f_obs = zeros(length(jd), 1);

%% Sun position
sun_relDir = sun_pos - pos; % km, relative sun direction@ECI

%% observer position
obs_relDir = obs_ECI - pos;  % km, relative observer direction@ECI

%% relative magnitude of light curves
for i = 1:length(jd)
    sun_tmp = q2DCM(4, q(i,:))*normRow(sun_relDir(i,:))';
    obs_tmp = q2DCM(4, q(i,:))*normRow(obs_relDir(i,:))';
    sat = lps_obj(sat, sun_tmp, obs_tmp);
    f_obs(i,1) = sum(sat.f_obs);
%     [L(i,1), face] = AS(face, sun_tmp, obs_tmp);   
%     [L(i,1), face] = CT(face, sun_tmp, obs_tmp);   
end

sunObs_rel = normRow(sun_pos - obs_ECI); % relative directional vector from obs to Sun
satObs_rel = normRow(pos - obs_ECI); % relative directional vector from obs to sat 

f_obs = f_obs .* nu; % consider umbra, penumbra
f_obs = f_obs .* (dot(sunObs_rel, normRow(obs_ECI),2) <= 0.0); % when observer cannot see Sun
f_obs = f_obs .* (dot(satObs_rel, normRow(obs_ECI),2) > 0.0); % when observer can see Satellite
m = -26.7 - 2.5 * log10(f_obs ./ (vecnorm(obs_relDir,2,2).*1000).^2); % km to m

end