function G = sg3(x, y, z, xi, lam, mu)
% ----------------------------------------------------------------------
%   spherical Gaussian function
%    20200911  y.yoshimura
%    Inputs: x, x-position on sphere, NxM matrix
%            y, y-position on sphere, NxM matrix
%            z, z-position on sphere, NxM matrix
%            xi, lobe directional vector, (unit vector), 1x3 vector
%            lam, sharpness, scalar
%            mu, amplitude, scalar
%   Outputs: G, spherical Gaussian, NxM vector
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------
xi = xi(:); % column vector
xi = xi ./ norm(xi);

G = mu .* exp(lam .* (x.*xi(1)+y.*xi(2)+z.*xi(3) - 1));

end