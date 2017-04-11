function rb = quatRotation(scalar, r, qIn)
% -------------------------------------------------------------------------------------
%   vector rotation by quaternions
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           r, vector, 3x1 vector
%           q, quaternions, 4x1 vector
%   Output: q^(-1) \otimes r * \otimes q
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv - cross(qv,pv)]

% quaternion multipliationで計算するので便宜上，4x1 vectorにする
r_temp = [0
    r];

% q0がスカラーの定義かつ \odot のクォータニオン積の定義で計算する
    q = (scalar == 0) .* qIn ...
        + (scalar == 4) .* [qIn(4); qIn(1); qIn(2); qIn(3)];
    
    q_inv = qInv(0, q);  
    
    temp  = qMult(0, 0, q_inv, r_temp);
    temp2 = qMult(0, 0, temp, q);
    
    rb = temp2(2:4);
    
end