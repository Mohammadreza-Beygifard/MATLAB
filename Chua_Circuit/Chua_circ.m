function xd = Chua_circ (xu)

alpha = 10;
beta = 100/7;
R = 0;

x = xu(1:3);
u = xu(4);
xd = zeros(3,1);

rho_x1 = 2* x(1) ^ 3 / 7 - 8 * x(1) / 7;
xd(1) = alpha * (x(2) - x(1)- rho_x1);
xd(2) = x(1) - x(2) + x(3) + u;
xd(3) = -beta * x(2) - R * x(3);
end