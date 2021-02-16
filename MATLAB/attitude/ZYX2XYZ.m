function xyz = zyx2xyz(zyx)
% ----------------------------------------------------------------------
%   transform ZYX euler angles to XYZ euler angles
%    20200616  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------


xyz = zeros(size(zyx,1),3);

for i = 1:size(zyx,1)
    q = ZYX2q(0, zyx(i,:));
    xyz(i,:) = q2XYZ(q);
end

end