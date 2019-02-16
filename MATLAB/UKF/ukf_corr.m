function [Pyy, Pxy] = ukf_corr(x_est, X0, X, y_est, Y0, Y)
% ----------------------------------------------------------------------
%   calculate the correlated covariances
%    20181210  y.yoshimura
%    Inputs: x_est, state vector: nx1 vector
%            X0, sigma points: nx1 vector
%            X, sigma points: nx2*n matrix
%            y_est, a priori estimated measurement vector: mx1  vector
%            Y0, measurement simga points: mx1 vector
%            Y, measurement simga points: mx2*n vector
%   Outputs: Pyy, measurement covarince: mxm matrix
%            Pxy, correlated covariance: nxm matrix
%   related function files:
%   note: x_est and y_est must be column vector
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
global w0c wim

n = length(x_est);

Pyy0 = w0c * (Y0 - y_est) * (Y0 - y_est)';
Pyymat = Y - y_est;
Pyy = Pyy0 + wim .* Pyymat * Pyymat';
Pxy0 = w0c * (X0 - x_est) * (Y0 - y_est)';
Pmat = X - kron(x_est, ones(1,2*n));
Pxy = Pxy0 + wim .* Pmat * Pyymat';

end