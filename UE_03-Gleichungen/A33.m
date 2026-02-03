clear

%Funktionen für a)
function out = fa(x)
    out = (1+log(x))/x;
end

function out = fa_abl(x)
    out = -1 * (log(x))/(x^2);
end

%Funktionen für b)
function out = fb(x)
    out = exp(x-1) - 5*x^3 + 5;
end

function out = fb_abl(x)
    out = exp(x-1) - 15*x^2;
end

%Hilfsfunktion Ableitung
function out = F_abl(f, x)
    h = 1e-6;
    out = (f(x + h) - f(x - h)) / (2*h);
end

%Berechnung
function res = newton(f, f_abl, start_value, iters)
    
    x_val = zeros(1,iters+1);
    x_val(1) = start_value;

    for i=1:iters
        x_val(i+1) = x_val(i) - f(x_val(i)) / f_abl(x_val(i));
    end
    
    res = x_val(end);
    A34(x_val);
end

res = newton(@fa, @fa_abl, 0.5, 10);

fprintf("Ergebnis: %f\n", res)