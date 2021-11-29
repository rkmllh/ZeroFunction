function [x] = successive_bisezioni(f,a,b,tol)
    if f(a) * f(b) >= 0
        fprintf("Zero's theorem not satisfied!\n")
    else
        n_iter = (log(b - a) - log(tol)) / log(2);
        fprintf("We need %d iterations to get a good approximation..\n", n_iter);

        k = 0;
        x = (a + b) / 2;      %Get middle point

        fprintf("%d) [%1.16f, %1.16f] (%1.16f) residue = f(x) = %1.16f\n", k, a, b, x, f(x));

        while abs(x - a) > tol && k < n_iter
            if f(x) * f(a) < 0
                b = x;           %Get first sub-interval
            else
                a = x;           %Get second sub-interval
            end
            x = (a + b)/ 2;      %Get middle point
            k = k + 1;
            fprintf("%d) [%1.16f, %1.16f] (%1.16f) residue = f(x) = %1.16f\n", k, a, b, x, f(x));
        end
    end
end