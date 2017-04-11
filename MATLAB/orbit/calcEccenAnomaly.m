function E = calcEccenAnomaly(M, e)
% ----------------------------------------------------------------------
%   calculate eccentric anomaly from mean anomaly
%    20160630  y.yoshimura
%    Inputs: M, mean anomaly
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%    E = calcEccenAnomaly(M)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

% M = E - e * sin(E)
fun = @(x) x - e * sin(x) - M;
E = fsolve(fun, M);

