function [t, y] = euler_imp(fun, tspan, y0, h)
    n = ceil((tspan(2) - tspan(1)) / h);
    t = [tspan(1); zeros(n, 1)];
    y = [y0; zeros(n, 2)];
    options = optimoptions('fsolve','Display','none');
    
    for i = 1 : n
        t(i + 1) = t(i) + h;
        imp = @(new_y) new_y - y(i, :) - h * fun(t(i + 1), new_y); 
        y(i + 1, :) = fsolve(imp, y(i, :), options);
    end
end

