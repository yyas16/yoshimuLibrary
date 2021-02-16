function G = sg(x, xi, lam, mu)
% ----------------------------------------------------------------------
%   spherical Gaussian function
%    20200911  y.yoshimura
%    Inputs: x, position on sphere, Nx3 matrix
%            xi, lobe directional vector, (unit vector), 1x3 vector
%            lam, sharpness, scalar
%            mu, amplitude, scalar
%   Outputs: G, spherical Gaussian, Nx1 vector
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------
xi = xi(:); % column vector
xi = xi ./ norm(xi);

x = x ./ vecnorm(x, 2, 2);

G = mu .* exp(lam .* (x * xi - 1));

end