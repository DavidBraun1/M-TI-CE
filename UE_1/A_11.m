%Variabeln
T_u = 70;
T_0 = 200;
k = 0.015;
a = 1 - k * 1;
b = k * 1 * T_u;
n = 300;

%Init Temperatur
T_old = T_0;
T_d = zeros(1, n+1);
T_d(1) = T_0;

for i = 2:1:length(T_d)
    T_new = a * T_old + b;
    T_d(i) = T_new;
    T_old = T_new;
end

%Damit nur eine Spalte
%T_d = transpose(T_d);

figure(1)
plot(0:n, T_d)
grid on
title("Diskretes Abkühlungsmodell")
xlabel("Zeit in Zeitpunkt t")
ylabel("Temperatur");