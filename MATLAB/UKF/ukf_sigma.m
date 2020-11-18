function [X0, X] = ukf_sigma(lam, P, x, varargin)
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
switch nargin %入力引数の数で場合わけ
    case 3
        matSqrt = 'svd'; % matrix square root by SVD
    case 4
        if strcmp(varargin{:}, 'chol')
            matSqrt = 'chol'; %最後の引数にcholという文字列を入れた場合cholesky decomposition
        else
            matSqrt = 'svd';
        end
    otherwise
        error('invalid number of arguments')
end

x = x(:); % column vector
n = length(x);

if strcmp(matSqrt, 'chol')
    P_sq = chol(P)'; % = sqrt(P)
else % SVD
    [U, S, ~] = svd(P);
    P_sq = U * sqrt(S);
end

sig = [sqrt(n+lam).*P_sq -sqrt(n+lam).*P_sq]; % n x 2n matrix

% X sigma points
X0 = x';

X = sig + kron(ones(1, 2*n), x);
X = X';

end