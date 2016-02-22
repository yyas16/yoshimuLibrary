function blkStruct = slblocks
% Blocksets_and_Toolboxesウィンドウでの表示設定
blkStruct.Name = 'yoshimuLibrary';
blkStruct.OpenFcn = 'astroDynamics';
blkStruct.MaskInitialization = '';
blkStruct.MaskDisplay = '';
% ライブラリブラウザでの表示設定
% 注意：Browserフィールドを設定するときは、構造体配列のインデックス番号を入力
% インデックス番号が未指定の場合とは、以下のような記述です
% Browser.Library = 'mylib';
Browser(1).Library = 'astroDynamics';
Browser(1).Name = 'yoshimuLibrary';
Browser(1).IsFlat = 0;
blkStruct.Browser = Browser;