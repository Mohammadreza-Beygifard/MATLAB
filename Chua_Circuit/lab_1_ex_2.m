close all
clear all
clc

Tfin = 100;
my_step = 0.01;

x0 = [0.01; 0; 0];
xp0 = [0.01; 0.01; 0];
sim('lab1_sim.slx');
t = ans.get('time');
x1 = ans.get('x1_out');
x2 = ans.get('x2_out');
x3 = ans.get('x3_out');

%%

figure ('Name','States_Trajectory')
grid on
hold on
plot3(0, 0, 0, 'g.', 'markersize', 20)
plot3(0.7071, 0, -0.7071, 'r.', 'markersize', 20)
plot3(-0.7071, 0, 0.7071, 'y.', 'markersize', 20)
plot3(x1(:, 1), x2(:, 1), x3(:, 1), 'c')
plot3(x1(:, 2), x2(:, 2), x3(:, 2), 'm')
xlabel('$X_1$', 'interpreter', 'latex')
ylabel('$X_2$', 'interpreter', 'latex')
zlabel('$X_3$', 'interpreter', 'latex')
view(60,40)

%%
figure('Name','Signals')
subplot(3,1,1)
plot(t,x1)
xlabel('time (s)')
ylabel('x_1')
subplot(3,1,2)
plot(t,x2)
xlabel('time (s)')
ylabel('x_2')
subplot(3,1,3)
plot(t,x3)
xlabel('time (s)')
ylabel('x_3')
