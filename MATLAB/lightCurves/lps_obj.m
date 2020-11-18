function sat = lps_obj(sat, sun_b, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Lambertian and Perfect Specular model
%    20200909  y.yoshimura
%    Inputs: sat, satellite shape definition by obj files
%            sun_b, sun vector from satellite to sun, unit vector, Nx3 matrix 
%            v, observer vector from spacecraft to observer, unit vetor, Nx3             
%   Outputs: sat: sat.f_obs is added, Nx1
%   related function files:
%   note:
%   cf:
%   revisions;
% function sat = lps_obj(sat, sun_b, v)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------
sun_b = sun_b ./ vecnorm(sun_b,2,2); %一応 normalize
v = v ./ vecnorm(v, 2, 2);

h = sun_b + v; % bisector vector of sun and observer vectors
h = h ./ vecnorm(h, 2, 2);

c_total = sat.Cd./pi ...
    + 2.0 .* sat.Cs .* (dot(sat.normal,h,2) >= cos(deg2rad(5))); % Nx1
tmp = c_total .* sat.area .* dot(sat.normal,sun_b,2) .* (dot(sat.normal,v,2)); 

% if the faces can be seen or not
sat.f_obs = tmp .* (dot(sat.normal,sun_b,2) > 0) .* (dot(sat.normal,v,2) > 0); % Nx1

end
