close all
clear all
clc

%% Symbols

x = sym('x', [2, 1]);
u = sym('u', [1, 1]);


%% Parameters

J = 0.64; %kg * m^2
k = 7.848; %m^2 * kg / s^2
beta = 0.3; %kg * m^2 / s

epsi = 0.1;
x0 = [pi - epsi, 0]; % initial condition

x_bar = [pi, 0];
u_bar = [0];
%% Function definition

f = [ x(2);
    - (k / J) * sin(x(1)) - (beta / J) * x(2)];
h = x(1);
g = [0; 1/J];
C = [1 ; 0];
ff = f + g*u;

matlabFunction (ff, 'File', 'pendulum.m', 'Vars', {[u;x]});
%% Equilibrium points

[xe1, xe2] = solve(f); % It will return only the first equilibrium point (0, 0)

for i = 1:length(xe1)
    xe_d(: , i) = double([xe1(i); xe2(i)]);
end

%% Jacobians

A = jacobian (ff, x);
B = jacobian (ff, u);
AA = subs(A, [x(1); x(2) ; u], [pi ; 0 ; 0]);
BB = subs (B, [x(1); x(2) ; u], [pi ; 0 ; 0]);
AAA = double(AA);
BBB = double(BB);
eig(AAA);

%% Pole Placement

K = place(AAA, BBB, [-5 -4]);

%% Simulink
T_fin = 40;
T_step = 0.01;
sim('pendulum_sim2.mdl');
X_C = ans.X_C;
X_NC = ans.X_NC;
%% Plot

figure('Name', 'Trajectory')
grid on
hold on
xlabel('$X_1$', 'interpreter', 'latex')
ylabel('$X_2$', 'interpreter', 'latex')
plot(X_C(:, 1), X_C(:, 2), 'red', 'DisplayName', 'Controlled System')
plot(X_NC(:, 1), X_NC(:, 2), 'blue', 'DisplayName', 'Open loop System')
legend