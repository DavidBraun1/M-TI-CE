function f = func(x)
    f = cos(x^2);
end

function out = trapez(a, b, f)
    out = 0.5 * abs(a-b) * (f(a) + f(b));
end

function Integral = trapz_new(a, b, f, tol, ints)
    Integral = 0;
    int_bor = linspace(a, b, ints+1);
    
    for i=1:ints
        diff = abs(f(int_bor(i))-f(int_bor(i+1)));

        if diff > tol            
            Integral = Integral + adaptive(int_bor(i), int_bor(i+1), f, tol);
        else
            Integral = Integral + trapez(int_bor(i), int_bor(i+1), f);
        end
    end
end

function out = adaptive(a, b, f, tol)
        mid = (a + b) / 2;
        
        %right side
        diff = abs(f(a)-f(mid));

        if diff > tol
            right = adaptive(a, mid, f, tol);
        else
            right = trapez(a, mid, f);
        end

        %left side
        diff = abs(f(mid)-f(b));
        if diff > tol
            left = adaptive(mid, b, f, tol);
        else
            left = trapez(mid, b, f);
        end

        out = right + left;
end


Int = trapz_new(0, 5, @func, 0.01, 4);

fprintf('Das Ergebnis des Integrals von %d - %d ist: %.3f\n\n', 0, 5, Int);