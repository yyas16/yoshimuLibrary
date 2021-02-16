function [xi3, lam3, mu3] = sgMult(xi1, lam1, mu1, xi2, lam2, mu2)
% ----------------------------------------------------------------------
%   Spherical Gaussians multiplication
%    20210206  y.yoshimura
%    Inputs: xi: lobe axis, 1x3 vector
%            lam: sharpness, scalar
%            mu: amplitude of the SG
%   Outputs: the same as input arguments
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

lam3 = lam1 + lam2;

xi3 = (lam1.*xi1 + lam2.*xi2) ./ lam3;

mu3 = mu1 * mu2 * exp(lam3 * (norm(xi3) - 1));



end