%% AER1216 MULTI_ROTOR
clc;
clear all;

% Quadrotor State Space Model
% Roll: The input for roll is desired roll angle (rad), and the output is actual roll angle (rad).
A_Roll = [-4.2683 -3.1716; 4 0];
B_Roll = [2; 0];
C_Roll = [0.7417 0.4405];
D_Roll = 0;

% Pitch: The input for pitch is desired pitch angle (rad), and the output is actual pitch angle (rad).
A_Pitch = [-3.9784 -2.9796; 4 0];
B_Pitch = [2; 0];
C_Pitch = [1.2569 0.6083];
D_Pitch = 0;

% Yaw: The input for yaw is desired yaw rate (rad/s), and the output is actual yaw angle (rad).
A_Yaw = -0.0059;
B_Yaw = 1;
C_Yaw = 1.2653;
D_Yaw = 0;

% Height: The input for height is desired vertical speed (m/s), and the output is actual height (m).
A_Height = [-5.8200 -3.6046e-6; 3.8147e-6 0];
B_Height = [1024; 0];
C_Height = [1.4907e-4 1.3191e3];
D_Height = 0;

% Pitch to u: The input for the pitch to u is the actual pitch angle (rad), and the output is actual forward velocity u (m/s).
A_P2u = -0.665;
B_P2u = 2;
C_P2u = -3.0772;
D_P2u = 0;

% Roll to v: The input for the roll to v is the actual roll angle (rad), and the output is actual sideway velocity v (m/s).
A_R2v = -0.4596;
B_R2v = 2;
C_R2v = 2.3868;
D_R2v = 0;
 
