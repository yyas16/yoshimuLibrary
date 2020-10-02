function sat = lps_obj(sat, sun, v)
% ----------------------------------------------------------------------
%   calculate Light curves with Lambertian and Perfect Specular model
%    20200909  y.yoshimura
%    Inputs: face,
%             sun, sun vector from spacecraft to sun, unit vector,
%               v, observer vector from spacecraft to observer, unit vetor
%   Outputs: sat: sat.f_obs is added
%   related function files:
%   note:
%   cf:
%   revisions;
% function sat = LPS_obj(sat, sun, v)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------
sun = sun(:) ./ norm(sun);
v = v(:) ./ norm(v);

u_bisec = sun + v; % bisector of sun and observer vectors
u_bisec = u_bisec ./ norm(u_bisec);

c_total = sat.Cd./pi ...
    + 2.0 .* sat.Cs .* (sat.normal*u_bisec >= cos(deg2rad(5))); % nx1
tmp = c_total .* sat.area .* (sat.normal*sun) .* (sat.normal*v); % nx1, if the faces can be seen or not

sat.f_obs = tmp .* (sat.normal*sun > 0) .* (sat.normal*v > 0);

end
