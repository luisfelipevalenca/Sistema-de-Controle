
% Dados do problema
Mp = 6.2 / 100; % Sobressinal em forma decimal
Tp = 1.2; % Tempo de pico em segundos

% Calculando o fator de amortecimento (zeta) a partir do sobressinal
zeta = sqrt((log(Mp))^2 / (pi^2 + (log(Mp))^2));

% Calculando a frequência natural não amortecida (omega_n) a partir do tempo de pico
omega_n = pi / (Tp * sqrt(1 - zeta^2));

% Calculando o tempo de acomodação aproximado Ts (com 2% do valor final)
Ts_2_percent = 4 / (zeta * omega_n); % Para 2% do valor final

% Exibindo os resultados
fprintf('Fator de amortecimento (zeta): %f\n', zeta);
fprintf('Frequência natural não amortecida (omega_n): %f rad/s\n', omega_n);
fprintf('Tempo de acomodação para 2%% (Ts_2_percent): %f s\n', Ts_2_percent);
