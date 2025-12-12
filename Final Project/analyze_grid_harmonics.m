function [harmonics, harmonic_percent, thd, fund_magnitude] = analyze_grid_harmonics(current_signal, fs, fundamental_freq)
% ANALYZE_GRID_HARMONICS Analyzes current signal and returns harmonic content
%
% Inputs:
%   current_signal: Time-domain current waveform (vector)
%   fs: Sampling frequency in Hz
%   fundamental_freq: Fundamental frequency (typically 50 or 60 Hz)
%
% Outputs:
%   harmonics: Vector of harmonic orders [1, 2, 3, ...]
%   harmonic_percent: Magnitude of each harmonic as % of fundamental
%   thd: Total Harmonic Distortion in %
%   fund_magnitude: Fundamental component magnitude in A

% Validate inputs
if nargin < 3
    error('Requires 3 inputs: current_signal, sampling_freq, fundamental_freq');
end

% Ensure column vector
current_signal = current_signal(:);
N = length(current_signal);

% Perform FFT
Y = fft(current_signal);
P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Frequency vector
f = fs*(0:(N/2))/N;

% Find fundamental component
[~, fund_idx] = min(abs(f - fundamental_freq));
fund_magnitude = P1(fund_idx);

% Calculate harmonics (up to 40th or Nyquist, whichever is lower)
max_harmonic = min(80, floor(fs/(2*fundamental_freq)));
harmonics = 1:max_harmonic;
harmonic_magnitudes = zeros(size(harmonics));

% Extract harmonic magnitudes with tolerance window
for h = 1:max_harmonic
    target_freq = h * fundamental_freq;
    [~, h_idx] = min(abs(f - target_freq));
    % Search in a small window around target frequency
    window_idx = max(1, h_idx-5):min(length(P1), h_idx+5);
    harmonic_magnitudes(h) = max(P1(window_idx));
end

% Calculate percentage relative to fundamental
harmonic_percent = 100 * harmonic_magnitudes / harmonic_magnitudes(1);

% Calculate THD
thd = sqrt(sum(harmonic_magnitudes(2:end).^2)) / harmonic_magnitudes(1) * 100;

% Print results
fprintf('\n=== Harmonic Analysis ===\n');
fprintf('Fundamental frequency: %.2f Hz\n', fundamental_freq);
fprintf('Fundamental magnitude: %.4f A\n', fund_magnitude);
fprintf('Total Harmonic Distortion (THD): %.2f%%\n\n', thd);
fprintf('Dominant Harmonics (> 1%%):\n');
fprintf('Order\tFrequency(Hz)\tMagnitude(%%)\n');
for h = 1:max_harmonic
    if harmonic_percent(h) > 1.0
        fprintf('%d\t\t%.1f\t\t%.2f\n', h, h*fundamental_freq, harmonic_percent(h));
    end
end

end