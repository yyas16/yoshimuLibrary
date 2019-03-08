function [Pyy, Pxy] = ukf_corr(x_est, X0, X, y_est, Y0, Y, w0c, wim)
% ----------------------------------------------------------------------
%   calculate the correlated covariances
%    20181210  y.yoshimura
%    Inputs: x_est, state vector: nx1 vector
%            X0, sigma points: nx1 vector
%            X, sigma points: nx2*n matrix
%            y_est, a priori estimated measurement vector: mx1  vector
%            Y0, measurement simga points: mx1 vector
%            Y, measurement simga points: mx2*n vector
%            w0c,
%            wim
%   Outputs: Pyy, measurement covarince: mxm matrix
%            Pxy, correlated covariance: nxm matrix
%   related function files:
%   note: x_est and y_est must be column vector
%   cf:
%   revisions;
%   function [Pyy, Pxy] = ukf_corr(x_est, X0, X, y_est, Y0, Y, w0c, wim)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

n = length(x_est);

y_est = y_est(:);

% covariance
Pyy0 = w0c * (Y0 - y_est) * (Y0 - y_est)';
Pyymat = bsxfun(@minus, Y, y_est); % (each sigma point of Y) - y_est
Pyy = Pyy0 + wim .* Pyymat * Pyymat';

% cross correlation
Pxy0 = w0c * (X0 - x_est) * (Y0 - y_est)';
Pmat = bsxfun(@minus, X, x_est);
Pxy = Pxy0 + wim .* Pmat * Pyymat';

end