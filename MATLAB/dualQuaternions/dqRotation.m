function rb = dqRotation(scalar, r, dqIn)
% -------------------------------------------------------------------------------------
%   vector rotation by quaternions
%   function rb = qRotation(scalar, r, qIn)
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           r, vector, nx3 matrix
%           dq, dual quaternions, nx8 matrix
%   Output: q \otimes r \otimes q^(-1)
%   (c) 2021 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q4 .* pv + p4 .* qv - cross(qv,pv)
%                 q4 * p4 - qv' * pv]

% transform r and qIn to row vectors or nx3 matrix
if iscolumn(r)
    r = r';
end
if iscolumn(dqIn)
    dqIn = dqIn';
end

% quaternion multipliationで計算するので便宜上，nx8 のdual quaternion vectorにする
r_temp = [zeros(size(r,1),3), ones(size(r,1),1), r./2, zeros(size(r,1),1)];

% q4がスカラーの定義かつ \otimes のクォータニオン積の定義で計算する
dq = (scalar == 4) .* dqIn ...
    + (scalar == 0) .* [dqIn(:,2:4), dqIn(:,1), dqIn(:,6:8), dqIn(:,5)];

temp = dqMult(4, 1, dq, r_temp);
temp2 = dqMult(4, 1, temp, dqInv(4, dq));

tmp = 2.0 * qMult(4, 0, temp2(:,5:8), qInv(4,temp2(:,1:4)));

rb = (scalar == 4) .* tmp(:,1:3) ...
    + (scalar == 0) .* tmp(:,2:4);

end