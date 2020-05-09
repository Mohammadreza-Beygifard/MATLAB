close all
clear all
clc

%% Parameters, Control_Data, Transfer Functions

%parameters
tah = 0.5; %s
xh0 = 0;   %m
xl0 = 50;  %m
vh0 = 28;  %m/s
vl0 = 36;  %m/s

%acc control data
v_tar = 36;%m/s
th_tar = 1;%s
d0 = 8;    %m
Kv = 0.5;
Kd_err = 0.2;
Kv_r = 0.4;
a_des_max = 5; %m/s^2
a_des_min = -3; %m/s^2

%transfer function
s = tf('s');

Gah = 1/(1+tah*s);
Gal = 1/(1+tah*s);

%% Open Sim

open('HW_sim_2')

%% Plotting
close all
clc
v_tar_plot = v_tar * ones (length(out.v_l.Data), 1);
figure('Name', 'Signals')
hold on
grid on
xlabel('time (s)')
ylabel('signals (m or m/s)')
title('Measured Signals')
plot(out.d_tar.time, out.d_tar.Data)
plot(out.d_tar.time, v_tar_plot)
plot(out.d.time, out.d.Data)
plot(out.v_l.time, out.v_l.Data)
plot(out.v_h.time, out.v_h.Data)
legend('d_{tar}', 'v_{tar}', 'distance', 'V_l', 'V_h')

figure()
hold on
grid on
xlabel('time (s)')
ylabel('Control Input (m/s^2)')
plot(out.a_des.time, out.a_des.Data)