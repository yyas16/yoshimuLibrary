function ghNormalize(year)
% ----------------------------------------------------------------------
%   convert coefficients with Schmidt quasi-normalization(IGRF12 original)
%            to the one with Gaussian normalized
%    20160420  y.yoshimura
%    Inputs: year, 1900--2015
%   Outputs:
%   related function files: igrf.txt
%   note:
%   cf. Hanspeter Schaub.info
%       Mathematical Modeling of Earth’s Magnetic Field
%   also cf. 1	Wertz, J. R., Spacecraft Attitude Determination and Control, Springer, 1978.
%               Appendix H., Eq.(H-6)
%   revisions; S(n,m)のindexであるnも0:N+1までforで回すように変更し，最後にn=0を削除 
%   (c) 2016 yasuhiro yoshimura
%----------------------------------------------------------------------
 % IGRF公式のtxtからヘッダの３行をなくしたもの
 
% [gh, n, m, val, sv] = textread('igrf12coeffs.txt','%s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');
coeffs = importdata('igrf12coeffs.txt'); 
strYear = strcat(num2str(year), '.0'); % 2010.0 の形にする
temp = strfind(coeffs.textdata(1,:), strYear);

%目的の年代が何列目かを判定
for i = 1:length(temp)
    if (temp{i} == 1)
       ind = i; 
    end
end

gh  = coeffs.textdata(2:end,1); % 1905等のヘッダも含んでいるので2:endを抽出
n   = coeffs.data(:,1);
m   = coeffs.data(:,2);
val = coeffs.data(:,ind-1); % coeffs.dataに最左列は含まれてないので -1
sv  = coeffs.data(:,end);

N   = max(n);
g   = zeros(N+1, N+1);
h   = zeros(N+1, N+1);
hsv = zeros(N+1, N+1);
gsv = zeros(N+1, N+1);

for x=1:length(gh)
    if strcmp(gh(x),'g') % compare g or h
        g(n(x)+1, m(x)+1)   = val(x); % MATLABの配列が１からなので m(x)+1
        gsv(n(x)+1, m(x)+1) = sv(x);
    else
        h(n(x)+1, m(x)+1) = val(x);
        hsv(n(x)+1, m(x)+1) = sv(x);
    end
end

% MATLABの配列が１からなのでindexがずれる．．
count=1;
S = zeros(N+1,N+1);
for n = 0:N % order of spherical harmonics functions
    for m = 0:n
        if m > 1
            S(n+1,m+1) = S(n+1,m) * ((n - m + 1) / (n + m))^0.5;
        elseif m > 0 % m == 1, kronecker deltaが効くとき
            S(n+1,m+1) = S(n+1,m) * (2 * (n - m + 1) / (n + m))^0.5; 
        elseif n == 0
            S(n+1,1) = 1;
        else 
            S(n+1,1) = S(n,1) * (2 * n - 1) / (n);
        end
        gS(count,1) = n; 
        gS(count,2) = m;
        gS(count,3) = S(n+1,m+1) * g(n+1, m+1);
        gS(count,4) = S(n+1,m+1) * gsv(n+1,m+1);
        hS(count,1) = n;
        hS(count,2) = m;
        hS(count,3) = S(n+1,m+1) * h(n+1,m+1); 
        hS(count,4) = S(n+1,m+1) * hsv(n+1,m+1);
        count=count+1;
        
    end
end
gS(1,:) = []; % n=0, m= 0を削除
hS(1,:) = [];

dlmwrite('igrfSg.txt',gS,'\t')
dlmwrite('igrfSh.txt',hS,'\t')
end