% ----------------------------------------------------------------------
%   transform ZYX euler angles to ZXY euler angles
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

clc
clear
ZYX = load('test.csv');
time = ZYX(:,1);
zyx = deg2rad(ZYX(:,2:4));

zyx = [zyx(:,3) zyx(:,2) zyx(:,1)];

out = [];
for i = 1:length(time)
    q = ZYX2q(0, zyx(i,:));

    out(i,:) = q2XYZ(q);

end

pos = [6800 .* ones(length(time),1), zeros(length(time),2)];
csvwrite('XYZ.csv', [time, pos, out]);
