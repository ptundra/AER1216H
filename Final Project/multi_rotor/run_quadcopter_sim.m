clc
clear
clear all
close all

centre = [0;0;-3];
velocity = 1;
radius = 10;
omega = velocity/radius;

sim("multirotor_full_system.slx");
t = ans.position.Time;
position = ans.position;
x = ans.position.Data(:, 1);
y = ans.position.Data(:, 2);
z = ans.position.Data(:, 3);

u = ans.velocity.Data(:, 1);
v = ans.velocity.Data(:, 2);
w = ans.velocity.Data(:, 3);

phi = ans.attitude.Data(:, 1);
theta = ans.attitude.Data(:, 2);
psi = ans.attitude.Data(:, 3);

phi_c = ans.control.Data(:, 1);
theta_c = ans.control.Data(:, 2);
psi_c = ans.control.Data(:, 3);
w_c = ans.control.Data(:, 4);

gamma = ans.gamma;

e_x = ans.e_x;
e_y = ans.e_y;

r_error = sqrt(e_x.Data.^2+e_y.Data.^2);



% time_in_circle = position.Time(position.Data(:,3)<-2.999);
% initial_gamma = gamma.Data(gamma.Time == time_in_circle(1));

full_rotation_time = gamma.Time(diff(gamma.Data>=0)==-1);
index = gamma.Time>full_rotation_time(end-1) & gamma.Time<=full_rotation_time(end);
full_rotation_error = r_error(index);
mean_error = mean(full_rotation_error);
x_error = linspace(0,1,length(full_rotation_error));

figure
subplot(4, 1, 1)
plot(t, phi_c)
legend("phi_c")
grid on

subplot(4, 1, 2)
plot(t, theta_c)
legend("theta_c")
grid on

subplot(4, 1, 3)
plot(t, psi_c)
legend("psi_c")
grid on

subplot(4, 1, 4)
plot(t, w_c)
legend("w_c")
grid on

figure
subplot(3, 3, 1)
plot(t, x)
legend("x")
grid on

subplot(3, 3, 2)
plot(t, y)
legend("y")
grid on

subplot(3, 3, 3)
plot(t, z)
legend("z")
grid on

subplot(3, 3, 4)
plot(t, u)
legend("u")
grid on

subplot(3, 3, 5)
plot(t, v)
legend("v")
grid on

subplot(3, 3, 6)
plot(t, w)
legend("w")
grid on

subplot(3, 3, 7)
plot(t, theta)
legend("theta")
grid on

subplot(3, 3, 8)
plot(t, phi)
legend("phi")
grid on

subplot(3, 3, 9)
plot(t, psi)
legend("psi")
grid on


%plot of top down circular motion
p = nsidedpoly(1000, 'Center', [centre(1) centre(2)], 'Radius', radius);

figure
subplot(2, 2, 1)
hold on
scatter(x,y,25,'filled')
plot(p,FaceColor='g',FaceAlpha=0)
grid on
% colorbar
axis equal
title('Position of the quad over time from top');
xlabel('x Position');
ylabel('y Position');
% colormap hsv
hold off
ax = gca;
exportgraphics(ax,"plot-z.png","Resolution",500)


%2d plot of the motion from x axis
subplot(2, 2, 2)
hold on;
scatter(x, z,25,'filled');
title('Position of the quad over time from side');
xlabel('x Position');
ylabel('z Position');
grid on
% colormap hsv
hold off
ax = gca;
exportgraphics(ax,"plot-x.png","Resolution",500)

%2d plot of the motion from y axis
subplot(2, 2, 3)
hold on;
scatter(y, z,25,'filled');
title('Position of the quad over time from side');
xlabel('y Position');
ylabel('z Position');
grid on
hold off

ax = gca;
exportgraphics(ax,"plot-y.png","Resolution",500)

% 3d plot of the motion

subplot(2, 2, 4)
plot3(x, y, z, 'o','color', '[0, 0.4470, 0.7410]', MarkerFaceColor='[0, 0.4470, 0.7410]')
title('3D Position Plot as Time Changes');
xlabel('x Position');
ylabel('y Position');
zlabel('z Position');
grid on;

ax = gca;
exportgraphics(ax,"plot-3d.png","Resolution",500)

figure
hold on
plot(x_error,full_rotation_error)
xlabel('Length along circle l/L')
ylabel('Error ||r||')
% ylim([])
title('Error of one full rotation with R = 10 m');
hold off


