function dxdt = eom4testUKF(t, x)
% ----------------------------------------------------------------------
%   equtions of motion for testUKF.m
%    20181210  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2018 yasuhiro yoshimura
%---------------------------------------------------------------------- 
global a

dxdt = [-x(2)
    -exp(-a*x(1)) * x(2)^2 * x(3)
    0];

end