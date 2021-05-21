function dq = dqMult(scalar, def, dq1, dq2)
% -------------------------------------------------------------------------------------
%   dual Quaternion multiplication
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0; q1; q2; q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1; q2; q3; q4]
%           def, specifies the definition of the product of quaternions
%           def == 0, q \odot p
%           def == 1, q \otimes p
%           dq1: dual quaternion, Nx8 matrix (at least 1x8 vector)
%           dq2: dual quaternion, Nx8 matrix (at least 1x8 vector)
%   Output: [q1_r*q2_r, q1_r*q2_d + q1_d*q2_r], Nx8 matrix (at least 1x8 vector)
%   dqMult(scalar, def, dq1, dq2)
%   (c) 2021 yasuhiro yoshimura
%-------------------------------------------------------------------------------------
 % transform to row vector
if iscolumn(dq1)
    dq1 = dq1';
end
if iscolumn(dq2)
    dq2 = dq2';
end

dq1_r = dq1(:,1:4); dq1_d = dq1(:,5:8);
dq2_r = dq2(:,1:4); dq2_d = dq2(:,5:8);

dq_r = qMult(scalar, def, dq1_r, dq2_r);    
dq_d = qMult(scalar, def, dq1_r, dq2_d) + qMult(scalar, def, dq1_d, dq2_r);

dq = [dq_r, dq_d];

end