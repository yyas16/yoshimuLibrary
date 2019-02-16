function [X0, X] = ukf_sigma(lam, P, x)
% ----------------------------------------------------------------------
%   calculate sigma points of the state
%    20181210  y.yoshimura
%    Inputs: lam, tuning parameter for UKF
%            P, covariance matrix, nxn matrix
%            x, state vector, nx1 vector
%   Outputs: X0, sigma points: n x 1 vector
%            X, sigma points: n x 2*n matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

n = length(x);

P_sq = chol(P)';
sig_coeff = [sqrt(n+lam).*P_sq -sqrt(n+lam).*P_sq];

% X sigma points
X0 = x;
X = sig_coeff + kron(x, ones(1, 2*n));

end