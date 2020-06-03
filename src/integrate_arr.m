function [I, u, t_span, z]=integrate_arr(u0, m, z_star, k, u_max)
    z0 = [0; 0];
    t_span = linspace(0, 50, 500);
    odefun_z = @(t, z) [z(2); max(-k(2) * z(2) - k(1) * (z(1) - z_star), -u_max + u0) / m];
    options = odeset('NonNegative', 1);
    [~, z] = ode45(odefun_z, t_span, z0, options);
    u = k(1) * (z(1, :) - z_star) + k(2) * z(2, :) + u0;
    C = u < u_max;
    u = u.*C + u_max.*(1 - C);
    j = (z(1, :) - z_star).^2 + z(2).^2 + u.^2;
    I = trapz(j);
end
