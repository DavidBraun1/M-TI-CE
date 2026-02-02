clear

function y = funca(x)
    y = sqrt(1-x.^2);
end

function y = funcb(x)
    y = 1 + cos(exp(x.^2));
end

function [integral, above_val, under_val] = monte_inte(N, xmin, xmax, ymin, ymax, func)
    x_val = xmin + (xmax-xmin) .* rand(N, 1);
    y_val = ymin + (ymax-ymin) .* rand(N, 1);
    
    above = 0;
    under = 0;
    integral = zeros(N, 1);
    A = abs(ymin-ymax) * abs(xmin-xmax);
    
    for i=1:N
        x = x_val(i);
        y = y_val(i);
    
        if y>func(x)
            above = above+1;
            above_val(above, 1) = x;
            above_val(above, 2) = y;
        else
            under = under+1;
            under_val(under, 1) = x;
            under_val(under, 2) = y;
        end
        
        integral(i) = A * under/i;
    end
end
 
%---------a--------
xmin = 0;
xmax = 1;
ymin = 0;
ymax = 1;
N = 10000;
[res, above, under] = monte_inte(N, xmin, xmax, ymin, ymax, @funca);

figure(1); clf
hold on
xcords = linspace(xmin, xmax);
plot(xcords, funca(xcords));
plot(above(:, 1), above(:, 2), "r.");
plot(under(:, 1), under(:, 2), "g.");
title("Monte-Carlo Integration eines Viertelkreises")
hold off

figure(2); clf
xcords = 1:10000;
xcords = xcords';
hold on
plot(xcords, res.*4)
end_val = 4 * res(end);
title("Annäherung an Pi mit dem Endwert von "+end_val);
yline(pi)
hold off

%----------b---------
xmin = 1;
xmax = 2;
ymin = 0;
ymax = 2.5;
N = 10000;
[res, above, under] = monte_inte(N, xmin, xmax, ymin, ymax, @funcb);
fprintf("Ergebnis der einmaligen Monte-Carlo Integration: %f", res(end));

figure(3); clf
xcords = 1:10000;
xcords = xcords';
hold on
plot(xcords, res)
title("Monte-Carlo Integration von y = 1 + cos(e^{x^2}) | 1<x<2");
yline(0.885306)
hold off