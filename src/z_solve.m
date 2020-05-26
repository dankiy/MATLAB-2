function [z, dz] = z_solve()
    syms z(t) kp kd m z_star t;
    eqn = m * diff(z, t, 2) == -kp * (z - z_star) - kd * diff(z, t, 1);
    Dz = diff(z);
    cond = [z(0) == 0, Dz(0) == 0];
    temp(t) = dsolve(eqn, cond);
    z = matlabFunction(temp);
    dz = matlabFunction(diff(temp));
end