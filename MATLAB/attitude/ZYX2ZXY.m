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
ZYX = load('data_deg.csv');
time = ZYX(:,1);
zyx = deg2rad(ZYX(:,2:4));

out = [];
for i = 1:length(time)
    dcm = ZYX2DCM(zyx(i,1), zyx(i,2), zyx(i,3));
%     out(i,:) = DCM2ZXY(dcm);
       out(i,:) = DCM2XYZ(dcm);

end

csvwrite('XYZ.csv', out);
