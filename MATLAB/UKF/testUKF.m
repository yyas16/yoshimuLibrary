% ----------------------------------------------------------------------
%   example: Unscented Kalman Filter
%   algorithmを1.書き下し， 2.functionレベルで書き下し， 3.まるっとfunction化で確認．
%    20181210  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:Optimal Estimation of Dynamic Systems by (2nd ed.) Crassidis and Junkins
%   Example 3.7
%   revisions;
%
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------

clc
clear
close all

global a

% Initialize
dt = 1;
tf = 60;
t = 0:dt:tf;
t = t(:);
m = length(t); % stores samples every second

% parameters
a = 5e-5;
h = 100000;
mm = 100000;
x = zeros(m,3);
x(1,1) = 300000;
x(1,2) = 20000;
x(1,3) = 1e-3;
ym = zeros(m,1);
r = 1e4;
ym(1)=sqrt(mm^2+(x(1,1)-h)^2)+sqrt(r)*randn(1);

% Initial Conditions
Pcov = diag([1e6 4e6 1e-4]);
p = zeros(m,3);
p(1,:) = diag(Pcov)';

x_est = zeros(m,3);
x_est(1,1) = 3 * 10^5;
x_est(1,2) = 2 * 10^4;
x_est(1,3) = 3 * 10^(-5);

% Unscented Filter Parameters
alp = 1;
beta = 2;
kap = 0;
n = 3;
lam = alp^2 * (n + kap) - n;
w0m = lam / (n + lam);
w0c = lam / (n + lam) + (1 - alp^2 + beta);
wim = 1 / (2 * (n + lam));
yez = zeros(1,6);

%  true
[t_out, y_out] = ode45(@eom4testUKF, t, x(1,:));
x = y_out;
% measurements
ym = sqrt(mm.^2 + (y_out(:,1) - h).^2) + sqrt(r) * randn(m,1);

%% UKF
for i = 1:m-1
    P_sq = chol(Pcov)';
    sigV = [sqrt(n+lam).*P_sq -sqrt(n+lam).*P_sq];
    
    x0 = x_est(i,:)';
    xx = sigV + kron(x_est(i,:)' , ones(1,2*n)); % sigma points
    
    tmp2 = ode4(@eom4testUKF, [t(i) t(i+1)], x0);
    x0 = tmp2(end,:)';
    for k = 1:2*n
        tmp2 = ode4(@eom4testUKF, [t(i) t(i+1)], xx(:,k));
        xx(:,k) = tmp2(end,:)';
    end
    %         x0 = deom4testUKF(x0, dt);
    %         xx = deom4testUKF(xx, dt);
    x_est(i+1,:) = w0m .* x0' + wim .* sum(xx,2)';
    
    % covariance
    pp0 = w0c * (x0 - x_est(i+1,:)') * (x0 - x_est(i+1,:)')';
    pmat = xx - kron(x_est(i+1,:)', ones(1,2*n));
    Pcov = pp0 + wim .* pmat * pmat';
    
    % output sigma points
    for j = 1:2*n
        yez(j) = sqrt(mm^2 + (xx(1,j) - h)^2);
    end
    ye0 = sqrt(mm^2 + (x0(1) - h)^2);
    
    % output estimation
    ye = w0m * ye0 + wim * sum(yez,2);
    
    % Calculate pyy
    pyy0 = w0c * (ye0 - ye) * (ye0 - ye)';
    pyymat = yez - ye;
    pyy = pyy0 + wim * pyymat * pyymat';
    
    % Calculate pxy
    pxy0 = w0c * (x0 - x_est(i+1,:)') * (ye0 - ye);
    pxy = pxy0 + wim * pmat * pyymat';
    
    % Innovations Covarinace
    pvv = pyy + r;
    
    % Gain and Update
    gain = pxy * pvv^(-1);
    Pcov = Pcov - gain * pvv * gain';
    p(i+1,:) = diag(Pcov)';
    x_est(i+1,:) = x_est(i+1,:) + (gain * (ym(i+1) - ye))';
end

x_err = x - x_est;

figure
plot(t, abs(x_err(:,1)))

%% UKF using functions
% Initial Conditions
Pcov = diag([1e6 4e6 1e-4]);
p = zeros(m,3);
p(1,:) = diag(Pcov)';

x_est = zeros(m,3);
x_est(1,1) = 3 * 10^5;
x_est(1,2) = 2 * 10^4;
x_est(1,3) = 3 * 10^(-5);

for i = 1:m-1
    
    % sigma points
    [x0 xx] = ukf_sigma(lam, Pcov, x_est(i,:)');
    
    % sigma point update
    tmp2 = ode4(@eom4testUKF, [t(i) t(i+1)], x0);
    x0 = tmp2(end,:)';
    for k = 1:2*n
        tmp2 = ode4(@eom4testUKF, [t(i) t(i+1)], xx(:,k));
        xx(:,k) = tmp2(end,:)';
    end
    x_est(i+1,:) = w0m .* x0' + wim .* sum(xx,2)'; % a priroi estimation
    
    % covariance
    Pcov = ukf_cov(x_est(i+1,:)', x0, xx, w0c, wim);
    
    % output sigma points
    for j = 1:2*n
        yez(j) = sqrt(mm^2 + (xx(1,j) - h)^2);
    end
    ye0 = sqrt(mm^2 + (x0(1) - h)^2);
    
    % a priori output estimation
    ye = w0m * ye0 + wim * sum(yez,2);
    
    % Calculate correlation
    [Pyy, Pxy] = ukf_corr(x_est(i+1,:)', x0, xx, ye, ye0, yez, w0c, wim);
    
    % Innovations Covarinace
    pvv = Pyy + r;
    
    % Gain and Update
    gain = Pxy * pvv^(-1);
    Pcov = Pcov - gain * pvv * gain';
    p(i+1,:) = diag(Pcov)';
    x_est(i+1,:) = x_est(i+1,:) + (gain * (ym(i+1) - ye))';
end

x_err = x - x_est;

figure
plot(t, abs(x_err(:,1)))


%% UKF as a function
% Initial Conditions
Pcov = diag([1e6 4e6 1e-4]);
p = zeros(m,3);
p(1,:) = diag(Pcov)';

x_est = zeros(m,3);
x_est(1,1) = 3 * 10^5;
x_est(1,2) = 2 * 10^4;
x_est(1,3) = 3 * 10^(-5);

% x(1,:)のように引数がmatrixでも計算できるように書くのがポイント．
f = @(x) [ x(1,:) - dt .* x(2,:)
    x(2,:) - exp(-a.*x(1,:)) .* x(2,:).^2 .* x(3,:)
    x(3,:)];
h = @(x) sqrt(mm.^2 + (x(1,:) - h).^2);
B = [0; 0; 0];
Q = 0;
R = r;

P_est = zeros(3, 3, m);
P_est(:,:,1) = Pcov;
for i = 1:m-1
    [P_est(:,:,i+1), x_est(i+1,:)] = ukf(f, h, B, Q, R, lam, P_est(:,:,i), x_est(i,:)', ym(i+1), w0m, w0c, wim);
end

x_err = x - x_est;

figure
plot(t, abs(x_err(:,1)))


