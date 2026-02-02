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

%Berechnung
function res = newton(f, f_abl, start_value, iters)
    
    x_val = zeros(1,iters);
    x_val(1) = start_value;

    for i=1:iters
        x_val(i+1) = x_val(i) - (f(x_val(i)))/(f_abl(x_val(i)));
    end
    
    res = x_val(iters+1);
end

res = newton(@fb, @fb_abl, 0.4, 20);

fprintf("Ergebnis: %f\n", res)