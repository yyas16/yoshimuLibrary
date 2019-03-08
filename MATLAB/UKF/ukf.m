function [P_est, x_est] = ukf(f, h, B, Q, R, lam, P, x, y, w0m, w0c, wim)
% ----------------------------------------------------------------------
%   Unscented Kalman Filter
%    20181210  y.yoshimura
%    Inputs: f, system descrete dynamics: x(k+1) = f(x(k)), nx1 vector
%            h, observation: y(k) = h(x(k)), mx1 vector
%            B, system noise sensitivity matrix, n x r matrix
%            Q, system noise: rx1 vector
%            R, observation noise: mx1 vector
%            lam, tuning parameter for UKF
%            P, covariance matrix, nxn matrix
%            x, state vector, nx1 vector
%            y, observation vector, mx1 vector
%   
%   Outputs: P_est, estimated covariance matrix, nxn matrix
%            x_est, estimated state, nx1 vector
%   related function files: ukf_sigma, ukf_cov, ukf_corr, testUKF
%   note: 
%   cf:
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
% sigma points
[X0, X] = ukf_sigma(lam, P, x);

% sigma point propagation
X0 = f(X0);
X = f(X);

% a priroi estimation, 1xn vector
x_est = w0m .* X0' + wim .* sum(X,2)';

% covariance
P = ukf_cov(x_est', X0, X, w0c, wim);

% output sigma points
Y = h(X);
Y0 = h(X0);

% a priori output estimation, mx1 vector
y_est = w0m .* Y0' + wim .* sum(Y,2)';

% Calculate correlation
[Pyy, Pxy] = ukf_corr(x_est', X0, X, y_est, Y0, Y, w0c, wim);

% Innovations Covarinace
Pvv = Pyy + R;

% Gain and Update
K = Pxy * Pvv^(-1);
P_est = P - K * Pvv * K';
x_est = x_est + (K * (y - y_est))';

end