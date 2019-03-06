function T = rotPeriod(MOI, w)
% ----------------------------------------------------------------------
%   calculate the rotational period of rigid body
%    20181130  y.yoshimura
%    Inputs: MOI, principal axes of moment of inertia, kgm^2, 3x3 matrix
%            angular rate, rad/s, 1x3 or 3x1 vector
%   Outputs: period of free rotation, s
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
w = w(:); % make column vector

Jx = MOI(1,1);
Jy = MOI(2,2);
Jz = MOI(3,3);

E = 0.5 * w' * MOI * w;
h = MOI * w;
h2 = h' * h;

m = (Jy - Jx) * (2*Jz * E - h2) / (Jz - Jy) / (h2 - 2*Jx*E);
myfun = @(xi) 1 ./ sqrt(1 - m * (sin(xi)).^2);

K = integral(myfun, 0, pi/2);

kappa = sqrt(Jx * (Jz - Jx) / Jy / (Jz - Jy));
w3m = sqrt((h2 - 2*Jx*E) / Jz / (Jz - Jx));

wp = ((Jy - Jz) / Jx) * kappa * w3m;
T = abs(4 * K / wp);

end