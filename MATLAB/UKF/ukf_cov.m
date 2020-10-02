function Pcov = ukf_cov(x_est, X0, X, w0c, wic, Q)
% ----------------------------------------------------------------------
%   calculate the covariance using sigma points
%    20181210  y.yoshimura
%    Inputs: x_est, state vector: 1xn vector
%            X0, sigma points: 1xn vector
%            X, sigma points: 2n x n matrix
%            w0c, weight for covariance
%            wic weight for covariance
%            Q, process noise matrix, n x n
%   Outputs: Pcov, a priori covariance: n x n matrix
%   related function files:
%   note: x_est should be column vector
%   cf:
%   revisions;
%   function Pcov = ukf_cov(x_est, X0, X, w0c, wim)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
x_est = x_est(:); % column vector
X0 = X0(:);
n = length(x_est);

P0 = w0c .* ((X0 - x_est) * (X0 - x_est)');

Pmat = zeros(n,n);
for i = 1:n
    Pmat = Pmat + wic .* (X(i,:)' - x_est) * (X(i,:)' - x_est)';
end

Pcov = P0 + Pmat * Pmat' + Q;

end