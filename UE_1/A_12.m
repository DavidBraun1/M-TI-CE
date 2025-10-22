%Run A1.1
A_11;

T_a = T_0;

syms t
T_k(t) = (T_a - T_u) * exp(-k*t) + T_u;

hold on
plot(0:n, T_k(0:n))
title("Vergleich Abkühlungsmodell")
legend("Diskret", "Kontinuierlich(1)")
hold off

stamps = [10 25 50 100 200 300];

diffs = double(abs(T_d(stamps) - T_k(stamps+1)));
fprintf("\nAbweichung diskretes Modell vom kontinuierlichem:\n")
fprintf("t = %d: %1.4f\n", [stamps; diffs])

%Teil (2)
T_d2 = zeros(1, n+1);
for i=1:1:n+1
    T_d2(i) = a^i * T_0 + b * ((a^i - 1) / (a - 1));
end

diffs_2 = double(abs(T_d(stamps) - T_d2(stamps)));
fprintf("\nAbweichung diskretes Modell vom kontinuierlichem (2):\n")
fprintf("t = %d: %1.4f\n", [stamps; diffs_2])

hold on
plot(0:n, T_d2(1:n+1))
title("Vergleich Abkühlungsmodell")
legend("Diskret", "Kontinuierlich(1)", "Kontinuierlich(2)")
hold off