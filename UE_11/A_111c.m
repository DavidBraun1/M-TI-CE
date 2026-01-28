clear

function out=f(x)
    x1 = x(1);
    x2 = x(2);
    out = x1^2 + x2^2 + 25*sin(x1)^2 + 25*sin(x2)^2;
end

[true_x, true_min_val] = fminsearch(@f,[0 0]);
fprintf("Echtes Minimum liegt bei x1=%d, x2=%d, mit den Wert y=%d\n", true_x, true_min_val);

n = 1;
T0 = 10;
delta = 2;
c = 0.999;
x1 = randi([-5 5],[1 1]);
x2 = randi([-5 5],[1 1]);
val = f([x1 x2]);
best = [0 0 Inf];
last = [x1 x2 val];
T(1) = T0;

while true

    x1 = last(1);
    x2 = last(2);
    val = last(3);

    %Abbruch bei 0,01, also 0,01 über dem echten Minimum oder Temp zu low
    if val < 0.01 || T(n) < 1
        break
    end

    %x1 und x2 um einen Wert verändern
    x1 = x1 + delta * randn;
    x2 = x2 + delta * randn;
    val = f([x1 x2]);

    %checken ob besser als best
    if val < best(3)
        best = [x1 x2 val];
    end

    if val < last(3)
        last = [x1 x2 val];      
    else
        r = rand;
        p = exp(-(val - last(3)) / (T(n)));
        if p > r
            last = [x1 x2 val];
        end
    end

    %Kicken
    if rand < 0.0005
        T(n) = T(n)+5;
    end

    n = n+1;
    T(n) = c * T(n-1);
end

%Fehler
error = sqrt((true_x(1)-best(1))^2 + (true_x(2)-best(2))^2);

%Ausgabe
fprintf("Ergebnis von Simulated Annealing:\n x1 = %f,\n x2 = %f,\n " + ...
    "value = %f,\n Fehler: %f\n", best, error);
plot(T, 'r-', 'LineWidth', 1);

