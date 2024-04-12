% AER1216 project
% Pouya Asgharzadeh, Vic Gao, Min Woo (David) Kong
% 1.1 Fixed-Wing UAS Development

load("parameters.mat")

b = properties.wing_span
c = properties.chord_length
e = properties.efficiency_factor
S = properties.wing_area
C_D_0 = properties.C_D_0

AR = b / c
K = 1 / pi / e / AR

W1 = 9.1 * 9.81
W0 = W1 + 4 * 9.81
rho = 1.1116
eta = 0.8 % propeller efficiency
SFC = 0.6651 * 9.81 / 1000 / 3600

C_L_C_D_max = 1 / 2 / sqrt(K * C_D_0)
C_L_3_2_C_D_max = 1 / 4 / C_D_0 * power(3 * C_D_0 / K, 0.75)

E = eta / SFC * sqrt(2 * rho * S) * C_L_3_2_C_D_max * (1 / sqrt(W1) - 1 / sqrt(W0)) / 3600 % in hour

R = eta / SFC * C_L_C_D_max * log(W0 / W1) / 1000 % in km