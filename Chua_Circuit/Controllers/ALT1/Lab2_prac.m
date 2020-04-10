close all
clear all
clc

% symbolic definition

x = sym('x', [3, 1]);
u = sym('u', [1, 1]);

%% System definition

R = 0.1;
a = 10.4;
b = 16.5;
q = -1.16 * x(1) + 0.041 * x(1) ^ 3;

f = [a * (x(2) - x(1) - q);
    x(1) - x(2) + x(3);
    -b * x(2) - R * x(3)];
g = [0; 1; 0];

x_d = f + g*u ;
h = x(1);
C = [1, 0, 0];

matlabFunction(x_d, 'File', 'chua_fg', 'Vars', {[u ; x]});

%% Linearization

[u, mu] = io_fl(f, g, h, 'chua');

%% linear controller design

A = [0, 1;
    0, 0];
M = ss (A, g(1:2), C(1:2), 0);
K = pidtune(M, 'pidf', 12);

%% Simulation
Tfin = 60;
Tstep = 0.01;
x0 = [0, 0, 0];