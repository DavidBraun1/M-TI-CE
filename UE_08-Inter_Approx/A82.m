clear

global x;
global y;
x = [0, 1,  2,      3,      4];
y = [3, 1,  0.5,    0.2,    0.05];

lm0 = [1, 1];

lm_best = fminsearch(@error_fa, lm0);

x_s = linspace(min(x), max(x));
y_s = func_a(x_s, lm_best(1), lm_best(2));
figure(1)
plot(x,y,'o',x_s,y_s);
title("Funktion a mit \lambda_1="+lm_best(1)+" und \lambda_2="+lm_best(2))

lm0 = [1, 1, 1];
lm_best = fminsearch(@error_fb, lm0);
x_s = linspace(min(x), max(x));
y_s = func_b(x_s, lm_best(1), lm_best(2), lm_best(3));
figure(2)
plot(x,y,'o',x_s,y_s);
title("Funktion b mit \lambda_1="+lm_best(1)+" und \lambda_2="...
    +lm_best(2)+" und \lambda_3="+lm_best(3))

%-----------------------------------------------------------------------
function out = func_a(x, lm1, lm2)
    out = lm1 * exp(lm2 * x);
end

function out = func_b(x, lm1, lm2, lm3)
    out = lm1 ./ (x.^lm2 + lm3);
end

function out = error_fa(lm)
    global x;
    global y;

    lm1 = lm(1);
    lm2 = lm(2);

    out = 0;
    for i=1:length(x)
        f = func_a(x(i), lm1, lm2);
        e = (y(i) - f)^2;
        out = out + e;
    end
end

function out = error_fb(lm)
    global x;
    global y;

    lm1 = lm(1);
    lm2 = lm(2);
    lm3 = lm(3);

    out = 0;
    for i=1:length(x)
        f = func_b(x(i), lm1, lm2, lm3);
        e = (y(i) - f)^2;
        out = out + e;
    end
end