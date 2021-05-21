function DCM = DCM1axis(axis, phi)
% -------------------------------------------------------------------
%   calculate directional cosine matrix
%   for coordinate transformation around an axis (NOT vector rotation) 
%   input: axis, rotation axis1 = x axis, 2 = y axis, 3 = z axis
%          phi,  rotation angle, [rad], scalar
%   outut: DCM, rotation matrix, 3x3 matrix
%   DCM = DCM1axis(axis, phi)
%   (c) 2015  yasuhiro yoshimura
% ?-------------------------------------------------------------------

cp = cos(phi);
sp = sin(phi);
DCM = (axis == 1) .* [1 0 0
    0 cp sp
    0 -sp cp]...
    + (axis == 2) .* [cp 0 -sp
    0 1 0
    sp 0 cp]...
    + (axis == 3) .* [cp sp 0
    -sp cp 0
    0 0 1];