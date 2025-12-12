%% Input Admittance Analysis for VSC with Series-Compensated Line
% Based on Harnefors et al., IEEE Trans. Ind. Electron., 2007

clear; clc; close all;

%% System Parameters (in p.u.)
% Base values
f_base = 50; % Hz
omega_base = 2*pi*f_base;
omega1 = 1; % p.u. synchronous frequency

% VSC Parameters
L = 0.2; % Filter inductance (p.u.)
alpha_c = 5; % Current control bandwidth (p.u.)
alpha_f = 5; % Feedforward filter bandwidth (p.u.)
alpha_d = 0.4; % DC voltage control bandwidth (p.u.)
alpha_p = 0.4; % PLL bandwidth (p.u.)
ki = 0; % Integral gain (set to zero for stability)

% Grid Parameters - Series Compensated Line
L1 = 0.2; % Line inductance 1 (p.u.)
L2 = 0.2; % Line inductance 2 (p.u.)
C = 20; % Series capacitor (p.u.)
r = 0; % Series resistance (p.u. - set to 0 initially)

% Operating Point
E0 = 1; % PCC voltage magnitude (p.u.)
P0 = 0; % Active power (p.u.) - vary for different cases
Q0 = 0; % Reactive power (p.u.)

%% Frequency Range
omega = logspace(-2, 1, 1000); % Frequency range in p.u.
s = 1j*omega;

%% Calculate Ideal Input Admittance Yi(s)
% From equation (11) with ki = 0
Yi = zeros(size(s));
for k = 1:length(s)
    Yi(k) = s(k)^2 / (L*(s(k) + alpha_c)*(s(k) + alpha_f));
end

%% Calculate Grid Impedance Z(s)
% From equation (54)
Z = zeros(size(s));
for k = 1:length(s)
    Z(k) = r + (s(k) + 1j*omega1)*L1 + ...
           1/((s(k) + 1j*omega1)*C) + (s(k) + 1j*omega1)*L2;
end

%% Calculate Full Input Admittance Components Y(s)
% From equations (39) and (40)

% PLL transfer function
G_PLL = zeros(size(s));
for k = 1:length(s)
    G_PLL(k) = alpha_p/E0 / (s(k) + alpha_p);
end

% Current control closed-loop transfer function
gc = zeros(size(s));
for k = 1:length(s)
    gc(k) = alpha_c / (s(k) + alpha_c);
end

% Direct voltage controller transfer function components
Gd_dc = zeros(size(s));
for k = 1:length(s)
    numerator = (s(k)^2/(L*(s(k) + alpha_c)*(s(k) + alpha_f)) + ...
                 P0/E0^2 - (P0/E0^2)*gc(k)*alpha_d/(s(k) + alpha_d)) * ...
                 alpha_d/(s(k) + alpha_d);
    denominator = s(k)*1 + gc(k)*alpha_d/(s(k) + alpha_d); % Assuming Cdc = 1 p.u.
    Gd_dc(k) = numerator / denominator + P0*alpha_d/(E0^2*(s(k) + alpha_d));
end

Gq_dc = zeros(size(s));
for k = 1:length(s)
    Gq_dc(k) = Q0*alpha_d/(s(k) + alpha_d) / ...
               (E0^2*(s(k)*1 + gc(k)*alpha_d/(s(k) + alpha_d)));
end

% Input admittance matrix elements
Ydd = zeros(size(s));
Yqq = zeros(size(s));
Yqd = zeros(size(s));
Ydq = zeros(size(s));

for k = 1:length(s)
    % Y_dd(s) from equation (40)
    Ydd(k) = s(k)^2/(L*(s(k)^2 + alpha_c*s(k) + alpha_c*alpha_d)*(s(k) + alpha_f)) - ...
             P0/E0^2 * alpha_c*alpha_d*(2*s(k) + alpha_d) / ...
             ((s(k)^2 + alpha_c*s(k) + alpha_c*alpha_d)*(s(k) + alpha_d));
    
    % Y_qd(s) from equation (40)
    Yqd(k) = Q0/E0^2 * (alpha_c*alpha_d/(s(k)^2 + alpha_c*s(k) + alpha_c*alpha_d) + ...
                        alpha_p/(s(k) + alpha_p));
    
    % Y_dq(s) from equation (40) - assuming kpa = 0
    Ydq(k) = 0;
    
    % Y_qq(s) from equation (40)
    Yqq(k) = s(k)^2/(L*(s(k) + alpha_c)*(s(k) + alpha_f)*(s(k) + alpha_p)) + ...
             P0/E0^2 * alpha_p/(s(k) + alpha_p);
end

%% Calculate Open-Loop Transfer Function Y(s)Z(s)
% For eigenvalue analysis
YZ_11 = Ydd .* Z;
YZ_22 = Yqq .* Z;
YZ_12 = Ydq .* Z;
YZ_21 = Yqd .* Z;

%% Calculate Closed-Loop Poles
% Poles of 1/(1 + Yi(s)Z(s)) for ideal case
poles_ideal = [];
% Use root finding on characteristic equation
% For display purposes, find approximate poles

fprintf('=== Series-Compensated Line Analysis ===\n\n');

% Find resonance frequency (in stationary frame)
omega_res_stat = 1/sqrt(L1*C);
fprintf('LC Resonance frequency (stationary frame): %.3f p.u.\n', omega_res_stat);
fprintf('LC Resonance frequency (synchronous frame): ~%.3f p.u.\n\n', omega_res_stat - omega1);

%% Plot Results
figure('Position', [100 100 1200 800]);

% Plot 1: Real part of Ydd
subplot(2,2,1);
semilogx(omega, real(Ydd), 'b-', 'LineWidth', 1.5);
grid on; hold on;
plot([omega(1) omega(end)], [0 0], 'k--', 'LineWidth', 1);
xlabel('\omega (p.u.)');
ylabel('Re\{Y_{dd}(j\omega)\} (p.u.)');
title(sprintf('Input Admittance Y_{dd}: P_0 = %.1f p.u.', P0));
xlim([omega(1) omega(end)]);

% Plot 2: Real part of Yqq
subplot(2,2,2);
semilogx(omega, real(Yqq), 'r-', 'LineWidth', 1.5);
grid on; hold on;
plot([omega(1) omega(end)], [0 0], 'k--', 'LineWidth', 1);
xlabel('\omega (p.u.)');
ylabel('Re\{Y_{qq}(j\omega)\} (p.u.)');
title(sprintf('Input Admittance Y_{qq}: P_0 = %.1f p.u.', P0));
xlim([omega(1) omega(end)]);

% Plot 3: Grid Impedance
subplot(2,2,3);
semilogx(omega, abs(Z), 'g-', 'LineWidth', 1.5);
grid on;
xlabel('\omega (p.u.)');
ylabel('|Z(j\omega)| (p.u.)');
title('Grid Impedance Magnitude');
xlim([omega(1) omega(end)]);

% Plot 4: Phase of Grid Impedance
subplot(2,2,4);
semilogx(omega, angle(Z)*180/pi, 'm-', 'LineWidth', 1.5);
grid on;
xlabel('\omega (p.u.)');
ylabel('\angleZ(j\omega) (degrees)');
title('Grid Impedance Phase');
xlim([omega(1) omega(end)]);

%% Stability Analysis using Eigenvalues
% Calculate eigenvalues of Y(s) + Y^H(s) matrix
lambda_min = zeros(size(omega));
lambda_max = zeros(size(omega));

for k = 1:length(omega)
    % Form Y + Y^H matrix (equation 47-48)
    a = 2*real(Ydd(k));
    b = 2*real(Yqq(k));
    c = Ydq(k) + conj(Yqd(k));
    
    % Eigenvalues
    lambda = [a, c; conj(c), b];
    eig_vals = eig(lambda);
    lambda_min(k) = min(real(eig_vals));
    lambda_max(k) = max(real(eig_vals));
end

figure('Position', [100 100 1000 400]);
semilogx(omega, lambda_min, 'b-', 'LineWidth', 2); hold on;
semilogx(omega, lambda_max, 'r-', 'LineWidth', 2);
plot([omega(1) omega(end)], [0 0], 'k--', 'LineWidth', 1);
grid on;
xlabel('\omega (p.u.)');
ylabel('\lambda [Y(j\omega) + Y^H(j\omega)]');
title('Eigenvalues of Admittance Matrix (Power Dissipation Criterion)');
legend('\lambda_{min}', '\lambda_{max}', 'Zero line', 'Location', 'best');
xlim([omega(1) omega(end)]);

% Find negative conductance region
neg_cond_idx = find(lambda_min < 0);
if ~isempty(neg_cond_idx)
    fprintf('Negative conductance region: %.3f to %.3f p.u.\n', ...
            omega(neg_cond_idx(1)), omega(neg_cond_idx(end)));
    % Estimate from equation (50) for P0 = 0
    omega_xd_theory = sqrt(alpha_c*alpha_d*alpha_f/(alpha_c + alpha_f));
    fprintf('Theoretical upper boundary (eq. 50): %.3f p.u.\n\n', omega_xd_theory);
else
    fprintf('System has positive conductance for all frequencies (passive)\n\n');
end

%% Parametric Study
figure('Position', [100 100 1200 400]);

% Vary integral gain
ki_values = [0, 0.17, 1.0];
colors = ['b', 'r', 'g'];

for i = 1:length(ki_values)
    ki_test = ki_values(i);
    omega_xi = sqrt(alpha_f*ki_test/((alpha_c + alpha_f)*L));
    
    subplot(1,3,i);
    semilogx(omega, real(Ydd), colors(i), 'LineWidth', 1.5); hold on;
    plot([omega(1) omega(end)], [0 0], 'k--', 'LineWidth', 1);
    if omega_xi > 0
        plot([omega_xi omega_xi], ylim, 'r--', 'LineWidth', 1);
    end
    grid on;
    xlabel('\omega (p.u.)');
    ylabel('Re\{Y_{dd}(j\omega)\}');
    title(sprintf('k_i = %.2f p.u., \\omega_{xi} = %.3f p.u.', ki_test, omega_xi));
    xlim([omega(1) omega(end)]);
end

fprintf('Code execution completed.\n');
fprintf('Refer to figures for input admittance characteristics.\n');

%% 
% Numerical approach - faster for complex systems
clear; clc;

% Parameters (in per unit)
L = 0.2;
L1 = 0.2;
L2 = 0.2;
C = 20;
r = 0;
omega1 = 1;
alpha_c = 0.64; 
alpha_f = 5;
kp = L*alpha_c; 
ki = 0; 

% Create transfer function using Control System Toolbox
s = tf('s');
j = 1i;

% Branch 1: Series-compensated line
Z1 = r + (s + j*omega1)*L1 + 1/((s + j*omega1)*C);

% Branch 2: Rest of grid
Z2 = (s + j*omega1)*L2;

% Grid impedance - parallel combination
Z = (Z1 * Z2) / (Z1 + Z2);

% Input admittance without control
%Yi = 1/((s + j*omega1)*L);

% Input admittance with control 
%Yi = s/[L*(s + alpha_c)*(s + alpha_f)];

% Input admittance with control (including ki)
%Yi = s^2 / (L*s^2 + kp*s + ki) / (s + alpha_f);

% Input admittance with control no voltage feedforward
Yi = s / (L*s^2 + kp*s + ki) ;

% Characteristic transfer function: 1 + Yi(s)*Z(s)
H = 1 + Yi * Z;

% Minimize and get poles (zeros of the characteristic equation)
H_min = minreal(H);

% The poles we want are actually the zeros of H
% Get numerator and find its roots
[num, den] = tfdata(H_min, 'v');
poles_numeric = roots(num);

% Display results
disp('Poles without control:')
for i = 1:length(poles_numeric)
    if abs(real(poles_numeric(i))) < 1e-6
        fprintf('s_%d = %.4fj\n', i, imag(poles_numeric(i)))
    else
        fprintf('s_%d = %.4f %+.4fj\n', ...
            i, real(poles_numeric(i)), imag(poles_numeric(i)))
    end
end

% Plot
figure;
plot(real(poles_numeric), imag(poles_numeric), 'bx', 'MarkerSize', 12, 'LineWidth', 2)
grid on
xlabel('Real axis (p.u.)')
ylabel('Imaginary axis (p.u.)')
title('Pole locations without control')
hold on
xline(0, 'k--', 'LineWidth', 0.5)
yline(0, 'k--', 'LineWidth', 0.5)