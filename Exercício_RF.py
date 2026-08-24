# Seja G(s)=K/(s+a), excitada por uma senóide de frequência 1,0345 Hz.
# Em regime estacionário, observou-se que a resposta também era senoidal,
# mas com magnitude de 6,5dB e uma fase de -17,5 graus em relação à excitação.
# Nestas condições, desenhe os gráficos de Bode e determine a fase do sistema em graus,
# na frequência de cruzamento de ganho, com 3 decimais.

# O enunciado traz para a gente que o sistema é de primeira ordem, tem um polo "a".
# a frequência em Hz é dada, e vale 1.0345. A magnitude (|G|) é de 6.5 dB e a fase (φ)
# - 17.5 graus.

import numpy as np
import matplotlib.pyplot as plt

# Dados
f = 1.0345
w0 = 2*np.pi*f
a = w0 / np.tan(np.deg2rad(17.5))
K = 10**(6.5/20) * np.sqrt(a**2 + w0**2)
T = 0.16

# Cruzamento de ganho (atraso puro não altera magnitude)
wc = np.sqrt(K**2 - a**2)

# Fases em wc
phi_G_wc = -np.degrees(np.arctan(wc/a))
phi_delay_wc = -np.degrees(wc*T)
phi_total_wc = phi_G_wc + phi_delay_wc
MF = 180 + phi_total_wc

# Bode
w = np.logspace(-1, 3, 1600)
mag_db = 20*np.log10(K / np.sqrt(a**2 + w**2))
phi_total = -np.degrees(np.arctan(w/a)) - np.degrees(w*T)

plt.figure(figsize=(7, 4.5))
plt.semilogx(w, mag_db)
plt.axhline(0, linewidth=1)
plt.axvline(wc, linewidth=1)
plt.scatter([wc], [0], zorder=3)
plt.xlabel(r'Frequência $\omega$ (rad/s)')
plt.ylabel('Magnitude (dB)')
plt.title('Bode com sensor de atraso puro — Magnitude')
plt.grid(True, which='both')
plt.show()

plt.figure(figsize=(7, 4.5))
plt.semilogx(w, phi_total)
plt.axhline(-180, linewidth=1)
plt.axvline(wc, linewidth=1)
plt.scatter([wc], [phi_total_wc], zorder=3)
plt.xlabel(r'Frequência $\omega$ (rad/s)')
plt.ylabel('Fase (graus)')
plt.title('Bode com sensor de atraso puro — Fase')
plt.grid(True, which='both')
plt.show()

print(f"a = {a:.9f}")
print(f"K = {K:.9f}")
print(f"ωc = {wc:.9f} rad/s")
print(f"Fase de G em ωc = {phi_G_wc:.9f}°")
print(f"Fase do atraso em ωc = {phi_delay_wc:.9f}°")
print(f"Fase total em ωc = {phi_total_wc:.9f}°")
print(f"Margem de fase = {MF:.9f}°")
