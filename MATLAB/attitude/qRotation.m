function rb = qRotation(scalar, r, qIn)
% -------------------------------------------------------------------------------------
%   vector rotation by quaternions
%   function rb = qRotation(scalar, r, qIn)
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           r, vector, nx3 matrix
%           q, quaternions, nx4 matrix
%   Output: q \otimes r \otimes q^(-1)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q4 .* pv + p4 .* qv - cross(qv,pv)
%                 q4 * p4 - qv' * pv]

% transform r and qIn to row vectors or nx3 matrix
if iscolumn(r)
    r = r';
end
if iscolumn(qIn)
    qIn = qIn';
end

% quaternion multipliationで計算するので便宜上，nx4 vectorにする
r_temp = [zeros(size(r,1),1) r];

% q0がスカラーの定義かつ \odot のクォータニオン積の定義で計算する
q = (scalar == 0) .* qIn ...
    + (scalar == 4) .* [qIn(:,4), qIn(:,1), qIn(:,2), qIn(:,3)];

q_inv = qInv(0, q);

temp  = qMult(0, 0, q_inv, r_temp);
temp2 = qMult(0, 0, temp, q);

rb = temp2(:,2:4);

end