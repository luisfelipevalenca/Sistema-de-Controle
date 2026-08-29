% Seja X(s)=17,6/[(s+2,6)^2]. Se x(t) que lhe deu origem for amostrado com 
% 0,5s, determine manualmente a expressão de X(z) resultante, 
% use-a para encontrar o valor de X(z) para z=4, e digite este valor abaixo, 
% com 3 decimais.  

syms s z
% Parâmetros
a = 2.6;     % valor de 'a' na expressão de X(s)
T = 0.5;     % período de amostragem
z_value = 4; % valor de z para calcular X(z)
K = 17.6;

% Conversão para a transformada Z usando a fórmula de correspondência
% Para um polo em s = -a, a transformada Z correspondente é z/(z - e^(-aT))
Xz = K*(T*exp(-a * T)*(1/z_value) / (1 - (exp(-a * T)*(1/z_value)))^2);

fprintf('X(z) = %f\n',Xz)
