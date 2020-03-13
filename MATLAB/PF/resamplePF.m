function [x_resamp,w_resamp,index] = resamplePF(x_particle, w_particle)
% ----------------------------------------------------------------------
%   Systematic Resampling for Particle Filter
%    Inputs: x_particle, particles of state variables, Nxn matrix
%                               N: the number of particle,
%                               n: the number of state variables
%            w_particle, weights, Nxm matrix, 
%                               m: the dimention of obseravations
%   Outputs:
%   related function files:
%   note:
%   cf: Optimal Estimation of Dynamic Systems (2nd ed.) by Crassidis and Junkins
%       p. 283
%   revisions;
%   
%   () 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

% Get Length of Particles
n = length(x_particle);

% Cumulative Sum of Particles
w_particle = w_particle(:);
c = cumsum(w_particle);

% Compute u Vector
u = zeros(n,1);
u(1) = rand(1) ./ n;
u(2:n) = u(1) + (1:n-1)' ./ n;

% Pre-allocate Index
index = zeros(n,1);
% Compute Index for Resampling 
i = 1;
for j = 1:n
    while u(j)>c(i)
        i = i + 1;
    end
    index(j) = i;
end

% Resampled Data
x_resamp = x_particle(index,:);
w_resamp = ones(n,1)./n;
