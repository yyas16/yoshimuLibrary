function vert = translation(vert, x, y, z, m, k)
% -------------------------------------------------------------------
%   Translation function for satellite drawing
%
%   2011-10-05  yasuhiro yoshimura
%   Input: x, y, z: scalar, translation distance
%        : m: the number of equipments
%        : k: the number of face, e.g. box is 6, cylinder is 3.
%  Output: vert (strcture)
% -------------------------------------------------------------------

for j=1:k
    b = [x;y;z];
    vert(m,j).coord = vert(m,j).coord + ones(length(vert(m,j).coord),3) * diag(b);
end
end