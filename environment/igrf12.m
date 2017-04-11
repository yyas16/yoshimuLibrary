function b = igrf12(geoType, sv, fyear, alt, lat, lon)
% ----------------------------------------------------------------------
%    calculate magnetic field with IGRF12 model
%    20160420  y.yoshimura
%    Inputs: geoType, 0: geocentric, 1: geodetic
%            sv,      0: not consider secular variation, 1: consider
%            fyear, fractional year, must be >= 2015, e.g., 2015.3
%            alt, latitude above sea level, km
%            lat, latitude, rad
%            lon, longitude, rad
%   Outputs: b, magnetic field in North-East-Down(NED) coordinates, nT
%            1x3 vector
%   related function files:
%   note: check with IGRF Synthesis Form
%          at http://www.geomag.bgs.ac.uk/data_service/models_compass/igrf_form.shtml
%          最大100 nTくらいずれる．．．．
%
%   cf: 
%   revisions;
%   b = igrf12(geoType, sv, fyear, alt, lat, lon)
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------

Re = 6371.2;        % reference radius, km
cl = zeros(1,13);
sl = zeros(1,13);

% colatitude, rad
colat = pi / 2 - lat;

% read coefficients
[gn, gm, gval, gsv] = textread('igrfSg.txt', '%f %f %f %f');
[hn, hm, hval, hsv] = textread('igrfSh.txt', '%f %f %f %f');

N = max(gn);
g = zeros(N, N+1);
h = zeros(N, N+1);

if sv == 0
    for x = 1:length(gn)
        g(gn(x),gm(x)+1) = gval(x);
        h(hn(x),hm(x)+1) = hval(x);
    end
else
    for x = 1:length(gn)
        g(gn(x),gm(x)+1) = gval(x) + gsv(x) * (fyear - floor(fyear));
        h(hn(x),hm(x)+1) = hval(x) + hsv(x) * (fyear - floor(fyear));
    end
end

if (geoType == 1)
    %     //     conversion from geodetic to geocentric coordinates
    %     //    (using the WGS84 spheroid)    
    a2 = 40680631.6;
    b2 = 40408296.0;
    temp = a2 * sin(colat)^2 + b2 * cos(colat)^2;
    rho = sqrt(temp);
    r = sqrt(alt * (alt + 2.0 * rho)...
        + (a2^2 * sin(colat)^2 + b2^2 * cos(colat)^2) / temp);
else
    r = alt + Re;
    
end


% Initialize each of the variables
% Br        B in the radial driection
% Bt        B in the theta direction
% Bp        B in the phi direction%
% P         The associated Legendre polynomial evaluated at cos(theta)
%           The nomenclature for the recursive values generally follows
%           the form P10 = P(n-1,m-0)
% dP        The partial derivative of P with respect to theta

Br = 0;
Bt = 0;
Bp = 0;
P11 = 1;
P10 = P11;
dP11 = 0;
dP10 = dP11;

theta = colat;
phi   = lon;
for m = 0:N
    for n = 1:N
        if m <= n
            % Calculate Gauss  functions, P^{n,m}, and derivatives recursively
            if n == m
                P2  = sin(theta) * P11; % P^{n,m} or P^{n,n}のこと
                dP2 = sin(theta) * dP11 + cos(theta) * P11;
                P11 = P2; % P^{n-1, n-1}のこと
                P10 = P11;
                P20 = 0;
                
                dP11 = dP2;
                dP10 = dP11;
                dP20 = 0;
            elseif n == 1
                P2  = cos(theta) * P10;
                dP2 = cos(theta) * dP10 - sin(theta) * P10;
                P20 = P10;
                P10 = P2;
                
                dP20 = dP10;
                dP10 = dP2;
            else
                K = ((n-1)^2 - m^2) / ((2 * n - 1) * (2 * n - 3));
                P2 = cos(theta) * P10 - K * P20;
                dP2 = cos(theta) * dP10 - sin(theta) * P10 - K * dP20;
                P20 = P10;
                P10 = P2;
                
                dP20 = dP10;
                dP10 = dP2;
            end
            
            % Calculate Br, Bt, and Bp
            Br = Br + (Re/r)^(n+2) * (n + 1) ...
                * ((g(n,m+1) * cos(m * phi) + h(n,m+1) * sin(m * phi)) * P2);
            Bt = Bt + (Re/r)^(n+2)...
                *((g(n,m+1) * cos(m*phi) + h(n,m+1) * sin(m*phi)) * dP2);
            Bp = Bp + (Re/r)^(n+2)...
                * (m*(-g(n,m+1)*sin(m*phi) + h(n,m+1)*cos(m*phi)) * P2);
        end
    end
end

% [radius, south, east] coordinate
b = [Br % -Z
    -Bt % -X
    -Bp/sin(theta)]; %ここで -1/sin(theta)の項を付加 Y

% NED coordinate
b = [-b(2)
    b(3)
    -b(1)];

end