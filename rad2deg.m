function deg = rad2deg(rad)
% -------------------------------------------------------------------
%   transform radians to degrees
%   input: rad, scalar or vector [radians]
%   outut: deg, scalar or vector [deg]
%   (c) 2011-10-04  yasuhiro yoshimura
% ?-------------------------------------------------------------------

deg = 180.0 .* rad ./ pi;

end