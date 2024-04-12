% AER1216 Fall 2023 
% Fixed Wing Project Code
%
% parameters.m
%
% Initialization file which generates and stores all required data into the 
% structure P, which is then stored in the workspace. Simulink model runs 
% this file at the start of every simulation. Code structure adapted from
% Small Unmanned Aircraft: Theory and Practice by R.W. Beard and T. W. 
% McLain. 
% 
% Inputs: 
% N/A
%
% Outputs:
% P                 structure that contains all aerodynamic, geometric, and
%                   initial condition data for the aircraft and simulation.
%
% Last updated: Pravin Wedage 2023-10-26

%% TA NOTE
% An easy way to store parameters for use in simulink is through the use of
% a structure. For example, P.g = 9.81 stores the value of gravitational
% acceleration in the field g that is contained within the structure P.
% Anytime P is called anywhere in the simulation code, the value of P.g is
% accessible. 

%% Parameter Computation
% Initial Conditions
clear all
% compute trim conditions            
P.Va0 = 19.44;         % initial airspeed (also used as trim airspeed)
P.Va_trim = 19.44; 
P.Va = P.Va_trim;

P.gravity = 9.81;
P.g = 9.81; 
P.air_density = 1.225;

% Aerosonde UAV Data
% physical parameters of airframe
properties.mass           = 9.1 + 4.0; % kg
properties.I_x            = 0.8244;    % kg*m^2
properties.I_y            = 1.135;     % kg*m^2
properties.I_z            = 1.759;     % kg*m^2
properties.I_xz           = 0.1204;    % kg*m^2

% compute inertial constants
K  = properties.I_x * properties.I_z - properties.I_xz^2;
k1 = properties.I_xz * (properties.I_x - properties.I_y + properties.I_z) / K;
k2 = (properties.I_z * (properties.I_z - properties.I_y) + properties.I_xz^2) / K;
k3 = properties.I_z / K;
k4 = properties.I_xz / K;
k5 = (properties.I_z - properties.I_x) / properties.I_y;
k6 = properties.I_xz / properties.I_y;
k7 = ((properties.I_x - properties.I_y) * properties.I_x + properties.I_xz^2) / K;
k8 = properties.I_x / K;

% thrust and torque coefficients
C_T_0 =  0.22428565;
C_T_1 =  0.00045093;
C_T_2 = -0.39322189;
C_Q_0 = -5.10377903e-11;
C_Q_1 = 4.46363445e-02;
C_Q_2 = -3.56311394e-09;
C_Q_3 = -7.81249967e-02;

% other parameters
properties.wing_span      = 2.8956;  % m
properties.chord_length   = 0.18994; % m
properties.wing_area      = 0.55;    % m^2

properties.prop_radius    = 0.254;   % m
properties.prop_diameter  = 0.508;   % m (20 inch prop)
properties.prop_disk_area = 0.2027;  % m^2
properties.prop_max_rpm   = 12500;   % rpm

properties.fuel_cap       = 4.0;     % kg  (DK 20231116)
properties.omegaMax       = 12500;   % RPM (DK 20231116)

% aerodynamic coefficients
properties.efficiency_factor = 0.9;  % Oswald efficiency factor

properties.C_L_0  =  0.28;
properties.C_L_a  =  3.45;
properties.C_L_q  =  0;
properties.C_L_de = -0.36;

properties.C_D_0  =  0.03;
properties.C_D_a  =  0.3;
properties.C_D_q  =  0;
properties.C_D_de =  0;

properties.C_m_0  = -0.02338;
properties.C_m_a  = -0.38;
properties.C_m_q  = -3.6;
properties.C_m_de = -0.5;

properties.C_Y_0  =  0;
properties.C_Y_b  = -0.98;
properties.C_Y_p  =  0;
properties.C_Y_r  =  0;
properties.C_Y_da =  0;
properties.C_Y_dr = -0.17;

properties.C_l_0  =  0;
properties.C_l_b  = -0.12;
properties.C_l_p  = -0.26;
properties.C_l_r  =  0.14;
properties.C_l_da =  0.08;
properties.C_l_dr =  0.105;

properties.C_n_0  =  0;
properties.C_n_b  =  0.25;
properties.C_n_p  =  0.022;
properties.C_n_r  = -0.35;
properties.C_n_da =  0.06;
properties.C_n_dr = -0.032;

% Control Input limits 
P.delta_e_max = deg2rad(45); % assumed symmetric
P.delta_a_max = deg2rad(45); 
P.delta_r_max = deg2rad(25);

% Initial Conditions % connects with aircraft_dynamics.m, do not modify
% structure field names
P.pn0    = 0;  % initial North position
P.pe0    = 0;  % initial East position
P.pd0    = -1000;  % initial Down position (negative altitude)
P.u0     = P.Va0; % initial velocity along body x-axis
P.v0     = 0;  % initial velocity along body y-axis
P.w0     = 0;  % initial velocity along body z-axisu_trim
P.phi0   = 0;  % initial roll angle
P.theta0 = 0;  % initial pitch angle
P.psi0   = 0;  % initial yaw angle
P.p0     = 0;  % initial body frame roll rate
P.q0     = 0;  % initial body frame pitch rate
P.r0     = 0;  % initial body frame yaw rate
P.delta_e0 =0;
P.delta_a0 =0;
P.delta_r0 =0;
P.delta_t0 =0;
                         
