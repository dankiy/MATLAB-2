function [t, y] = euler(fun, tspan, y0, h)
    n = ceil((tspan(2) - tspan(1)) / h);
    t = [tspan(1); zeros(n, 1)];
    y = [y0; zeros(n, 2)];

    for i = 1 : n
        t(i + 1) = t(i) + h;
        y(i + 1, :) = y(i, :) + h * fun(t(i), y(i, :));
    end
end

