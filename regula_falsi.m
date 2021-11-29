function [x] = regula_falsi(f,a,b,tol)
    
    if f(a) * f(b) >= 0
        fprintf("Zero's theorem not satisfied!\n")
    else
        x = (a * f(b) - b * f(a)) / (f(b) - f(a));      %Get x of point (x,0) [(a,f(a))-(b,f(b)) and x-axis]
        k = 0;                  %Iterator
        prev_x = x;             %Keep trace of previous value, we need it to check next approximation
        stop = false;           %Flag to stop process
        fprintf("%d) [%1.16f, %1.16f] (%1.16f) residue = f(x) = %1.16f\n", k, a, b, x, f(x));

        while stop == false && not(f(x) == 0)     %Check size of approximation or if x is root of equation
            if f(a) * f(x) < 0
                b = x;
            else
                a = x;
            end
            x = (a * f(b) - b * f(a)) / (f(b) - f(a));      %Get x of point (x,0) [(a,f(a))-(b,f(b)) and x-axis]
            k = k + 1;
            fprintf("%d) [%1.16f, %1.16f] (%1.16f) residue = f(x) = %1.16f\n", k, a, b, x, f(x));

            if (abs(prev_x - x) < tol)       %Stop the iteration
                stop = true;
            end
            prev_x = x;
        end
    end
end