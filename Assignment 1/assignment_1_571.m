%% PLL Controller Design - Following Class Slide

% System parameters
V_LL_RMS = 580;
Vs_peak = (V_LL_RMS / sqrt(3)) * sqrt(2);  % = 473.6 V

fprintf('V̂_s = %.2f V\n', Vs_peak);

%% Design parameters
zeta = 0.707;    % Damping ratio
wn = 110;        % Natural frequency (rad/s)

% Calculate K_T and K_I (slide notation)
K_T = 2*zeta*wn / Vs_peak;
K_I = wn^2 / Vs_peak;

fprintf('K_T (k_p_PLL) = %.4f\n', K_T);
fprintf('K_I (k_i_PLL) = %.4f\n', K_I);

%% Transfer functions
s = tf('s');

% PI controller
H = K_T + K_I/s;

% Open-loop transfer function 
G_open = Vs_peak * H * (1/s);
% Which equals: (Vs_peak*K_T*s + Vs_peak*K_I) / s^2

fprintf('\nOpen-loop transfer function:\n');
G_open

% Closed-loop transfer function 
G_closed = feedback(G_open, 1);

fprintf('\nClosed-loop transfer function:\n');
G_closed

% Verify it matches standard form
[num_cl, den_cl] = tfdata(G_closed, 'v');
fprintf('\nClosed-loop denominator: s^2 + %.2f*s + %.2f\n', den_cl(2), den_cl(3));
fprintf('Should match: s^2 + %.2f*s + %.2f\n', Vs_peak*K_T, Vs_peak*K_I);
fprintf('Which is: s^2 + %.2f*s + %.2f\n', 2*zeta*wn, wn^2);

%% Bode plot (use open-loop)
figure(1);
margin(G_open);
grid on;
title('PLL Open-Loop Bode Plot');

%% Step response (use closed-loop)
figure(2);
step(G_closed, 0.1);
grid on;
title('PLL Closed-Loop Step Response');
ylabel('Phase θ̂ (rad)');
xlabel('Time (s)');