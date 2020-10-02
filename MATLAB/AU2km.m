function km = AU2km(AU)
% ----------------------------------------------------------------------
%    transform AU to km
%    20190214  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf: Satellite Orbits, Springer
%   revisions;
%   
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

km = AU .* 149597870.691;

end