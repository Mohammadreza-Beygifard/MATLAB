close all
clear all
clc

% symbolics

x = sym('x', [3, 1]);
u = sym('u', [1, 1]);

% parameters

R = 0.1;
a = 10.4;
b = 16.5;

% nonlinearity
q = -1.16 * x(1) + 0.041 * x(1) ^ 3;

% figure()
% hold on
% grid on
% xlabel('$X_1$', 'interpreter', 'latex')
% ylabel('$q(X_1)$', 'interpreter', 'latex')
% fplot(q, [-3, 3])

%% System definition

f = [a * (x(2) - x(1) - q);
    x(1) - x(2) + x(3);
    - b * x(2) - R * x(3)];
g = [0; 1; 0];

x_d = f + g*u;
h = x(1);
C = [1, 0, 0];

matlabFunction(x_d, 'File', 'chua_fg', 'Vars', {[u; x]});

%% Linearization u_bar = 0 x_bar = [0, 0, 0]

A = jacobian(x_d, x);
B = jacobian(x_d, u);
AA = subs(A, [u, x(1), x(2), x(3)], [0, 0, 0, 0]);
BB = subs(B, [u, x(1), x(2), x(3)], [0, 0, 0, 0]);
AAA = double(AA);
BBB = double(BB);

%% Designing a PID controller

M = ss(AAA, BBB, C, 0);
K = pidtune(M, 'pidf', 50)

%% Simulation 
x0 = [0, 0, 0];
ref = 1;
Tfin = 30;
Tstep = 0.01;

sim('lab2_sim.slx')

