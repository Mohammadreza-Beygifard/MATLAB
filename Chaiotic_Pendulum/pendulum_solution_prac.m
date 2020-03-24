close all
clear all
clc

global k J beta pert

C = 5;
m = 1;
l = 1;
beta = 0.5;
J = m * l ^ 2;
k = 1 * m * l;
pert = 1;

A = 1.15;
W = 0.6666;
x0=[0.5;0.2];
x0_pert=[0.52;0.23];

xl=[-25 5];
yl=[-2.5 2.5];

figure, hold on, box on
xlabel('\theta','fontsize',12)
ylabel('d{\theta}/dt','fontsize',12)
xlim(xl)
ylim(yl)
plot(x0(1),x0(2),'.','markersize',10);
if pert==1
    plot(x0_pert(1),x0_pert(2),'.r','markersize',10);
end

sim('pendulum_sim.slx')