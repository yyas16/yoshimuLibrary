function fig4Paper
% figureをpaper用に調整&保存


% %% フォント
set(gca,'FontSize',12);
set(gca,'FontName','Times New Roman');
set(gca,'FontWeight','normal'); % normal/demi/bold
 
% %% 線の幅
set(gca,'LineWidth', 1.0); % 軸
 
% %% プロットの色
clorder = ...
    [255,   0,   0; % 赤
       0, 128,   0; % 緑
     0,   0, 255; % 青
     204,   8, 204; % 紫
     222, 125,   0; % 茶
      64,  64,  64];% 濃い灰色  
set(gca,'ColorOrder',clorder/255);
 
% %% 最初からgrid off & box on
set(gca,'XGrid','off');
set(gca,'YGrid','off');
set(gca,'ZGrid','off');

% print -depsc2 -tiff fig1.eps
saveas(gcf,'fig1','svg');

end