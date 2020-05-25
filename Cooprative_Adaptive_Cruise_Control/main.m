clear all
close all
clc

%parameters
v_tar = 30;  %m/s
t_h_tar = 1; %s
d_0 = 8;     %m

K_v = 0.5;
K_d_err = 0.2;
K_v_r = 1.5;
K_a = 0.2;

a_des_max = 5; %m/s^2
a_des_min = -3; %m/s^2

tau = 0.5;
num = [1];
den = [tau, 1];
G_a = tf(num, den);

x1_0 = 150; %m
v1_0 = 30; %m/s

x2_0 = 100; %m
v2_0 = 25;  %m/s

x3_0 = 50;  %m
v3_0 = 28;  %m/s

x4_0 = 0;   %m
v4_0 = 0;   %m/s

%% Transfer Functions for stability

num1 = [K_v_r, K_d_err];
den1 = [1, K_v_r + K_d_err * t_h_tar, K_d_err];
H1 = tf(num1, den1)
norm_H1 = norm(H1, inf)
figure()
impulseplot(H1)

num2 = [K_a, K_v_r, K_d_err];
den2 = [tau, 1, (K_v_r + K_d_err * t_h_tar), K_d_err];
H2 = tf(num2, den2)
norm_H2 = norm(H2, inf)
figure()
impulseplot(H2)

%% Simulation
open('ACC_sim')
open('CACC_sim')
