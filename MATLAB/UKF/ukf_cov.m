function Pcov = ukf_cov(x_est, X0, X)
% ----------------------------------------------------------------------
%   calculate the covariance using sigma points
%    20181210  y.yoshimura
%    Inputs: x_est, state vector: nx1 vector
%            X0, sigma points: nx1 vector
%            X, sigma points: nx2*n matrix
%   Outputs: Pcov, a priori covariance: n x n matrix
%   related function files:
%   note: x_est should be column vector
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
global w0c wim

n = length(x_est);
P0 = w0c .* ((X0 - x_est) * (X0 - x_est)');
Pmat = X - kron(x_est, ones(1,2*n));

Pcov = P0 + wim .* Pmat * Pmat';

end