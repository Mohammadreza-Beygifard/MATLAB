function xp = pendulum(xu, f1)

global k J beta pert

x = xu(1:2);
u = xu(3);

xp(1) = x(2);
xp(2) = - k/J * sin(x(1)) - beta / J * x(2) + 1/J * u;

xp = xp';

switch f1
    case 1
        plot(x(1), x(2), '.b', 'markersize', 5)
    case 2
        if pert == 1
            plot(x(1), x(2), '.r', 'markersize', 5)
        end
end