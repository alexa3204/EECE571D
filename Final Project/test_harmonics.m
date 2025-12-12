clear all; clc

%% Case 1: Ideal Grid
L2 = 0;
out_1 = sim(["ideal_grid_case.slx"]);
Isabc_data_1 = out_1.logsout.get('Isabc');
t_full_1 = Isabc_data_1.Values.Time;
Isabc_1 = Isabc_data_1.Values.Data;

% EXTRACT DATA AFTER 0.05s
idx_start_1 = find(t_full_1 >= 0.05, 1, 'first');
Isabc_1 = Isabc_1(idx_start_1:end, :);
t_1 = t_full_1(idx_start_1:end);

% EXTRACT SINGLE PHASE (phase A)
if ndims(Isabc_1) > 2 || size(Isabc_1, 2) > 1
    Ia_1 = squeeze(Isabc_1(:, 1));
else
    Ia_1 = Isabc_1(:);
end

duration_1 = t_1(end) - t_1(1);
fs_1 = length(Ia_1)/duration_1;
fprintf('Signal length: %d samples\n', length(Ia_1));
fprintf('Sampling frequency: %.0f Hz\n', fs_1);
fprintf('Signal range: [%.3f, %.3f]\n', min(Ia_1), max(Ia_1));
plot_grid_harmonics(Ia_1, fs_1, 60);

%% Case 2: L2 = 10 µH
L2 = 10e-6;
out_2 = sim(["resonance_grid_case.slx"]);
Isabc_data_2 = out_2.logsout.get('Isabc');
t_full_2 = Isabc_data_2.Values.Time;
Isabc_2 = Isabc_data_2.Values.Data;

% EXTRACT DATA AFTER 0.05s
idx_start_2 = find(t_full_2 >= 0.05, 1, 'first');
Isabc_2 = Isabc_2(idx_start_2:end, :);
t_2 = t_full_2(idx_start_2:end);

% EXTRACT SINGLE PHASE (phase A)
if ndims(Isabc_2) > 2 || size(Isabc_2, 2) > 1
    Ia_2 = squeeze(Isabc_2(:, 1));
else
    Ia_2 = Isabc_2(:);
end

duration_2 = t_2(end) - t_2(1);
fs_2 = length(Ia_2)/duration_2;
fprintf('Signal length: %d samples\n', length(Ia_2));
fprintf('Sampling frequency: %.0f Hz\n', fs_2);
fprintf('Signal range: [%.3f, %.3f]\n', min(Ia_2), max(Ia_2));
plot_grid_harmonics(Ia_2, fs_2, 60);

%% Case 3: L2 = 50 µH
L2 = 50e-6;
out_3 = sim(["resonance_grid_case.slx"]);
Isabc_data_3 = out_3.logsout.get('Isabc');
t_full_3 = Isabc_data_3.Values.Time;
Isabc_3 = Isabc_data_3.Values.Data;

% EXTRACT DATA AFTER 0.05s
idx_start_3 = find(t_full_3 >= 0.05, 1, 'first');
Isabc_3 = Isabc_3(idx_start_3:end, :);
t_3 = t_full_3(idx_start_3:end);

% EXTRACT SINGLE PHASE (phase A)
if ndims(Isabc_3) > 2 || size(Isabc_3, 2) > 1
    Ia_3 = squeeze(Isabc_3(:, 1));
else
    Ia_3 = Isabc_3(:);
end

duration_3 = t_3(end) - t_3(1);
fs_3 = length(Ia_3)/duration_3;
fprintf('Signal length: %d samples\n', length(Ia_3));
fprintf('Sampling frequency: %.0f Hz\n', fs_3);
fprintf('Signal range: [%.3f, %.3f]\n', min(Ia_3), max(Ia_3));
plot_grid_harmonics(Ia_3, fs_3, 60);

%%
% Analyze three different current signals
[h1, hp1, thd1, ~] = analyze_grid_harmonics(Ia_1, fs_1, 60);
[h2, hp2, thd2, ~] = analyze_grid_harmonics(Ia_2, fs_2, 60);
[h3, hp3, thd3, ~] = analyze_grid_harmonics(Ia_3, fs_3, 60);

% Create comparison bar plot
figure('Position', [100, 100, 900, 500]);
x = h1;  % Harmonic orders
width = 0.25;

bar(h1(2:end) - width, hp1(2:end), width, 'FaceColor', [0.8 0.2 0.2]);
hold on;
bar(h2(2:end), hp2(2:end), width, 'FaceColor', [0.2 0.2 0.8]);
bar(h3(2:end) + width, hp3(2:end), width, 'FaceColor', [0.2 0.7 0.2]);

xlabel('Harmonic Order', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('I_h/I_1 (%)', 'FontSize', 12, 'FontWeight', 'bold');
title('Grid Current Harmonic Spectrum Comparison', 'FontSize', 14);
legend(sprintf('Case 1 (THD=%.2f%%)', thd1), ...
       sprintf('Case 2 (THD=%.2f%%)', thd2), ...
       sprintf('Case 3 (THD=%.2f%%)', thd3), 'Location', 'best');
grid on;
xlim([0 max(h1)+1]);
xticks([2 3 4 5 6 7 8 9 10 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39]);
hold off;

%% TEST CASE 1: Pure Sinusoid (Should show NO harmonics)
% % This tests for false positives - any harmonics indicate algorithm error
% clear; clc;
% 
% fs = 10000;
% f0 = 60;
% n_periods = 10;  % Use integer periods for clean FFT
% duration = n_periods / f0;
% t = 0:1/fs:(duration - 1/fs);
% 
% % Pure 10A fundamental, ZERO harmonics
% current_pure = 10 * sin(2*pi*f0*t);
% 
% fprintf('\n========== TEST 1: PURE SINUSOID ==========\n');
% fprintf('Expected: All harmonics < 0.01%% (numerical noise only)\n');
% plot_grid_harmonics(current_pure, fs, f0);
% 
% %% TEST CASE 2: Fundamental + Known 5th Harmonic
% % This tests accuracy - we know exactly what harmonics exist
% clear; clc;
% 
% fs = 10000;
% f0 = 60;
% n_periods = 10;
% duration = n_periods / f0;
% t = 0:1/fs:(duration - 1/fs);
% 
% % 10A fundamental + 0.5A at 5th harmonic (5% of fundamental)
% current_harmonic = 10*sin(2*pi*f0*t) + 0.5*sin(2*pi*5*f0*t);
% 
% fprintf('\n========== TEST 2: 5th HARMONIC ==========\n');
% fprintf('Expected: 5th harmonic = 5.00%%, all others < 0.01%%\n');
% plot_grid_harmonics(current_harmonic, fs, f0);
