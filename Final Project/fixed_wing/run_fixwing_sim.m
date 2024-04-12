clc
clear
clear all

% run("parameters.m")

sim("Fixed_Wing_Aircraft_Sim_closed_loop.slx")
t = x_sim.Time;

% states data
x = x_sim.Data(:, 1);
y = x_sim.Data(:, 2);
z = x_sim.Data(:, 3);
h = -1 * z;
u = x_sim.Data(:, 4);
v = x_sim.Data(:, 5);
w = x_sim.Data(:, 6);
phi = x_sim.Data(:, 7);
theta = x_sim.Data(:, 8);
psi = x_sim.Data(:, 9);
p = x_sim.Data(:, 10);
q = x_sim.Data(:, 11);
r = x_sim.Data(:, 12);

% control data
de = u_sim.Data(:, 1);
da = u_sim.Data(:, 2);
dr = u_sim.Data(:, 3);
dt = u_sim.Data(:, 4);

% control plots
figure
subplot(4, 1, 1)
plot(t, de)
legend("de")
grid on

subplot(4, 1, 2)
plot(t, da)
legend("da")
grid on

subplot(4, 1, 3)
plot(t, dr)
legend("dr")
grid on

subplot(4, 1, 4)
plot(t, dt)
legend("dt")
grid on

% state plots
figure
x0=10;
y0=10;
width=1050;
height=1000;
set(gcf,'position',[x0,y0,width,height])
subplot(4, 3, 1)
plot(t, x)
legend("x")
grid on

subplot(4, 3, 2)
plot(t, y)
legend("y")
grid on

subplot(4, 3, 3)
plot(t, h)
legend("h")
grid on

subplot(4, 3, 4)
plot(t, u)
legend("u")
grid on

subplot(4, 3, 5)
plot(t, v)
legend("v")
grid on

subplot(4, 3, 6)
plot(t, w)
legend("w")
grid on

subplot(4, 3, 7)
plot(t, phi)
legend("phi")
grid on

subplot(4, 3, 8)
plot(t, theta)
legend("theta")
grid on

subplot(4, 3, 9)
plot(t, psi)
legend("psi")
grid on

subplot(4, 3, 10)
plot(t, p)
legend("p")
grid on

subplot(4, 3, 11)
plot(t, q)
legend("q")
grid on 

subplot(4, 3, 12)
plot(t, r)
legend("r")
grid on

% angle of attack, yaw rate, and climb rate
alpha = pitch.Data(:, 1);
chi_dot = course_angle_rate.Data(:, 1);
h_dot = climb_rate.Data(:, 1);

figure;
subplot(3, 1, 1);
plot(t, alpha);
legend("pitch");
grid on;

subplot(3, 1, 2);
plot(t, chi_dot);
legend("course angle rate");
grid on;

subplot(3, 1, 3);
plot(t, h_dot);
legend("climb rate");
grid on;

% 3D Position Plot as Time Changes
figure;
subplot(2, 1, 1)
plot3(x, y, h, 'o-', 'LineWidth', 2);
title('3D Position Plot as Time Changes');
xlabel('x Position');
ylabel('y Position');
zlabel('h Position');
grid on;

% Adding a time axis
hold on;
scatter3(x, y, h, 100, t, 'filled');
colorbar; % Show colorbar representing time

% Adding a label to the colorbar
cb = colorbar;
ylabel(cb, 'Time');

subplot(2, 1, 2)
plot3(x, y, h, 'o-', 'LineWidth', 2);
title('3D Position Plot as Time Changes');
xlabel('x Position');
ylabel('y Position');
zlabel('h Position');
grid on;

% Adding a time axis
hold on;
scatter3(x, y, h, 100, t, 'filled');
colorbar; % Show colorbar representing time

% Adding a label to the colorbar
cb = colorbar;
ylabel(cb, 'Time');

% Set the view to a top-down perspective
view(0, 90); % Azimuthal angle = 0, Elevation angle = 90

% Set the axes to have the same scale
axis equal;

hold off;