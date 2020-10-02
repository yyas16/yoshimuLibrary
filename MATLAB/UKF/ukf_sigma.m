function [X0, X] = ukf_sigma(lam, P, x)
% ----------------------------------------------------------------------
%   calculate sigma points of the state
%    20181210  y.yoshimura
%    Inputs: lam, tuning parameter of UKF
%            P, covariance matrix, nxn matrix
%            x, state vector, nx1 or 1xn vector
%   Outputs: X0, sigma points: 1xn vector
%            X, sigma points: 2*n x n matrix
%   related function files:
%   note:
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

x = x(:); % column vector
n = length(x);

P_sq = chol(P); % = sqrt(P)

sig = [sqrt(n+lam).*P_sq -sqrt(n+lam).*P_sq]; % n x 2n matrix

% X sigma points
X0 = x';

X = sig + kron(ones(1, 2*n), x);
X = X';

end