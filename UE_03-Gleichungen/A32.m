clear

%Funktionen
function out = Fa(x)
    %out = sqrt(-3*x+4);
    out = (4 - x^2)/3;
end

function out = Fb(x)
    %out = nthroot(atan(x), 3);
    out = tan(x^3);
end

%Hilfsfunktion Ableitung
function out = F_abl(f, x)
    h = 1e-6;
    out = (f(x + h) - f(x - h)) / (2*h);
end

function res = fixpoint(f, start_value, iters)
    
    x_val = zeros(1,iters+1);
    x_val(1) = start_value;

    for i=1:iters
        x_val(i+1) = f(x_val(i));
    end
    
    res = x_val(end);
    A34(x_val);
end

res = fixpoint(@Fa, 2, 1000);
fprintf("Ergebnis: %f\n", res)

%testen, ob diese Nullstelle der f(x) ein guter Fixpunkt ist
fix = F_abl(@Fa, 1);

%Wenn nix geht, dann
% r(x) = 0 -> x = x - lambda*r(x)
%lambda variieren 
