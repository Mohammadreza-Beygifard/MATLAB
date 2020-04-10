These four ways of controlling a chua circuit.

In ALT1 and ALT2 system is linearized by means of a feedback linearization.
	ALT1 : pole placement controller
	ALT2 : PID controller
In ALT3 and ALT4 system is linearized by the means of jacobian around x = [0, 0, 0] and u = 0.
	ALT3 : pole placement controller
	ALT4 : PID controller
As we can notice in the second approach we have a steady state error which is due to th error 
we are producing by linearization around an equilibrium point. Although this error is compensable
by using an integrator in the steady state error and adding its contribution to the control input.