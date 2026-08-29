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

%%
syms z;

% Define F(z)
Fz = (5.544*z^2) / ((z-1)*(z^2-0.416*z+0.208));

% Calcula o limite conforme z tende a 1 para aplicar o Teorema do Valor Final
limit_value = limit((z - 1)*Fz, z, 1);

% Mostra o resultado com três casas decimais
fprintf('O valor final da sequência f(k) é: %.3f\n', double(limit_value));

%%

% Definindo z como uma variável simbólica
syms z;

% Parâmetros
K = 14.5;
a = 4.7;
z_value = 4;
T = 0.5;

% Da tabela é dado que 
% Z{K * s / (s + a)^2} é representado por:
% K * (1 - (1 + a * T) * exp(-a * T) * z^(-1)) / (1 - exp(-a * T) * z^(-1))^2

num = 1 - (1 + a * T) * exp(-a * T) * z^(-1);

%%

% Define the symbolic variable z
syms z;

% Define the periodic sequence and compute the z-transform for one period
Xp_z = 7 + 49/z;  % z-transform of one period

% Compute the z-transform for the entire sequence
Xz = Xp_z / (1 - z^(-2));

% Simplify the z-transform expression
Xz_simplified = simplify(Xz);

% Display the simplified z-transform
disp('The simplified z-transform X(z) is:');
disp(Xz_simplified);

% Evaluate X(z) at z = 4
Xz_at_4 = subs(Xz_simplified, z, 4.4);
den = (1 - exp(-a * T) * z^(-1))^2;
Xz = K * num / den;

% Substituindo z = 4 e calculando o valor da expressão
Xz_at_4 = subs(Xz, z, z_value);
Xz_at_4 = vpa(Xz_at_4, 5);

% Printando o resultado
fprintf('O valor de X(z) em z = 4 é: %.3f\n', Xz_at_4);
