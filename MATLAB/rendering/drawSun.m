function drawSun(rotAngle)
%% Textured 3D Sun
%
%

%% Options

space_color = 'w';
npanels = 180;   % Number of globe panels around the equator deg/panel = 360/npanels
alpha   = 0.8; % globe transparency level, 1 = opaque, through 0 = invisible

% texture image
% Anything imread() will handle, but needs to be a 2:1 unprojected globe
% image.

image_file = 'sun.jpg';

% Mean spherical earth
GMST0 = 0;
erad    = 6.96 * 10^8; % equatorial radius (meters)
prad    = 6.96 * 10^8; % polar radius (meters)
erot    = 2.663e-6; % Sun rotation rate (radians/sec), Ž©“]27“ú‚UŽžŠÔ‚R‚U•ª
global F ind
%% Create figure
% figure(333);
fig = gcf;
fig.Color = space_color;
hold on;

% Turn off the normal axes

set(gca, 'NextPlot','add', 'Visible','off');

axis equal;
% axis auto;
% axis([-1e+8,1e+8,-1e+8,1e+8])

% % Set initial view
% view(0,30);
% axis vis3d;

%% Create wireframe globe

% Create a 3D meshgrid of the sphere points using the ellipsoid function

[x, y, z] = ellipsoid(0, 0, 0, erad, erad, prad, npanels);
globe = surf(x, y, -z, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);
if ~isempty(GMST0)
    hgx = hgtransform;
    temp = makehgtform('translate',[1.496e+11, 0,0]); 
    set(hgx,'Matrix', temp);
    set(globe,'Parent',hgx);
end

%% Texturemap the globe

% Load Earth image for texture map

cdata = imread(image_file);

% Set image as color data (cdata) property, and set face color to indicate
% a texturemap, which Matlab expects to be in cdata. Turn off the mesh edges.
set(globe,'FaceColor', 'texturemap', 'CData', cdata, 'FaceAlpha', alpha, 'EdgeColor', 'none');
drawnow
F(ind) = getframe(gcf);

ind = ind + 1;
end