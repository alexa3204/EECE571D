function plot_grid_harmonics(current_signal, fs, fundamental_freq)
% PLOT_GRID_HARMONICS Analyzes current signal and plots harmonic content
%
% Inputs:
%   current_signal: Time-domain current waveform (vector)
%   fs: Sampling frequency in Hz
%   fundamental_freq: Fundamental frequency (typically 50 or 60 Hz)
%
% Example usage:
%   t = 0:1/10000:1;  % 1 second at 10 kHz sampling
%   current = 10*sin(2*pi*60*t) + 0.5*sin(2*pi*300*t);  % 60 Hz + 5th harmonic
%   plot_grid_harmonics(current, 10000, 60);

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
    max_harmonic = min(40, floor(fs/(2*fundamental_freq)));
    harmonics = 1:max_harmonic;
    harmonic_magnitudes = zeros(size(harmonics));
    
    % Extract harmonic magnitudes with tolerance window
    freq_tolerance = fundamental_freq * 0.1;  % 10% tolerance
    
    for h = 1:max_harmonic
        target_freq = h * fundamental_freq;
        [~, h_idx] = min(abs(f - target_freq));
        
        % Search in a small window around target frequency
        window_idx = max(1, h_idx-5):min(length(P1), h_idx+5);
        harmonic_magnitudes(h) = max(P1(window_idx));
    end
    
    % Calculate percentage relative to fundamental
    harmonic_percent = 100 * harmonic_magnitudes / fund_magnitude;
    
    % Create bar plot similar to Figure 5
    figure('Position', [100, 100, 800, 500]);
    bar(harmonics, harmonic_percent, 'FaceColor', [0.8 0.2 0.2]);
    
    % Formatting
    xlabel('Harmonic Order', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('I_h/I_1 (%)', 'FontSize', 12, 'FontWeight', 'bold');
    title('Grid Current Harmonic Spectrum', 'FontSize', 14);
    grid on;
    xlim([0 max_harmonic+1]);
    
    % Set x-axis to show odd harmonics prominently
    xticks([1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39]);
    
    % Display THD
    thd = sqrt(sum(harmonic_magnitudes(2:end).^2)) / fund_magnitude * 100;
    text(0.7*max_harmonic, 0.9*max(harmonic_percent), ...
        sprintf('THD = %.2f%%', thd), 'FontSize', 11, 'FontWeight', 'bold');
    
    % Print dominant harmonics
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

% Example usage with synthetic data
function example_usage()
    % Simulation parameters
    fs = 20000;  % 20 kHz sampling
    t = 0:1/fs:0.5;  % 0.5 second signal
    f0 = 60;  % 60 Hz fundamental
    
    % Case 1: Clean current (stable operation)
    I_clean = 10*sin(2*pi*f0*t);
    
    % Case 2: Current with 5th and 7th harmonics (unstable, like Fig 5)
    I_distorted = 10*sin(2*pi*f0*t) + ...
                  4*sin(2*pi*5*f0*t) + ...  % 5th harmonic
                  3*sin(2*pi*7*f0*t) + ...  % 7th harmonic
                  0.5*sin(2*pi*11*f0*t);    % 11th harmonic
    
    % Plot both cases
    figure;
    subplot(2,1,1);
    plot_grid_harmonics(I_clean, fs, f0);
    title('Case 1: Stable Operation (L_p = 0)');
    
    subplot(2,1,2);
    plot_grid_harmonics(I_distorted, fs, f0);
    title('Case 2: With Added Inductance (L_p = 12.8 mH)');
end