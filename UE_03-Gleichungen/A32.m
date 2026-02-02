function out = Fa(x)
    out = sqrt(-3*x+4);
end

function out = Fb(x)
    out = nthroot(atan(x), 3);
end

function res = fixpoint(f, start_value, iters)
    
    x_val = zeros(1,iters);
    x_val(1) = start_value;

    for i=1:iters
        x_val(i+1) = f(x_val(i));
    end
    
    res = x_val(iters+1);
end

res = fixpoint(@Fa, -6, 1000);

fprintf("Ergebnis: %f\n", res)