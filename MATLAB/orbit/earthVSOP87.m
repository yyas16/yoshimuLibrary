function [lon, lat, r] = earthVSOP87(jd)
% ----------------------------------------------------------------------
%    Calculate Earth heliocentric longitude, latitude, and distance
%    20190214  y.yoshimura
%    Inputs:(jd): Julian day number. mx1 vector
%   Outputs: lon: Earth's heliocentric longitude, in rad, mx1
%           vector
%           lat: Earth's heliocentric latitude, rad, mx1
%            r: Earth's heliocentric distance, in AU, mx1
%   related function files:
%   note: Calculates Earth's heliocentric longitude, latitude, and
%         distance for a given Julian day number, referred to the mean
%         ecliptic and equinox of date.
%   cf: AstroLib/VSOP87.c
%       or Jean Meeus, "Astronomical Algorithms, 2nd edition", p. 217.
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------
VSOP_const  % load variable: earthVSOP

if iscolumn(jd)
    jd = jd';
end
t = ( jd - 2451545.0 ) ./ 365250.0; % 1xm  vector

% index
l_ind = 1:130;
b_ind = 131:137;
r_ind = 138:196;

ser = earthVSOP(:,2); % nx1 vector
tmp = earthVSOP(:,4) .* (cos(earthVSOP(:,5)+earthVSOP(:,6)*t));

L_tmp = tmp(l_ind,:);
L0 = sum(L_tmp.*(ser(l_ind) == 0),1); % 1xm vector
L1 = sum(L_tmp.*(ser(l_ind) == 1),1);
L2 = sum(L_tmp.*(ser(l_ind) == 2),1);
L3 = sum(L_tmp.*(ser(l_ind) == 3),1);
L4 = sum(L_tmp.*(ser(l_ind) == 4),1);
L5 = sum(L_tmp.*(ser(l_ind) == 5),1);

B_tmp = tmp(b_ind,:);
B0 = sum(B_tmp.*(ser(b_ind) == 0),1);
B1 = sum(B_tmp.*(ser(b_ind) == 1),1);

R_tmp = tmp(r_ind,:);
R0 = sum(R_tmp.*(ser(r_ind) == 0),1);
R1 = sum(R_tmp.*(ser(r_ind) == 1),1);
R2 = sum(R_tmp.*(ser(r_ind) == 2),1);
R3 = sum(R_tmp.*(ser(r_ind) == 3),1);
R4 = sum(R_tmp.*(ser(r_ind) == 4),1);

l = L0 + t .* L1 + t.^2 .* L2 + t.^3 .* L3 + t.^4 .* L4 + t.^5 .* L5;
lon = l' ./ 10^8; % transpose

b = B0 + t .* B1;
lat = b' ./ 10^8;

r = R0 + t .* R1 + t.^2 .* R2 + t.^3 .* R3 + t.^4 .* R4;
r = r' ./ 10^8;

end