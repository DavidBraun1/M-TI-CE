clear

function res = bisektion(a, b, tol)
    %Testabfragen
    if(f(a) * f(b) > 0)
        error("Keine Nullstelle in diesem Intervall!")
    elseif(f(a) * f(b) == 0)
        error("Nullstelle bei x = %d oder %d", a, b)
    end

    %Schleife
    i = 0;
    while(abs(a-b)>tol)
        m = (a+b)/2;
        if(f(a) * f(m) > 0)
            a = m;
        else
            b = m;
        end
    i=i+1;
    end
    fprintf("Anzahl an Iterationen: %d\n", i);
    fprintf("Fehler bei: %.16f\n", abs(a-b)/2)
    res = (a+b)/2;
    return
end


a=0;
b=20;
tol=10^-8;


function out = f(x)
    out = 0.25*x^4 - 1.4*x^3 - x^2 + 3.1*x - 3;
end

res = bisektion(a, b, tol);
fprintf("Nullstelle bei %.8f\n", res);