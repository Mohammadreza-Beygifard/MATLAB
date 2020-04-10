clear all
close all
clc

% symbolic

x = sym('x', [3, 1]);
u = sym('u', [1, 1]);

% parameters

R = 0.1;
a = 10.4;
b = 16.5;
q = -1.16 * x(1) + 0.041 * x(1) ^ 3;

% figure()
% grid on
% hold on
% xlabel('$x_1$', 'interpreter', 'latex')
% ylabel('$q(x_1)$', 'interpreter', 'latex')
%fplot(q, [-3, 3])

%% System definition

f = [a * (x(2) - x(1) - q);
    x(1) - x(2) + x(3);
    -b * x(2) - R * x(3)];

g = [0; 1; 0];

x_d = f + g*u;
h = x(1);
C = [1, 0, 0];

matlabFunction(x_d, 'File', 'chua_fg', 'Vars', {[u ; x]});

%% Feedback linearization

[u, mu, ga] = io_fl(f, g, h, 'chua');

% refgen
ref = '1';
y_r = ref_gen(ga, ref, 'chua');
%% Controller tracking

A = [0, 1;
    0, 0];
B = [0; 1];

K = place(A, B , [-1, -2]);

%% Simulink

Tfin = 30;
Tstep = 0.01;
x0 = [0, 0, 0];

sim('lab2_sim.slx')

