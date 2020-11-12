function fobs = magInv(m_app, d)
% ----------------------------------------------------------------------
%   inverse calculation of apparent magnitude of object with distance d [m]
%    20201112  y.yoshimura
%    Inputs: m_app: apparent magnitude of object, Nx1 vector
%            d: distance between object and observer, m, Nx1 vector
%   Outputs: fobs: fobs: c_total * (s'*n) * A *  (v'*n), Nx1 vector
%   related function files:
%   note:
%   cf: 'Light Curve Approximation Using an Attitude Model 
%        of Solar Sail Spacecraft' for the definitoin of fobs      
%   revisions;
%   
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

msun = -26.7; % apparent magnitude of Sun

fobs =  d.^2 .* 10.^((m_app - msun) ./ (-2.5));


end