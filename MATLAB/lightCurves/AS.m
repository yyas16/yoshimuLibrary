function [cd, cs, M, D] = AS(spe, F0, rho, nu, nv, n, s, v)
% ----------------------------------------------------------------------
%   calculate diffuse and specular terms of Ashikhmin-Shirley model
%    20210219  y.yoshimura
%    Inputs: 
%
%
%   Outputs: cd
%            cs
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

h = s + v;
h = h ./ norm(h);

alp = acos(h(3));
bet = atan2(h(2), h(1));

NS = n * s';
NV = n * v';
VH = v * h';

%% diffuse
cd = 28 * rho / 23 / pi * (1 - spe * F0) * (1 - (1 - NS/2)^5) * (1 - (1 - NV/2)^5);

%% specular
F = F0 + (1 / spe - F0) * (1 - VH)^5;

M = sqrt((nu + 1) * (nv + 1)) / 8 / pi * F / VH / max(NS, NV);
D = cos(alp)^(nu * cos(bet)^2 + nv * sin(bet)^2);

cs = M * D;

end