function [m, m_facet, face] = LC(jd, q, pos, obs_ECI, face, nu, earthVSOP)
% ----------------------------------------------------------------------
%   calculate Light Curves for the object related to face
%    20190219  y.yoshimura
%    Inputs: jd, Julian day, day, nx1 vector
%            q, quaternion, -, nx4 matrix
%            pos, satellite position vector@inertial frame, nx3 matrix
%            obs, observer position vector@inertial frame, nx3 matrix
%            face, satellite shape,
%            nu, flag if object is sunlit, nx1 vector
%            nu == 1 sunlit
%            nu == 0 eclipse
%   Outputs: m, relative magnitude of light curve w.r.t Sun
%   related function files:
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

%% a priori variable allocation
m_facet = zeros(length(jd), size(face(1).make,1));
L = zeros(length(jd), size(face(1).make,1));

%% Sun position
[l, b, dis] = sun(jd, earthVSOP);
sun_pos = lonLat2pos(l, b, AU2km(dis));
sun_relDir = sun_pos - pos; % km, relative sun direction@ECI

%% observer position
obs_relDir = obs_ECI - pos;  % relative observer direction@ECI
sunObs_rel = normRow(sun_pos - obs_ECI); % relative directional vector from observer to Sun
satObs_rel = normRow(pos - obs_ECI); % relative directional vector from observer to sat

%% relative magnitude of light curves
for i = 1:length(jd)
    sun_tmp = q2DCM(4, q(i,:))*normRow(sun_relDir(i,:))';
    obs_tmp = q2DCM(4, q(i,:))*normRow(obs_relDir(i,:))';
    [L(i,1), face] = LPS(face, sun_tmp, obs_tmp);
    for j = 1:length(face)
        m_facet(i,:,j) = face(j).m; % for each facet
    end
end
L = L .* nu; % consider umbra, penumbra
L = L .* (dot(sunObs_rel, normRow(obs_ECI),2) <= 0.0); % when observer cannot see Sun
L = L .* (dot(satObs_rel, normRow(obs_ECI),2) > 0.0); % when observer can see Satellite
m = -26.7 - 2.5 * log10(L ./ (vecnorm(obs_relDir,2,2).*1000).^2); % km to m

end