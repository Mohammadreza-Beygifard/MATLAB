This file contains the MATLAB files for simulation the local linearization control of a pendulum.

Pendulum is a nonlinear system and for controlling it we need a nonlinear control.

One of the methods that we can use for controlling nonlinear systems is designing a pole placement controller through local linearization around the unstable equilibrium point.

File “main_inverted_pendulum.m” contains the main code in which the differential equation of the pendulum, linearization and the pole placement is done.
File “pendulum_sim2.mdl” contains the Simulink model of the pendulum, in which one of the systems is controlled by the means of a pole placement controller and the other one is not controlled.
File “Trajectory.jpg” contains the result of the simulation.
