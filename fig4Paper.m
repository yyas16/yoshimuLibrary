function fig4Paper
% figureðpaperpÉ²®&Û¶


% %% tHg
set(gca,'FontSize',12);
set(gca,'FontName','Times New Roman');
set(gca,'FontWeight','normal'); % normal/demi/bold
 
% %% üÌ
set(gca,'LineWidth', 1.0); % ²
 
% %% vbgÌF
clorder = ...
    [255,   0,   0; % Ô
       0, 128,   0; % Î
     0,   0, 255; % Â
     204,   8, 204; % 
     222, 125,   0; % 
      64,  64,  64];% Z¢DF  
set(gca,'ColorOrder',clorder/255);
 
% %% Å©çgrid on & box on
set(gca,'XGrid','on');
set(gca,'YGrid','on');
set(gca,'ZGrid','on');

print -depsc2 -tiff fig1.eps

end