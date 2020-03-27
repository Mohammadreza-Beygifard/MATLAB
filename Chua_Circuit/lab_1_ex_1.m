clear all
close all
clc
%% First Part
alpha = 10;
beta = 100/7;
R = 0;
u = 0;

x = sym('x', [3, 1]);

f = [alpha * (x(2) - x(1) - (2 * x(1) ^ 3 / 7 - 8 * x(1) / 7));
    x(1) - x(2) + x(3) + u;
    - beta * x(2) - R * x(3)];
[xe1 , xe2, xe3] = solve(f);
for i= 1: length(xe1)
    xeq(:,i) = double([xe1(i);xe2(i); xe3(i)]);
end
xeq

%% Second Part
% done in the notebook
% third part below
%% first equilibrium point (0, 0, 0)

A = [-150/7 , 10, 0;
    1, -1, 1;
    0, -100/7, 0];
eig(A)
%% second equilibrium point (0.7071, 0, -0.7071)

A = [-25.71420, 10, 0;
    1, -1, 1;
    0, -100/7, 0];
eig(A)