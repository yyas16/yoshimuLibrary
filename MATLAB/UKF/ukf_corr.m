function [Pyy, Pxy] = ukf_corr(x_est, X0, X, y_est, Y0, Y, w0c, wic, R)
% ----------------------------------------------------------------------
%   calculate the correlated covariances
%    20181210  y.yoshimura
%    Inputs: x_est, state vector: nx1 vector
%            X0, sigma points: 1xn vector
%            X, sigma points: 2n x n matrix
%            y_est, a priori estimated measurement vector: mx1  vector
%            Y0, measurement simga points: mx1 vector
%            Y, measurement simga points: 2n x m vector
%            w0c,
%            wic
%            R, measurement noise matrix
%   Outputs: Pyy, measurement covarince: mxm matrix
%            Pxy, correlated covariance: nxm matrix
%   related function files:
%   note: x_est and y_est must be column vector
%   cf:
%   revisions;
%   function [Pyy, Pxy] = ukf_corr(x_est, X0, X, y_est, Y0, Y, w0c, wim)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
x_est = x_est(:); % column vector
X0 = X0(:);
n = length(x_est);

y_est = y_est(:);
Y0 = Y0(:);
m = length(y_est);

% covariance
Pyy0 = w0c * (Y0 - y_est) * (Y0 - y_est)';

Pyy = zeros(m,m);
for i = 1:2*n
    Pyy = Pyy + wic .* (Y(i,:)' - y_est) * (Y(i,:)' - y_est)';
end
Pyy = Pyy0 + Pyy + R;

% cross correlation
Pxy0 = w0c * (X0 - x_est) * (Y0 - y_est)';
Pxy = zeros(n, m);
for i = 1:2*n
    Pxy = Pxy + wic .* (X(i,:)' - x_est) * (Y(i,:)' - y_est)';
end
Pxy = Pxy0 + Pxy;

end