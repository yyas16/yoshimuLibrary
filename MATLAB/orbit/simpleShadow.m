function nu = simpleShadow(sat_i, sun_i)
% ----------------------------------------------------------------------
%   calculate satellite is sunlit or in eclipse
%    20190220  y.yoshimura
%    Inputs: sat_i, satellite position@inertial frame, nx3
%            sun_i, sun position@inertial frame, nx3
%   Outputs: nu, nx1 vector
%            nu == 1 sunlit
%            nu == 0 eclipse
%   related function files:
%   note:
%   cf: Satellite Orbits, Montenbruck, Gill, p.81
%   revisions;
%   function nu = simpleShadow(sat_i, sun_i)   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

orbit_const

s0 = (dot(-sat_i, sun_i, 2)) ./ vecnorm(sun_i,2,2);
l = sqrt(vecnorm(sat_i,2,2).^2 - s0.^2);

nu = (l > RE) + (dot(sat_i, sun_i, 2) > 0);
nu = (nu >= 1); % nu == 2‚à1‚É‚·‚éD
end