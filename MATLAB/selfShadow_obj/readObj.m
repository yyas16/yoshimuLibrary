function satellite = readObj(filename, n)
% ----------------------------------------------------------------------
%   read obj and mtl file (wrapping function)
%    20200909  y.yoshimura
%    Inputs: filename: file name for both obj and mtl files
%            n, the number of component (object)
%   Outputs: satellite: structure contains vertices, indices, etc.
%   related function files:
%   note:
%   cf:
%   revisions;
%   function satellite = readObj(filename)
%   (c) 2020 yasuhiro yoshimura
%----------------------------------------------------------------------

%% load object
% いったん変数objに読み込む
obj = read_wobj(filename);

nCompo = n; % the number of components, modellingによって変更する
satellite.vertices = obj.vertices; % all vertices, Nx3 matrix
tmp = [];
for i = 1:nCompo
    tmp = [tmp
        obj.objects(4*i).data.vertices];
end
satellite.faces = tmp; % face indices
[satellite.area, satellite.pos] = calcArea_obj(satellite);  % face areas
satellite.normal = calcNormal_obj(satellite); % face normal vectors
satellite.Ca = ones(length(satellite.faces),1) .* obj.material(3).data(1); % objファイルの定義はcolorだが，とりあえず
satellite.Cd = ones(length(satellite.faces),1) .* obj.material(4).data(1);
satellite.Cs = ones(length(satellite.faces),1) .* obj.material(5).data(1);

end