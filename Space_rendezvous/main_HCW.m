clear all
close all
clc

% plant parameter

w = 0.0011;

A =[0 0 0 1 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1;
    (3*w^2) 0 0 0 (2*w) 0;
    0 0 0 (-2*w) 0 0;
    0 0 (-w^2) 0 0 0];
B = [zeros(3);eye(3)];

H = ss(A, B, eye(6), 0);

%% NMPC design

% Controller parameters
par.model=@prediction_model_template;
par.nlc=@constraint_function_template;
par.n=6;
par.Ts=1;
par.Tp=50;
par.P=eye(6);
par.Q=zeros(6);
par.R=0.1 * eye(3);
par.lb= -1 * ones(3,1);
par.ub= 1 * ones(3,1);

K=nmpc_design(par);
%%
ref = [20, 0, 0, 0, 0, 0];

%% Simulation
x0 = [-500 0 0 0 0 0];
tfin = 1000;
sim('nmpc_block.slx')

%% plot
close all

figure()
hold on
grid on
xlabel('$Z_1$','interpreter','latex')
ylabel('$Z_2$','interpreter','latex')
zlabel('$Z_3$','interpreter','latex')
plot3(x0(1), x0(2), x0(3), 'X')
plot3(ref(1), ref(2), ref(3), 'o')
plot3(y.Data(:,1), y.Data(:,2), y.Data(:,3), 'b')
view(40, 60)

ref1x = [0; tfin];
ref1y = [ref(1); ref(1)];
figure('Name','Z1')
xlabel('time')
ylabel('$Z_1$', 'interpreter', 'latex')
hold on
grid on
plot(y.Time, y.Data(:,1), 'b')
plot(ref1x, ref1y, 'r')

ref1x = [0; tfin];
ref1y = [ref(2); ref(2)];
figure('Name','Z2')
xlabel('time')
ylabel('$Z_2$', 'interpreter', 'latex')
hold on
grid on
plot(y.Time, y.Data(:,2), 'b')
plot(ref1x, ref1y, 'r')

ref1x = [0; tfin];
ref1y = [ref(3); ref(3)];
figure('Name','Z3')
xlabel('time')
ylabel('$Z_3$', 'interpreter', 'latex')
hold on
grid on
plot(y.Time, y.Data(:,3), 'b')
plot(ref1x, ref1y, 'r')

figure('Name', 'safety sphere')
hold on
grid on
xlabel('time')
ylabel('Control_input')
plot(non_linear_cons.Time, non_linear_cons.Data(:,1), 'b')
plot([0, tfin], [10, 10], 'r')
plot([0, tfin], [-10, -10], 'r')
