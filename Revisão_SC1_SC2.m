
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

%% Exercício - 2

% Especificações dadas
Mp = 25.38 / 100; % Sobressinal em forma decimal
Tp = 0.38; % Tempo de pico em segundos

% Calculando o fator de amortecimento zeta a partir do sobressinal Mp
zeta = -log(Mp) / sqrt(pi^2 + log(Mp)^2);

% Calculando a frequência natural não amortecida omega_n a partir do tempo de pico Tp
% Primeiro calculamos a frequência natural amortecida omega_d
omega_d = pi / Tp;

% Agora, encontramos omega_n usando a relação entre omega_d e omega_n
omega_n = omega_d / sqrt(1 - zeta^2);

% Exibindo os resultados com 2 casas decimais
fprintf('Frequência natural não amortecida (omega_n): %.2f rad/s\n', omega_n);
fprintf('Frequência natural amortecida (omega_d): %.2f rad/s\n', omega_d);
