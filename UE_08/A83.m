clear

global x y f1 f2 f3 f4 f5
x = [-1,0,1,2,3];
y = [3,2,9,21,49];

f1 = @(x) 1;
f2 = @(x) x;
f3 = @(x) x.^2;
f4 = @(x) sqrt(1+x);
f5 = @(x) exp(x);

lm0 = [1,1,1,1,1];

lm_b = fminsearch(@error, lm0);

x1 = linspace(min(x), max(x));
y1 = fun(lm_b, x1);
plot(x,y,'o',x1,y1);
text = "Funktion mit \lambda_1="+lm_b(1)+", \lambda_2="...
    +lm_b(2)+", \lambda_3="+lm_b(3)+", \lambda_4="+lm_b(4)+...
    " und \lambda_5="+lm_b(5);
title(text)

%---------------------------------------------------------------------
function out = error(lm)
    global x y

    f = fun(lm, x);
    out = sum((y-f).^2);
end

function out = fun(lm, x)
    global f1 f2 f3 f4 f5
    out = lm(1)*f1(x)+lm(2)*f2(x)+lm(3)*f3(x)+lm(4)*f4(x)+lm(5)*f5(x);
end